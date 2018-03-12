---
--==============================================================================
--  				Cups and Saucers
--                               Lua conky script
--
--  author  : Abu Yahya
--  license : Distributed under the terms of GNU GPL v3
--  30.05.2012
-- v.1.0.1
--==============================================================================
require 'cairo'
--------------------------------------------------------------------------------
----Adjustable Settings 
coffee_table = {
    {
    name='time2',                   arg='%I.%M',                    max_value=12,
    x=90,                          y=230,
    cup_radius=35,
    cup_wall_thickness=90,
    cup_bg_clr=0xffffff,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=70,              handle_circ=1,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    graduation_radius=-60+124,
    graduation_thickness=8,        graduation_mark_circ=1.5,
    graduation_mark_angle=30,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=4,            thick_saucer_circ=11/12,    
    saucer_radius=57,	           thin_saucer_circ=11/12,    
    saucer_fg_clr=0x6fd4ff,        saucer_fg_alpha=0.5, 
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
    inner_saucer=true, 
    txt_weight=0,                  txt_size=0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='',                    caption2='',
    },
    {
    name='time',                   arg='%M',                    max_value=60,
    x=90,                          y=230,
    cup_radius=55,
    cup_wall_thickness=120,
    cup_bg_clr=0xffffff,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    graduation_radius=-60+123,
    graduation_thickness=10,       graduation_mark_circ=2.5,
    graduation_mark_angle=90,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    handle_length=110,             handle_circ=1,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    saucer_thickness=4,            thick_saucer_circ=11/12,
    saucer_radius=72,	           thin_saucer_circ=11/12,    
    saucer_fg_clr=0x6fd4ff,        saucer_fg_alpha=0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=0.0,
    caption='',                    caption2='',
    },
    {
    name='time',                   arg='%S',                    max_value=60,
    x=90,                          y=230,
    cup_radius=59,
    cup_wall_thickness=120,
    cup_bg_clr=0xffffff,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,      	   cup_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    handle_length=118,             handle_circ=1,
    graduation_radius=-60+125,
    graduation_thickness=6,        graduation_mark_circ=0.5,
    graduation_mark_angle=6,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=4,		       thick_saucer_circ=1,
    saucer_radius= 65,             thin_saucer_circ=11/12,    
    saucer_fg_clr=0x6fd4ff,        saucer_fg_alpha=0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=0.0,
    caption='',                    caption2='',
},
    {
    name='time',                   arg='%S',                    max_value=4,
    x=50,                          y=50,
    cup_radius=59,
    cup_wall_thickness=120,
    cup_bg_clr=0xffffff,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,      	   cup_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    handle_length=118,             handle_circ=100,
    graduation_radius=20,
    graduation_thickness=6,        graduation_mark_circ=0.5,
    graduation_mark_angle=6,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,		       thick_saucer_circ=1,
    saucer_radius= 20,             thin_saucer_circ=11/12,    
    saucer_fg_clr=0x6fd4ff,        saucer_fg_alpha=0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
},
    {
    name='time',                   arg='%S',                    max_value=3,
    x=130,                          y=50,
  --  cup_radius=59,
  --  cup_wall_thickness=120,
    cup_bg_clr=0xffffff,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,      	   cup_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    handle_length=118,             handle_circ=100,
    graduation_radius=20,
    graduation_thickness=6,        graduation_mark_circ=0.5,
    graduation_mark_angle=6,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,		       thick_saucer_circ=1,
    saucer_radius= 20,             thin_saucer_circ=11/12,    
    saucer_fg_clr=0x6fd4ff,        saucer_fg_alpha=0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
},
}
  
--Fixed code -do not edit unless you know what you are doing------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- converts color in hexa to decimal
function rgb_to_r_g_b(clr, alpha)
    return ((clr / 0x10000) % 0x100) / 255., ((clr / 0x100) % 0x100) / 255., (clr % 0x100) / 255., alpha
