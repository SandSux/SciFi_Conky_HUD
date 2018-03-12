require 'cairo'

----------------START OF PARAMETERS ----------
function conky_main_bars()
	local bars_settings={
		{	--simple lmulti block bar with alarm value
			name="time",
			arg="%S",
			max=59,
			alarm=50,
			bg_colour={0x00ff00,0.25},
			fg_colour={0x00ff00,1},
			alarm_colour={0xff0000,1},
			x=10,y=300,
			blocks=20,
			height=8,width=25,
			draw_me=true,
		},	

		{	--multi block bar with gradiant effect and alarm value (simulates a round bar)
			name="time",
			arg="%S",
			max=59,
			alarm=50,
			bg_colour={0x00ff00,0},
			fg_colour={0x00ff00,0},
			alarm_colour={0xff0000,0},
			x=40,y=300,
			blocks=20,
			height=8,width=25,
			led_effect="r",
			fg_led={0x00ff00,1},
			alarm_led={0xff0000,1},
			bg_led={0x00ff00,0.25},
			draw_me=true,
		},	

		{	--simple multi block bar width gradint in enlighted blocks
			name="time",
			arg="%S",
			max=59,
			alarm=50,
			bg_colour={0x00ff00,0.25},
			fg_colour={0x00ff00,1},
			alarm_colour={0xff0000,1},
			x=70,y=300,
			blocks=20,
			height=8,width=25,
			smooth=true,
			mid_colour={{0.33,0x0000FF,1},{0.66,0xffff00,1}}

		},	

		{	-- Simple single block bar, with alarm value
			name="time",
			arg="%S",
			max=59,
			alarm=50,
			bg_colour={0x00ff00,0.25},
			fg_colour={0x00ff00,1},
			alarm_colour={0xff0000,1},
			x=100,y=300,
			blocks=1,
			height=200,width=25,
			smooth=true,
			mid_colour={{0.5,0xffff00,1}}

		},	
				
		{	-- another multiblock bar with gradiant in enlighted blocks
			name="time",
			arg="%S",
			max=59,
			alarm=30,
			bg_colour={0xff00ff,0.2},
			fg_colour={0x00ff00,1},
			alarm_colour={0xff0000,1},
			x=130,y=300,
			blocks=6,
			height=20,width=20,
			smooth=true,
		},	
				
		{	-- multi block bar with round blocks
			name="time",
			arg="%S",
			max=59,
			alarm=30,
			bg_colour={0xff00ff,0.2},
			fg_colour={0x00ff00,1},
			alarm_colour={0xff0000,1},
			x=165,y=300,
			blocks=6,
			height=20,width=0,
			cap="r",
		},	
		
		{	-- example of a skew bar (y)
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffff00,0.5},
			fg_colour={0xffff00,1},
			x=200,y=285,
			space=1,
			cap="e",
			skew_y=15,
		},

		{	-- multi block bar with gradiants in background and enlighted blocks
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0x00ffff,0.5},
			fg_colour={0x00ffff,0.5},
			led_effect="e",
			bg_led	={0x0000ff,1},
			fg_led	={0xffff00,1},
			x=200,y=250,

		},

		{	--multi block bar with reflectionb
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0x00ffff,0.5},
			fg_colour={0x00ff00,0.8},
			bg_led	={0x0000ff,1},
			fg_led	={0xffff00,1},
			x=200,y=160,
			reflection_alpha=0.8,
			reflection="r"
		},

		{	-- single block bar, skew and with reflecting + gradient
			name="time",
			arg="%S",
			max=59,
			bg_colour={0x00ff33,0},
			fg_colour={0xffff00,0},
			bg_led={0x00ff33,0.5},
			fg_led={0xffff00,1},
			led_effect="r",
			blocks=1,--20,
			x=200,
			y=75,
			height=150,--,
			width=40,
			angle=90,
			led_effect="e",
			reflection_alpha=1,
			reflection="r",
			space=1,
			skew_x=15,
		},	
		
		{	-- angled multi bar with alarm value and gradiant
			name="time",
			arg="%S",
			max=59,
			alarm=50,
			bg_colour={0x00ff33,0},
			fg_colour={0xffff00,0},
			alarm_colour={0xFF0000,0},
			bg_led={0x00ff33,0.5},
			fg_led={0xffff00,1},
			alarm_led={0xFF0000,1},
			blocks=10,
			x=400,
			y=340,
			height=15,
			cap="b",
			angle_bar=45,
			led_effect="a",
			radius=30,
		},	


		{	--multi block bar with gradiant (circle) effect
			name="time",
			arg="%S",
			max=59,
			bg_colour={0xff00ff,0},
			fg_colour={0x00ff00,0},
			bg_led={0xff00ff,0.5},
			fg_led={0x00ff00,1},
			led_effect="r",
			x=50,y=350,
			blocks=10,
			space=5,
			height=50,width=40,
			angle=90,
			cap="r",
		},	

		{	-- large bar of multi blocks
			name="time",
			arg="%S",
			max=59,
			bg_colour={0x0000ff,0.5},
			fg_colour={0x00ff00,1},
			mid_colour={{0.25,0xFFFF00,1},{0.5,0xFFFFFF,1},{0.75,0xFF0000,1}},
			x=25,y=390,
			blocks=50,
			space=1,
			height=10,width=10,
			angle=90,
			smooth = true,
		},	
		-- EXTENTIONS SHOWOFF :)
		{	-- Simple bar with handle
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=600,y=20,
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			handle_show=true,
			handle_size=10,
			handle_color={0x77B753,1}
		},
		{	-- Simple bar with handle (skew)
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=600,y=50,
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			handle_show=true,
			handle_size=10,
			handle_color={0x77B753,1},
			skew_y=20
		},
		{	-- Simple bar with enlarged handle and txt
			name="time",
			arg="%S",
			max=59,
			angle=-90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=800,y=100,
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			txt_show=true,
			txt_angle=-300,		-- i have to admit it's a bit anoying finding the right angle and offset, offsety but eventualy it is always possible
			txt_color={0x77B753,1},
			txt_size=15,
			txt_offset=10,
			txt_offsety=15,
			txt_flip=true,
			txt_font="GE Inspira",
			handle_show=true,
			handle_size=5,
			handle_color={0x77B753,1},
			handle_length=30,
			handle_flip=true
		},
		{	-- Simple bar with handle (skewx and skew y)
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=700,y=190,
			blocks=1,
			height=100,
			width=20,
			smooth=true,
			handle_show=true,
			handle_size=5,
			handle_color={0x77B753,1},
			skew_x=20,
			skew_y=20,
		},
