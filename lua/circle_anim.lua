require 'cairo'

-- Set the path to images below.
IMAGEPATH = "/home/<YOUR PATH HERE>/.conky/images/"


function conky_main()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, 
        conky_window.drawable, conky_window.visual, 
            conky_window.width, conky_window.height)
    cr = cairo_create(cs)
    
    UPDATE_INT = conky_info["update_interval"]
    MAX = math.floor(60/UPDATE_INT)
    
    run_gear({x=115, y=130, file='11.png', scale=0.46, dir=-1})
    run_gear({x=370, y=130, scale=0.6})
    run_gear({x=620, y=130, file='11.png', scale=0.46, dir=-1})
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr=nil
end --end main()

function run_gear(t)
    --[[
        Function to draw the gears.
        Parameters: 7
        <mandatory>
        x, y : image coords.
        <optional>
        file : image file to use (default 'gear1.png')
        max : maximum value for rotation. Note that higher values result in slower rotation. A good value is 300. (default MAX)
        dir : Direction of rotation. 1-clockwise, -1 anti. (default 1)
        scale : scaling factor. (default 1)
        tick (boolean): whether to mimic a tick or go smooth. Do not pass this arg if you want the smooth sweep.
    ]]--

    local file = t.file or '01.png'
    local max = t.max or MAX
    local dir = t.dir or 1
    local scale = t.scale or 1
    local tick = t.tick or false
    if tick then
        local arg = t.arg or "${time %S}"
        value = tonumber(conky_parse(arg))
    else
        local updates = tonumber(conky_parse("${updates}"))
        value = updates%max
    end
    local theta = dir*value*2*math.pi/MAX - math.pi/2
    put_image({x=t.x, y=t.y, file=file, theta=theta, scale=scale, rotate=true})
end


function put_image(t)
    --[[
        function to put the images and rotate them.
        Params:
        <mandatory>
        x,y : coords
        file : image file
        <optional>
        scale : scaling factor (default 1)
        rotate (boolean): when set to true, rotates the image by angle theta
        theta : angle to rotate the image by. Required if rotate is true
    ]]--

    local scale = t.scale or 1
    local image = cairo_image_surface_create_from_png (IMAGEPATH..t.file);
    local w = cairo_image_surface_get_width (image);
    local h = cairo_image_surface_get_height (image);
    cairo_save(cr)
    cairo_translate (cr, t.x, t.y);
    if t.rotate then cairo_rotate(cr, t.theta) end
    cairo_scale  (cr, scale, scale);
    cairo_translate (cr, -0.5*w, -0.5*h);
    cairo_set_source_surface (cr, image, 0, 0);
    cairo_paint (cr);
    cairo_surface_destroy (image);
    cairo_restore(cr)
end


function rgba_to_r_g_b_a(tcolor)
    local color,alpha=tcolor[1],tcolor[2]
    return ((color / 0x10000) % 0x100) / 255.,
        ((color / 0x100) % 0x100) / 255., (color % 0x100) / 255., alpha
end --end rgba