end
-------------------------------------------------------------------------------
------------------------------------------------------------------------
-- displays cups and saucers
local function draw_coffee_table(display, data, value) 
     max_value = data['max_value']
     x, y = data['x'], data['y']
     if x==nil then x=conky_window.width/2 end
     if y==nil then y=conky_window.height/2 end	
     cup_radius = data['cup_radius']    
     if cup_radius==nil then cup_radius=conky_window.width/4 end	
     cup_wall_thickness = data['cup_wall_thickness']
     if cup_wall_thickness==nil then cup_wall_thickness=20 end
     handle_length, handle_circ = data['handle_length'], data['handle_circ']
     if handle_length==nil then handle_length=20 end
     if handle_circ==nil then handle_circ=1 end
     cup_start_angle = data['cup_start_angle']
     if cup_start_angle == nil then cup_start_angle =0 end
     total_angle = data['total_angle']
     if total_angle == nil then total_angle=360 end
     cup_sector_angle = (math.abs(total_angle))/max_value  
     cup_end_angle = total_angle + cup_start_angle
     cup_bg_clr, cup_bg_alpha = data['cup_bg_clr'], data['cup_bg_alpha']
     if cup_bg_clr==nil then cup_bg_clr =0xffffff end
     cup_fg_clr, cup_fg_alpha = data['cup_fg_clr'], data['cup_fg_alpha']
     if cup_fg_clr==nil then cup_fg_clr =0xffffff end
     if cup_fg_alpha==nil then cup_fg_alpha=0 end
     handle_fg_clr, handle_fg_alpha = data['handle_fg_clr'], data['handle_fg_alpha']  
     if handle_fg_clr==nil then handle_fg_clr = 0xffffff end
     if handle_fg_alpha==nil then handle_fg_alpha=0 end
     
     saucer_radius = data['saucer_radius']
     if saucer_radius==nil then saucer_radius=conky_window.width/2 end 
     total_saucer_angle=data['total_saucer_angle']
     if total_saucer_angle==nil then total_saucer_angle=360 end 
     saucer_sector_angle=(math.abs(total_saucer_angle))/max_value  
     saucer_thickness = data['saucer_thickness']
     if saucer_thickness==nil then saucer_thickness=6 end
     saucer_fg_clr = data['saucer_fg_clr']
     if saucer_fg_clr ==nil then saucer_fg_clr=0 end
     saucer_fg_alpha = data['saucer_fg_alpha']
     if saucer_fg_alpha ==nil then saucer_fg_alpha=0 end
     
     saucer_mark_fg_alpha = data['saucer_mark_fg_alpha']
     if saucer_mark_fg_alpha ==nil then saucer_mark_fg_alpha=0 end
     saucer_mark_fg_clr = data['saucer_mark_fg_clr']
     if saucer_mark_fg_clr ==nil then saucer_mark_fg_clr=0xffffff end
     thick_saucer_circ = data['thick_saucer_circ']
     if thick_saucer_circ==nil then thick_saucer_circ =0.9 end
     thin_saucer_circ = data['thin_saucer_circ']
     if thin_saucer_circ==nil then thin_saucer_circ =0.9 end
     inner_saucer = data['inner_saucer']
     
     graduation_radius = data['graduation_radius']
     if graduation_radius ==nil then graduation_radius = conky_window.width/3 end
     graduation_thickness, graduation_mark_circ = data['graduation_thickness'], data['graduation_mark_circ']
     if graduation_thickness ==nil then graduation_thickness = 2 end
     if graduation_mark_circ ==nil then graduation_mark_circ = 1 end
     graduation_mark_angle = data['graduation_mark_angle']
     if graduation_mark_angle == nil then graduation_mark_angle = total_angle/10 end
     graduation_fg_clr, graduation_fg_alpha = data['graduation_fg_clr'], data['graduation_fg_alpha']
     if graduation_fg_clr ==nil then graduation_fg_clr= 0xffffff end
     if graduation_fg_alpha==nil then graduation_fg_alpha =0 end
     
     
     txt_weight, txt_size = data['txt_weight'], data['txt_size']
     if txt_weight == nil then txt_weight=1 end
     if txt_size == nil then txt_size=8 end
     txt_fg_clr, txt_fg_alpha = data['txt_fg_clr'], data['txt_fg_alpha']
     if txt_fg_clr ==nil then txt_fg_clr= 0xffffff end
     if txt_fg_alpha==nil then txt_fg_alpha =0 end
     caption = data['caption']
     if caption==nil then caption='' end
     caption2 = data['caption2']
     if caption2==nil then caption2='' end
     xtxt, ytxt= data ['xtxt'], data['ytxt']
     if xtxt ==nil then xtxt=0 end
     if ytxt ==nil then ytxt=0 end