-- Bar consisting of 2 separated bars
		{	-- above part
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=850,y=40,
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			txt_show=true,
			txt_angle=300,
			txt_color={0x77B753,1},
			txt_size=15,
			txt_offset=0,
			txt_offsety=2,
			txt_flip=true,
			txt_font="GE Inspira",
			handle_show=true,
			handle_size=10,
			handle_color={0x77B753,1},
			handle_length=30,
			handle_flip=true;
			skew_y=-40
		},
		{	-- down part
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=865,y=60,	--note you have to adjuge the position to make it work
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			handle_show=true,
			handle_size=10,
			handle_color={0x77B753,1},
			handle_length=30,
			handle_flip=false;
			skew_y=40
		},
-- end of dual bar

-- again a multi bar (make any figure you want!)
		{	-- Simple bar with handle
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=850,y=120,
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			handle_show=true,
			handle_size=10,
			handle_color={0x77B753,1},
			txt_show=true,
			txt_angle=300,
			txt_color={0x77B753,1},
			txt_size=15,
			txt_offset=-15,
			txt_offsety=2,
			txt_flip=true,
			txt_font="GE Inspira",
			txt_add=" txt here",
		},
		{	-- Simple bar with handle
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=850,y=140,
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			handle_show=true,
			handle_size=10,
			handle_color={0x77B753,1},
			skew_y=-90
		},
		{	-- Simple bar with handle
			name="time",
			arg="%S",
			max=59,
			angle=90,
			bg_colour={0xffffff,0.25},
			fg_colour={0xFFFFFF,1},
			x=881,y=160,
			blocks=1,
			height=200,
			width=20,
			smooth=true,
			handle_show=true,
			handle_size=10,
			handle_color={0x77B753,1},
			skew_y=-20,
			reflection_alpha=1,
			reflection="r",
		},
