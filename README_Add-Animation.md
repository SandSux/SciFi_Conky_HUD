__How to add an animation to conky__

I wrote this walk-through to assist others in what took me quite a bit of time to figure out on my own and the fact that there's just not anything cut-and-dry in reference to this subject, animations in conky. I hope that you find it helpful and that you're able to take your conky-ing to the next level! I love the opensource community and I am happy to help and to contribute where I can. Cheers!

__Add an animated image to your conky configuration__
 
Conky is not capable of displaying animated images (at least nothing that I've found says otherwise). But do not fret! For where there is a will, there is a way. So, In order to do so, the GIF must be decompiled into individual images, frame by frame, so that each image can be displayed opn your desktop at a specified update interval.

__Workflow:__

+ Choose or create an animated image to display your configuration
+ Download dependencies if not installed.
+ Decompile: Use Imagemagick and/or gifsicle (both GIF manipulation 
CLI's) to decompile the selected image into a series of individual, sequential images
+ Convert: Output images from decompilation will not have extensions and so will not be recognized by conky and as such, must be coverted to a recognizable file format (i.e. .png)


__Prerequisites:__
- Computer running Ubuntu/Debian Linux
- Packages (See Dependencies)
- A basic knowledge of Linux and Bash commands
- A basic knowledge of conky objects & variables
    + An exhaustive list of conky variables can be found here: 
        http://conky.sourceforge.net/variables.html\
- A functional conky configuration to compound on or add-to

__Dependencies:__
--conky-all
--jq
--lm-sensors
    -Usage: '$ sensors-detect'
--Imagemagick
    Imagemagick will decompile & convert at the same time with a single command
        `$ sudo apt-get update`
        `$ sudo apt-get install imagemagick php5-imagick`
--Gifsicle
    Another method, albeit a bit more labor intensive:
    -Gifsicle   https://www.npmjs.com/package/gifsicle
    `$ npm install --save gifsicle`
--Text Editor- Atom, Sublime, Pluma, Note++, etc...

__The Easy Way:__

__Decompilation and Conversion with a single command using Imagemagick__
    
    `$ convert -coalesce /Path/To/GIF.gif /Path/To/Output.png`

__The more rewarding, labor-intensive method:__

Decompile GIF image into individual images using gifsicle:
    
    `$ gifsicle --unoptimize --explode ~/Path/to/<FILE>.gif --output ~/OutputFolder/file-name`

Note: The output of this operation will result in a number of files. The number of frames in the original GIF will determine how many images there will be output.

__Convert images to PNG:__

--The output of gifsicle has created quite a few files that don't have a recognisable extensions so they must me converted to PNG so that conky may use them. 

As much fun as it would be to use the GNU Image Manipulation Program (GIMP) to convert each image and export them, one by one. It is much faster and easier to use Imagemagick's convert feature:

    `$ convert ~/Path/To/Files.* ~/Path/to/OutputFile.p
(The asterisk denotes that ALL files named "Files" will be converted)

--Now that all of the images are converted and numbered sequentially, we can go ahead and write them into our animation.

__Variables:__

--*(if_updatenr)*- If it's the UPDATENR-th time that conky updates, display everything between *if_updatenr* and the matching *endif.* The counter resets when the highest UPDATENR is reached. Example : `"{if_updatenr 1}foo $endif{if_updatenr 2}bar$endif{$if_updatenr 4}$endif"` shows foo 25% of the time followed by bar 25% of the time followed by nothing the other half of the time.

--*(endif)*- Ends an $if block

__Example Configuration:__

Example video.rc file:

--Pay attention to the paths to outside files written into your configurations. They must always be verbatim and absolute. If the case of one letter is wrong or if something is off in the path at all, it won't work.

conky.config = {
-- Conky settings --
    update_interval = .18,                          --update time in seconds
    background = true,                              --translucent background
    cpu_avg_samples = 2,                            --cpu for more accurate monitoring
    net_avg_samples = 2,                            --internet for accurate monitoring
    diskio_avg_samples = 2,                         --drive for more accurate monitorinmg
    override_utf8_locale = true,                    --overrides character encoding
    double_buffer = true,                           --reduces frame flicker
    no_buffers  = false,
    text_buffer_size = 256,                         --text buffer size
    imlib_cache_size = 10,
    max_user_text = 15000,
    format_human_readable = true,                   --units in non-bytes

-- Window specifications --
    own_window = true,                              --turn on your own window settings
    own_window_type = 'normal',                     --window types, override = window manager rules do not apply, desktop = unedited panel = always top, dock = always over, normal = normal
    own_window_transparent = false,                 --conky window becomes transparent
    own_window_argb_visual = true,                  --trsansparent window
    own_window_argb_value = 0,                      --degree of transparency 0-255
    own_window_hints = 'undecorated,sticky,below,skip_taskbar,skip_pager',  --window properties below = skip_taskbar = ignore tray undecorated = remove frame and buttons override = window manager override sticky = all workspaces
    own_window_title = 'video',
    minimum_width = 512,                            --minimum width
    minimum_height = 301,                           --minimum height
    alignment = 'top_left',                         --top right corner
    gap_x = 280,                                    --x direction shift
    gap_y = 30,                                     --y direction shift

-- Graphics settings --
    draw_shades = false,                            --test shading
    draw_outline = false,                           --draw around
    draw_borders = false,                           --draw a rectangular frame
    draw_graph_borders = false,                     --frame around the graph
    border_width = 0,                               --thickness of the fame

-- Text settings --
    use_xft = true,                                 --antialiasing
    font = 'Ubuntu:size=7',                         --default font type
    color0 = '39c9c4',                              --predetermined color
    color1 = 'd59704',
    color2 = '794e64',

    template1 = '~/.conky/SciFi_Conky_HUD/images/anim18/digram-',
    template2 = '-p 9,12',
    
};

`conky.text = [[
${image ~/.conky/images/video.png -p 0,0}
${template2}}${if_updatenr 1}${image ${template1}0.png 
${template2}}${endif}${if_updatenr 2}${image ${template1}1.png ${template2}}${endif}${if_updatenr 3}${image ${template1}2.png ${template2}}${endif}${if_updatenr 4}${image ${template1}3.png ${template2}}${endif}${if_updatenr 5}${image ${template1}4.png ${template2}}${endif}${if_updatenr 6}${image ${template1}5.png ${template2}}${endif}${if_updatenr 7}${image ${template1}6.png ${template2}}${endif}${if_updatenr 8}${image ${template1}7.png ${template2}}${endif}${if_updatenr 9}${image ${template1}8.png ${template2}}${endif}${if_updatenr 10}${image ${template1}9.png 
${template2}}${endif}${if_updatenr 11}${image ${template1}10.png 
${template2}}${endif}${if_updatenr 12}${image ${template1}11.png ${template2}}${endif}${if_updatenr 13}${image ${template1}12.png ${template2}}${endif}${if_updatenr 14}${image ${template1}13.png ${template2}}${endif}${if_updatenr 15}${image ${template1}14.png ${template2}}${endif}${if_updatenr 16}${image ${template1}15.png ${template2}}${endif}${if_updatenr 17}${image ${template1}16.png ${template2}}${endif}${if_updatenr 18}${image ${template1}17.png ${template2}}${endif}${if_updatenr 19}${image ${template1}18.png ${template2}}${endif}${if_updatenr 20}${image ${template1}19.png 
${template2}}${endif}${if_updatenr 21}${image ${template1}20.png 
${template2}}${endif}${if_updatenr 23}${image ${template1}21.png ${template2}}${endif}${if_updatenr 24}${image ${template1}22.png ${template2}}${endif}${if_updatenr 25}${image ${template1}23.png ${template2}}${endif}${if_updatenr 26}${image ${template1}24.png ${template2}}${endif}${if_updatenr 27}${image ${template1}25.png ${template2}}${endif}${if_updatenr 28}${image ${template1}26.png ${template2}}${endif}${if_updatenr 29}${image ${template1}27.png
${template2}}${endif}${if_updatenr 30}${image ${template1}28.png 
${template2}}${endif}${if_updatenr 31}${image ${template1}29.png 
${template2}}${endif}${if_updatenr 32}${image ${template1}30.png 
${template2}}${endif}${if_updatenr 33}${image ${template1}31.png ${template2}}${endif}${if_updatenr 34}${image ${template1}32.png ${template2}}${endif}${if_updatenr 35}${image ${template1}33.png ${template2}}${endif}${if_updatenr 36}${image ${template1}34.png ${template2}}${endif}${if_updatenr 37}${image ${template1}35.png ${template2}}${endif}${if_updatenr 38}${image ${template1}36.png ${template2}}${endif}${if_updatenr 39}${image ${template1}37.png ${template2}}${endif}${if_updatenr 40}${image ${template1}38.png ${template2}}${endif}${if_updatenr 41}${image ${template1}39.png 
${template2}}${endif}${if_updatenr 42}${image ${template1}40.png 
${template2}}${endif}${if_updatenr 43}${image ${template1}41.png ${template2}}${endif}${if_updatenr 44}${image ${template1}42.png ${template2}}${endif}${if_updatenr 45}${image ${template1}43.png ${template2}}${endif}${if_updatenr 46}${image ${template1}44.png ${template2}}${endif}${if_updatenr 47}${image ${template1}45.png ${template2}}${endif}${if_updatenr 48}${image ${template1}46.png ${template2}}${endif}${if_updatenr 49}${image ${template1}47.png ${template2}}${endif}${if_updatenr 50}${image ${template1}48.png ${template2}}${endif}${if_updatenr 51}${image ${template1}49.png 
${template2}}${endif}${if_updatenr 52}${image ${template1}50.png 
${template2}}${endif}${if_updatenr 52}${image ${template1}51.png ${template2}}${endif}${if_updatenr 53}${image ${template1}52.png ${template2}}${endif}${if_updatenr 54}${image ${template1}53.png ${template2}}${endif}${if_updatenr 55}${image ${template1}54.png ${template2}}${endif}${if_updatenr 56}${image ${template1}55.png ${template2}}${endif}${if_updatenr 57}${image ${template1}56.png ${template2}}${endif}${if_updatenr 58}${image ${template1}57.png ${template2}}${endif}${if_updatenr 59}${image ${template1}58.png ${template2}}${endif}${if_updatenr 60}${image ${template1}59.png 
${template2}}${endif}${if_updatenr 61}${image ${template1}60.png 
${template2}}${endif}${if_updatenr 62}${image ${template1}61.png ${template2}}${endif}${if_updatenr 63}${image ${template1}62.png ${template2}}${endif}${if_updatenr 64}${image ${template1}63.png ${template2}}${endif}${if_updatenr 65}${image ${template1}64.png ${template2}}${endif}${if_updatenr 66}${image ${template1}65.png ${template2}}${endif}${if_updatenr 67}${image ${template1}66.png ${template2}}${endif}${if_updatenr 68}${image ${template1}67.png ${template2}}${endif}${if_updatenr 69}${image ${template1}68.png ${template2}}${endif}${if_updatenr 70}${image ${template1}69.png 
${template2}}${endif}${if_updatenr 71}${image ${template1}70.png 
${template2}}${endif}${if_updatenr 72}${image ${template1}71.png ${template2}}${endif}${if_updatenr 73}${image ${template1}72.png ${template2}}${endif}${if_updatenr 74}${image ${template1}73.png ${template2}}${endif}${if_updatenr 75}${image ${template1}74.png ${template2}}${endif}${if_updatenr 76}${image ${template1}75.png ${template2}}${endif}${if_updatenr 77}${image ${template1}76.png ${template2}}${endif}${if_updatenr 78}${image ${template1}77.png ${template2}}${endif}${if_updatenr 79}${image ${template1}78.png ${template2}}${endif}${if_updatenr 80}${image ${template1}79.png 
${template2}}${endif}${if_updatenr 81}${image ${template1}80.png 
${template2}}${endif}${if_updatenr 82}${image ${template1}81.png ${template2}}${endif}${if_updatenr 83}${image ${template1}82.png ${template2}}${endif}${if_updatenr 84}${image ${template1}83.png ${template2}}${endif}${if_updatenr 85}${image ${template1}84.png ${template2}}${endif}${if_updatenr 86}${image ${template1}85.png ${template2}}${endif}${if_updatenr 87}${image ${template1}86.png ${template2}}${endif}${if_updatenr 88}${image ${template1}87.png ${template2}}${endif}${if_updatenr 89}${image ${template1}88.png ${template2}}${endif}${if_updatenr 90}${image ${template1}89.png 
${template2}}${endif}${if_updatenr 91}${image ${template1}90.png 
${template2}}${endif}${if_updatenr 92}${image ${template1}91.png ${template2}}${endif}${if_updatenr 93}${image ${template1}92.png ${template2}}${endif}${if_updatenr 94}${image ${template1}93.png ${template2}}${endif}${if_updatenr 95}${image ${template1}94.png ${template2}}${endif}${if_updatenr 96}${image ${template1}95.png 
${template2}}${endif}`
]];