--convert degree to rad and rotate (0 degree is top/north)
    function angle_to_position(start_angle, current_angle)    
      if total_angle < 0 then 
        local pos = start_angle - current_angle
        return ( ( pos * (math.pi / 180) ) - (math.pi / 2) )
      else 
        local pos = current_angle + start_angle 
        return ( ( pos * (math.pi / 180) ) - (math.pi / 2) ) 
      end   
    end
--cup centre background    
  if cup_bg_alpha >0   then
    if total_angle < 0 then
      cairo_arc_negative(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_end_angle, 0))
    else
      cairo_arc(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_start_angle, cup_end_angle))
    end
    cairo_set_source_rgba(display, rgb_to_r_g_b(cup_bg_clr, cup_bg_alpha))
    cairo_set_line_width(display, cup_wall_thickness)
    cairo_stroke(display)
  end 
--cup wall fg    
  if cup_fg_alpha > 0 then 
   local fg_stop_arc = (cup_sector_angle * value)
    if total_angle < 0 then
	cairo_arc_negative(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_start_angle, fg_stop_arc))
    else
	cairo_arc(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_start_angle, fg_stop_arc))
    end
    cairo_set_source_rgba(display, rgb_to_r_g_b(cup_fg_clr, cup_fg_alpha))
    cairo_set_line_width(display, cup_wall_thickness)
    cairo_stroke(display)
  end
-- cup handle
  if handle_fg_alpha>0 then 
    local start_handle = (cup_sector_angle * value) - (handle_circ*0.5)
    local stop_handle = (cup_sector_angle * value) +  (handle_circ*0.5)
    if total_angle < 0 then
	cairo_arc_negative(display, x, y, cup_radius, angle_to_position(cup_start_angle, start_handle), angle_to_position(cup_start_angle, stop_handle))
    else
	cairo_arc(display, x, y, cup_radius, angle_to_position(cup_start_angle, start_handle), angle_to_position(cup_start_angle, stop_handle))
    end
    cairo_set_line_width(display, handle_length)    
    cairo_set_source_rgba(display, rgb_to_r_g_b(handle_fg_clr, handle_fg_alpha))
    cairo_stroke(display)
  end
--saucers   
---thick saucer     
    if saucer_fg_alpha > 0 and (thin_saucer_circ >0 or thick_saucer_circ > 0)
      then 
	if value < (max_value/2) 
        then j = value + ((max_value*total_saucer_angle)/720)
        else j = value - ((max_value*total_saucer_angle)/720)
	end
	
    local start_saucer = (saucer_sector_angle * j) - (value*saucer_sector_angle*0.5*thick_saucer_circ)
    local stop_saucer = (saucer_sector_angle * j) + (value*saucer_sector_angle*0.5*thick_saucer_circ)
    if total_angle < 0 then
	cairo_arc_negative(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_saucer), angle_to_position(cup_start_angle, stop_saucer))
    else
	cairo_arc(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_saucer), angle_to_position(cup_start_angle, stop_saucer))
    end
    cairo_set_source_rgba(display, rgb_to_r_g_b(saucer_fg_clr, saucer_fg_alpha))
    cairo_set_line_width(display, saucer_thickness)
    cairo_stroke(display)
    --thin saucer
      if inner_saucer == true 
      then rt = (saucer_radius - 0.5) + (0.5 * saucer_thickness)
      else rt = (saucer_radius + 0.5) - (0.5 * saucer_thickness)  
      end
    local start_thin_saucer = (saucer_sector_angle * j) - (max_value *0.5*saucer_sector_angle*thin_saucer_circ)
    local stop_thin_saucer = (saucer_sector_angle * j) + (max_value *0.5*saucer_sector_angle*thin_saucer_circ)
    if total_angle < 0 then
	cairo_arc_negative(display, x, y, rt, angle_to_position(cup_start_angle, start_thin_saucer), angle_to_position(cup_start_angle, stop_thin_saucer))
    else
	cairo_arc(display, x, y, rt, angle_to_position(cup_start_angle, start_thin_saucer), angle_to_position(cup_start_angle, stop_thin_saucer))
    end
    cairo_set_source_rgba(display, rgb_to_r_g_b(saucer_fg_clr, saucer_fg_alpha))
    cairo_set_line_width(display, 1)
    cairo_stroke(display)
   end