-- end of multi bar

		{	-- Multi block bar with txt and txt alarm enabled
			name="time",
			arg="%S",
			max=59,
			alarm=50,
			bg_colour={0x00ff00,0.25},
			fg_colour={0x00ff00,1},
			alarm_colour={0xff0000,1},
			x=600,y=390,
			blocks=23,
			space=3,
			height=8,width=25,
			draw_me=true,
			txt_show=true,
			txt_angle=0,
			txt_color={0x77B753,1},
			txt_size=15,
			txt_offset=10,
			txt_flip=false,
			txt_font="GE Inspira",
			txt_add=" Sec",
			txt_alarm=true
		},
		{	-- multi block bar with round blocks and txt
			name="time",
			arg="%S",
			max=59,
			alarm=30,
			bg_colour={0xff00ff,0.2},
			fg_colour={0x00ff00,1},
			alarm_colour={0xff0000,1},
			x=700,y=390,
			blocks=6,
			height=20,width=0,
			cap="r",
			txt_show=true,
			txt_angle=0,
			txt_color={0x77B753,1},
			txt_size=15,
			txt_offset=15,
			txt_offsety=5, --to compensate circle middle
			txt_flip=false,
			txt_font="GE Inspira",
			txt_add=" Sec",
			txt_alarm=true,	
			txt_weight=5
		},
						
	}
	
-----------END OF PARAMETERS--------------


    
	if conky_window == nil then return end
	
	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	
	cr = cairo_create(cs)    
	--prevent segmentation error when reading cpu state
    if tonumber(conky_parse('${updates}'))>3 then
        for i in pairs(bars_settings) do
        	
        	draw_multi_bar_graph(bars_settings[i])
        	
        end
    end
	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil

end