--saucer mark
    if saucer_mark_fg_alpha > 0 then 
	local start_cm = (saucer_sector_angle * value) - (handle_circ *0.5 )
	local stop_cm = (saucer_sector_angle * value) + (handle_circ *0.5 )
	if total_angle < 0 then
	  cairo_arc_negative(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_cm), angle_to_position(cup_start_angle, stop_cm))
	else
	  cairo_arc(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_cm), angle_to_position(cup_start_angle, stop_cm))
	end
	cairo_set_source_rgba(display, rgb_to_r_g_b(saucer_mark_fg_clr, saucer_mark_fg_alpha))
        cairo_set_line_width(display, saucer_thickness)
        cairo_stroke(display)
    end 
--graduation mark 
     if graduation_radius > 0 and graduation_thickness > 0 and graduation_mark_angle > 0 then
        number_graduation = (math.abs(total_angle) +1)/ graduation_mark_angle
        local start_arc_grad = 0
        local stop_arc_grad = 0
	local i = 0
        while i < number_graduation do            
            local start_arc_grad = (graduation_mark_angle * (i)) - (graduation_mark_circ *0.5)
            local stop_arc_grad = (graduation_mark_angle * (i)) + (graduation_mark_circ *0.5)
            if total_angle < 0 then
	      cairo_arc_negative(display, x, y, graduation_radius, angle_to_position(cup_start_angle, start_arc_grad), angle_to_position(cup_start_angle, stop_arc_grad))
	    else
	      cairo_arc(display, x, y, graduation_radius, angle_to_position(cup_start_angle, start_arc_grad), angle_to_position(cup_start_angle, stop_arc_grad))
	    end
	    cairo_set_source_rgba(display,rgb_to_r_g_b(graduation_fg_clr,graduation_fg_alpha))
            cairo_set_line_width(display, graduation_thickness)
	    cairo_stroke(display)            
            i = i + 1
        end
    end   
-- text
  if txt_fg_alpha>0 then 
    cairo_select_font_face (display, "hooge 05_53", CAIRO_FONT_SLANT_NORMAL, txt_weight);
    cairo_set_font_size (display,txt_size)
    cairo_set_source_rgba (display, rgb_to_r_g_b(txt_fg_clr, txt_fg_alpha))
    cairo_move_to (display,x+xtxt,y+ytxt)
    cairo_show_text (display, caption ) cairo_show_text (display,value)cairo_show_text (display, caption2 )
    cairo_stroke (display)
  end
end
-------------------------------------------------------------------------------
-- loads data and displays table_settings

function display_coffee_table(display)
    local function load_coffee_table(display, data)
        local str, value = '', 0       
	if data['name'] == 'time2' then
	    local max_value = data['max_value']
            str = string.format('${time %s}', data['arg'])
            str = conky_parse(str)
            local value2 = tonumber(str:sub(0,2))
	    if value2 == max_value then value2 = 0 end
	    value = value2 + (tonumber(str:sub(4,5))/60)        	    
	else
            str = string.format('${%s %s}',data['name'], data['arg'])
            str = conky_parse(str)
            value = tonumber(str)
        end 	
        if value == nil then value = 0 end
        draw_coffee_table(display, data, value)
    end
    for i in pairs(coffee_table) do
        load_coffee_table(display, coffee_table[i])
    end
end
-------------------------------------------------------------------------------
runscheck = 0 -- fix for draw shades running script twice on every update
function conky_main()
    if conky_window == nil then 
        return
    end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    local updates = conky_parse('${updates}')
    update_num = tonumber(updates)
    if update_num > 5 then
      cairo_set_antialias (display, CAIRO_ANTIALIAS_SUBPIXEL)
      display_coffee_table(display)
      cairo_set_antialias (display, CAIRO_ANTIALIAS_DEFAULT)
    end    
    cairo_surface_destroy(cs)
    cairo_destroy(display)
end