function draw_multi_bar_graph(t)
	cairo_save(cr)
	--check values
	if t.draw_me == true then t.draw_me = nil end
	if t.draw_me ~= nil and conky_parse(tostring(t.draw_me)) ~= "1" then return end	
	if t.name==nil and t.arg==nil then 
		print ("No input values ... use parameters 'name' with 'arg' or only parameter 'arg' ") 
		return
	end
	if t.max==nil then
		print ("No maximum value defined, use 'max'")
		return
	end
	if t.name==nil then t.name="" end
	if t.arg==nil then t.arg="" end

	--set default values	
	if t.x == nil		then t.x = conky_window.width/2 end
	if t.y == nil		then t.y = conky_window.height/2 end
	if t.blocks == nil	then t.blocks=10 end
	if t.height == nil	then t.height=10 end
	if t.angle == nil 	then t.angle=0 end
	t.angle = t.angle*math.pi/180
	--line cap style
	if t.cap==nil		then t.cap = "b" end
	local cap="b"
	for i,v in ipairs({"s","r","b"}) do 
		if v==t.cap then cap=v end
	end
	local delta=0
	if t.cap=="r" or t.cap=="s" then delta = t.height end
	if cap=="s" then 	cap = CAIRO_LINE_CAP_SQUARE
	elseif cap=="r" then
		cap = CAIRO_LINE_CAP_ROUND
	elseif cap=="b" then
		cap = CAIRO_LINE_CAP_BUTT
	end
	--end line cap style
	--if t.led_effect == nil	then t.led_effect="r" end
	if t.width == nil	then t.width=20 end
	if t.space == nil	then t.space=2 end
	if t.radius == nil	then t.radius=0 end
	if t.angle_bar == nil	then t.angle_bar=0 end
	t.angle_bar = t.angle_bar*math.pi/360 --halt angle
	
	--colours
	if t.bg_colour == nil 	then t.bg_colour = {0x00FF00,0.5} end
	if #t.bg_colour~=2 		then t.bg_colour = {0x00FF00,0.5} end
	if t.fg_colour == nil 	then t.fg_colour = {0x00FF00,1} end
	if #t.fg_colour~=2 		then t.fg_colour = {0x00FF00,1} end
	if t.alarm_colour == nil 	then t.alarm_colour = t.fg_colour end
	if #t.alarm_colour~=2 		then t.alarm_colour = t.fg_colour end

	if t.mid_colour ~= nil then	
		for i=1, #t.mid_colour do    
		    if #t.mid_colour[i]~=3 then 
		    	print ("error in mid_color table")
		    	t.mid_colour[i]={1,0xFFFFFF,1} 
		    end
		end
    	end
	
	if t.alarm==nil then t.alarm = t.max end --0.8*t.max end
	if t.smooth == nil then t.smooth = false end

	--handle
	if t.handle_show == nil		then t.handel_show=false end
	if t.handle_size == nil		then t.handle_size=t.width/2 end
	if t.handle_color == nil	then t.handle_color={0x00FF01,1} end
	if #t.handle_color ~= 2		then t.handle_color={0x00FF01,1} end
	if t.handle_length == nil or t.handle_length < t.width	then t.handle_length=t.width end
	if t.handle_flip == nil		then t.handle_flip=false end

	--txt
	if t.txt_show == nil		then t.txt_show=false end
	if t.txt_angle == nil		then t.txt_angle=0 end
	if t.txt_color == nil		then t.txt_color={0x00FF01,1} end
	if #t.txt_color ~= 2		then t.txt_color={0x00FF01,1} end
	if t.txt_size == nil		then t.txt_size=t.width end
	if t.txt_offset == nil		then t.txt_offset=0 end
	if t.txt_flip == nil		then t.txt_flip=false end
	if t.txt_font == nil		then t.txt_font="ubuntu" end
	if t.txt_add == nil		then t.txt_add="" end
	if (t.txt_alarm == nil) or (t.alarm == t.max)		then t.txt_alarm= false end
	if t.txt_offsety == nil		then t.txt_offsety=0 end
	if t.txt_weight == nil		then t.txt_weight=0 end
    
	if t.bg_led ~= nil and #t.bg_led~=2	then t.bg_led = t.bg_colour end
	if t.fg_led ~= nil and #t.fg_led~=2	then t.fg_led = t.fg_colour end
	if t.alarm_led~= nil and #t.alarm_led~=2 then t.alarm_led = t.fg_led end
	
	if t.led_effect~=nil then
		if t.bg_led == nil then t.bg_led = t.bg_colour end
		if t.fg_led == nil 	then t.fg_led = t.fg_colour end
		if t.alarm_led == nil  then t.alarm_led = t.fg_led end
	end

	if t.skew_x == nil then 
		t.skew_x=0 
	else
		t.skew_x = math.pi*t.skew_x/180	
	end
	if t.skew_y == nil then 
		t.skew_y=0
	else
		t.skew_y = math.pi*t.skew_y/180	
	end
	
	if t.reflection_alpha==nil then t.reflection_alpha=0 end
	if t.reflection_length==nil then t.reflection_length=1 end
	if t.reflection_scale==nil then t.reflection_scale=1 end
	
	--end of default values
	
	-- Function to return r g b color
 	local function rgb_to_r_g_b(col_a)
		return ((col_a[1] / 0x10000) % 0x100) / 255., ((col_a[1] / 0x100) % 0x100) / 255., (col_a[1] % 0x100) / 255., col_a[2]
	end
	
	
	--functions used to create patterns
	local function create_smooth_linear_gradient(x0,y0,x1,y1)
		local pat = cairo_pattern_create_linear (x0,y0,x1,y1)
		cairo_pattern_add_color_stop_rgba (pat, 0, rgb_to_r_g_b(t.fg_colour))
		cairo_pattern_add_color_stop_rgba (pat, 1, rgb_to_r_g_b(t.alarm_colour))
		if t.mid_colour ~=nil then
			for i=1, #t.mid_colour do
				cairo_pattern_add_color_stop_rgba (pat, t.mid_colour[i][1], rgb_to_r_g_b({t.mid_colour[i][2],t.mid_colour[i][3]}))
			end
		end
		return pat
	end

	local function create_smooth_radial_gradient(x0,y0,r0,x1,y1,r1)
		local pat =  cairo_pattern_create_radial (x0,y0,r0,x1,y1,r1)
		cairo_pattern_add_color_stop_rgba (pat, 0, rgb_to_r_g_b(t.fg_colour))
		cairo_pattern_add_color_stop_rgba (pat, 1, rgb_to_r_g_b(t.alarm_colour))
		if t.mid_colour ~=nil then
			for i=1, #t.mid_colour do
				cairo_pattern_add_color_stop_rgba (pat, t.mid_colour[i][1], rgb_to_r_g_b({t.mid_colour[i][2],t.mid_colour[i][3]}))
			end
		end
		return pat
	end
	
	local function create_led_linear_gradient(x0,y0,x1,y1,col_alp,col_led)
		local pat = cairo_pattern_create_linear (x0,y0,x1,y1) ---delta, 0,delta+ t.width,0)
		cairo_pattern_add_color_stop_rgba (pat, 0.0, rgb_to_r_g_b(col_alp))
		cairo_pattern_add_color_stop_rgba (pat, 0.5, rgb_to_r_g_b(col_led))
		cairo_pattern_add_color_stop_rgba (pat, 1.0, rgb_to_r_g_b(col_alp))
		return pat
	end

	local function create_led_radial_gradient(x0,y0,r0,x1,y1,r1,col_alp,col_led,mode)
		local pat = cairo_pattern_create_radial (x0,y0,r0,x1,y1,r1)
		if mode==3 then
			cairo_pattern_add_color_stop_rgba (pat, 0, rgb_to_r_g_b(col_alp))				
			cairo_pattern_add_color_stop_rgba (pat, 0.5, rgb_to_r_g_b(col_led))
			cairo_pattern_add_color_stop_rgba (pat, 1, rgb_to_r_g_b(col_alp))				
		else
			cairo_pattern_add_color_stop_rgba (pat, 0, rgb_to_r_g_b(col_led))
			cairo_pattern_add_color_stop_rgba (pat, 1, rgb_to_r_g_b(col_alp))				
		end
		return pat
	end

	--this fucntion is used for bars with a single block (blocks=1)
	local function draw_single_bar()
		local function create_pattern(col_alp,col_led,bg)
			local pat
			
			if not t.smooth then
				if t.led_effect=="e" then
					pat = create_led_linear_gradient (-delta, 0,delta+ t.width,0,col_alp,col_led)
				elseif t.led_effect=="a" then
					pat = create_led_linear_gradient (t.width/2, 0,t.width/2,-t.height,col_alp,col_led)
				elseif  t.led_effect=="r" then
					pat = create_led_radial_gradient (t.width/2, -t.height/2, 0, t.width/2,-t.height/2,t.height/1.5,col_alp,col_led,2)
				else
					pat = cairo_pattern_create_rgba  (rgb_to_r_g_b(col_alp))
				end
			else
				if bg then
					pat = cairo_pattern_create_rgba  (rgb_to_r_g_b(t.bg_colour))
				else
					pat = create_smooth_linear_gradient(t.width/2, 0, t.width/2,-t.height)
				end
			end
			return pat
		end
		
		local y1=-t.height*pct/100
		local y2,y3
		if pct>(100*t.alarm/t.max) then 
			y1 = -t.height*t.alarm/100
			y2 = -t.height*pct/100
			if t.smooth then y1=y2 end
		end
		
		if t.angle_bar==0 then
		
			--block for fg value
			local pat = create_pattern(t.fg_colour,t.fg_led,false)
			cairo_set_source(cr,pat)
			if (not t.handle_show) then
				cairo_rectangle(cr,0,0,t.width,y1)
			else
				if (y1 <= -t.handle_size) then
					cairo_rectangle(cr,0,0,t.width,y1+t.handle_size)
				end
			end
			cairo_fill(cr)
			cairo_pattern_destroy(pat)

			--block for handle
			if (t.handle_show) then
				local offsetx = 0
				if t.handle_flip then offsetx= t.handle_length-t.width end
				pat = cairo_pattern_create_rgba (rgb_to_r_g_b(t.handle_color))
				cairo_set_source(cr,pat)
				if (y1 >= -t.handle_size) then
					cairo_rectangle(cr,0-offsetx,0,t.handle_length,y1)
				else
					cairo_rectangle(cr,0-offsetx,y1+t.handle_size,t.handle_length,-t.handle_size)	
				end
				cairo_fill(cr)
				cairo_pattern_destroy(pat)
			end
			
			-- block for alarm value			
			if not t.smooth and y2 ~=nil then 
				pat = create_pattern(t.alarm_colour,t.alarm_led,false)
				cairo_set_source(cr,pat)
				cairo_rectangle(cr,0,y1,t.width,y2-y1)
				cairo_fill(cr)
				y3=y2
				cairo_pattern_destroy(pat)
			else
				y2,y3=y1,y1
			end

			-- block for bg value
			cairo_rectangle(cr,0,y2,t.width,-t.height-y3)
			pat = create_pattern(t.bg_colour,t.bg_led,true)
			cairo_set_source(cr,pat)
			cairo_pattern_destroy(pat)
			cairo_fill(cr)
		end		
	end  --end single bar
	
	--function used for bars with 2 or more blocks
	local function draw_multi_bar()
		for pt = 1,t.blocks do 
			--set block y
			local y1 = -(pt-1)*(t.height+t.space)
			local light_on=false
			
			--set colors
			local col_alp = t.bg_colour
			local col_led = t.bg_led
			if pct>=(100/t.blocks) or pct>0 then --ligth on or not the block
				if pct>=(pcb*(pt-1))  then 
					light_on = true
					if pct>=(100*t.alarm/t.max) and (pcb*pt)>(100*t.alarm/t.max) then 	-- Check whether the value is in the alarm range
						col_alp = t.alarm_colour 
						col_led = t.alarm_led 
					else
						-- Not in alarm range
						col_alp = t.fg_colour
						col_led = t.fg_led
					end
				end
			end

			--set colors
			--have to try to create gradients outside the loop ?
			local pat 
			
			if not t.smooth then
				if t.angle_bar==0 then
					if t.led_effect=="e" then
						pat = create_led_linear_gradient (-delta, 0,delta+ t.width,0,col_alp,col_led)
					elseif t.led_effect=="a" then
						pat = create_led_linear_gradient (t.width/2, -t.height/2+y1,t.width/2,0+t.height/2+y1,col_alp,col_led)					
					elseif  t.led_effect=="r" then
						pat = create_led_radial_gradient (t.width/2, y1, 0, t.width/2,y1,t.width/1.5,col_alp,col_led,2)	
					else
						pat = cairo_pattern_create_rgba  (rgb_to_r_g_b(col_alp))
					end
				else
					 if t.led_effect=="a"  then
						 pat = create_led_radial_gradient (0, 0, t.radius+(t.height+t.space)*(pt-1), 0, 0, t.radius+(t.height+t.space)*(pt), col_alp,col_led,3)	
					else
						pat = cairo_pattern_create_rgba  (rgb_to_r_g_b(col_alp))					
					end
					
				end
			else
				
				if light_on then
					if t.angle_bar==0 then
						pat = create_smooth_linear_gradient(t.width/2, t.height/2, t.width/2,-(t.blocks-0.5)*(t.height+t.space))
					else
						pat = create_smooth_radial_gradient(0, 0, (t.height+t.space),  0,0,(t.blocks+1)*(t.height+t.space),2)
					end
				else		
					pat = cairo_pattern_create_rgba  (rgb_to_r_g_b(t.bg_colour))
				end
			end
			cairo_set_source (cr, pat)
			cairo_pattern_destroy(pat)

			--draw a block
			if t.angle_bar==0 then
				cairo_move_to(cr,0,y1)
				cairo_line_to(cr,t.width,y1)
			else		
				cairo_arc( cr,0,0,
					t.radius+(t.height+t.space)*(pt)-t.height/2,
					 -t.angle_bar -math.pi/2 ,
					 t.angle_bar -math.pi/2)
			end
			cairo_stroke(cr)
		end	
	end
	
	
	
	--function used to retrieve the value to display and to set the cairo structure
	local function setup_bar_graph()
		if t.blocks ~=1 then t.y=t.y-t.height/2 end
		
		local value = 0
		if t.name ~="" then
			value = tonumber(conky_parse(string.format('${%s %s}', t.name, t.arg)))

			--$to_bytes doesn't work when value has a decimal point,
			--https://garage.maemo.org/plugins/ggit/browse.php/?p=monky;a=commitdiff;h=174c256c81a027a2ea406f5f37dc036fac0a524b;hp=d75e2db5ed3fc788fb8514121f67316ac3e5f29f
			--http://sourceforge.net/tracker/index.php?func=detail&aid=3000865&group_id=143975&atid=757310
			--conky bug?
			--value = (conky_parse(string.format('${%s %s}', t.name, t.arg)))
			--if string.match(value,"%w") then
			--	value = conky_parse(string.format('${to_bytes %s}',value))
			--end
		else
			value = tonumber(t.arg)
		end
	
		-- Value checks
		if value==nil then value =0 end
		if value > t.max then 
			print ("value retrieved from conky: " .. value .. " is bigger than max: " .. t.max .. ", value is set to max.")
			value=t.max
		end
		
		pct = 100*value/t.max
		pcb = 100/t.blocks
		
		cairo_set_line_width (cr, t.height)
		cairo_set_line_cap  (cr, cap)
		cairo_translate(cr,t.x,t.y)
		cairo_rotate(cr,t.angle)

		local matrix0 = cairo_matrix_t:create()
		tolua.takeownership(matrix0)
		cairo_matrix_init (matrix0, 1,t.skew_y,t.skew_x,1,0,0)
		cairo_transform(cr,matrix0)	
		
		--call the drawing function for blocks
		if t.blocks==1 and t.angle_bar==0 then
			draw_single_bar()
			if t.reflection=="t" or t.reflection=="b" then cairo_translate(cr,0,-t.height) end
		else
			draw_multi_bar()
		end

		--block for TXT
		-- -- Must be drawn after "bar" is assigned to matrix to avoid reflection of the text
		if (t.txt_show and t.angle_bar==0) then
			local ypos=0
			local barnr=0
			if (t.blocks == 1) then		--Determine the y position of the txt
				ypos = -t.height*pct/100 - t.txt_offsety
			else
				--Inefficient, feel free to replace with a formula (get block of the value)
				if (value <  (t.max/t.blocks)) then
					ypos= 0
				elseif (value > (t.max - (t.max/t.blocks))) then
					ypos= -(t.blocks-1)*(t.height+t.space)
				else
					for bar = 1,t.blocks do
						if not ((pct>=(100/t.blocks) or pct>0) and (pct>=(pcb*(bar-1)))) then --ligth on or not the block	
							barnr=bar					
							break
						end
					end
					ypos= -(barnr-2)*(t.height+t.space) - t.txt_offsety
				end
			end
			cairo_save(cr)	
			cairo_select_font_face(cr, t.txt_font, CAIRO_FONT_SLANT_NORMAL, t.txt_weight)
    			cairo_set_font_size(cr, t.txt_size)
			if (t.txt_alarm and value >= t.alarm) then
				cairo_set_source_rgba(cr, rgb_to_r_g_b(t.alarm_colour))
			else
				cairo_set_source_rgba(cr, rgb_to_r_g_b(t.txt_color))
			end
			if (t.txt_flip) then
				cairo_move_to (cr, -(t.width+t.txt_offset), ypos+10)
			else
				cairo_move_to (cr, t.width+t.txt_offset, ypos+10)
			end
			cairo_rotate(cr,t.txt_angle)
			cairo_show_text(cr, (pct/100*t.max) .. t.txt_add)
			cairo_restore(cr)
		end

		--dot for reminder (uncomment to debug, indicates 0,0)
		--[[		
		if t.blocks ~=1 then
			cairo_set_source_rgba(cr,1,0,0,1)
			cairo_arc(cr,0,t.height/2,3,0,2*math.pi)
			cairo_fill(cr)
		else
			cairo_set_source_rgba(cr,1,0,0,1)
			cairo_arc(cr,0,0,3,0,2*math.pi)
			cairo_fill(cr)
		end]]
		
		--call the drawing function for reflection and prepare the mask used		
		if t.reflection_alpha>0 and t.angle_bar==0 then
			local pat2
			local matrix1 = cairo_matrix_t:create()
			tolua.takeownership(matrix1)
			pts={-delta/2,(t.height+t.space)/2,t.width+delta,-(t.height+t.space)*(t.blocks)}
			if t.reflection=="t" then
				cairo_matrix_init (matrix1,1,0,0,-t.reflection_scale,0,-(t.height+t.space)*(t.blocks-0.5)*2*(t.reflection_scale+1)/2)
				pat2 = cairo_pattern_create_linear (t.width/2,-(t.height+t.space)*(t.blocks),t.width/2,(t.height+t.space)/2)
			elseif t.reflection=="r" then
				cairo_matrix_init (matrix1,-t.reflection_scale,0,0,1,delta+2*t.width,0)
				pat2 = cairo_pattern_create_linear (delta/2+t.width,0,-delta/2,0)
			elseif t.reflection=="l" then
				cairo_matrix_init (matrix1,-t.reflection_scale,0,0,1,-delta,0)
				pat2 = cairo_pattern_create_linear (-delta/2,0,delta/2+t.width,-0)
			else --bottom
				cairo_matrix_init (matrix1,1,0,0,-1*t.reflection_scale,0,(t.height+t.space)*(t.reflection_scale+1)/2)
				pat2 = cairo_pattern_create_linear (t.width/2,(t.height+t.space)/2,t.width/2,-(t.height+t.space)*(t.blocks))
			end

			cairo_transform(cr,matrix1)

			if t.blocks==1 then
				draw_single_bar()
				cairo_translate(cr,0,-t.height/2) 
			else
				draw_multi_bar()
			end
						
			cairo_set_line_width(cr,0.01)
			cairo_pattern_add_color_stop_rgba (pat2, 0,0,0,0,1-t.reflection_alpha)
			cairo_pattern_add_color_stop_rgba (pat2, t.reflection_length,0,0,0,1)
			cairo_rectangle(cr,pts[1],pts[2],pts[3],pts[4])

			cairo_clip_preserve(cr)
			cairo_set_operator(cr,CAIRO_OPERATOR_CLEAR)
			cairo_stroke(cr)
			cairo_mask(cr,pat2)
			cairo_pattern_destroy(pat2)
			cairo_set_operator(cr,CAIRO_OPERATOR_OVER)
			
		end --reflection

		pct,pcb=nil
	end --setup_bar_graph()
	
	--start here !
	setup_bar_graph()
	cairo_restore(cr)
end

