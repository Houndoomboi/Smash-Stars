function stage_gemmine_init()
	{
	if (!object_is(object_index, obj_stage_manager))
		{
		crash("Trying to run a stage init script on an instance that is not obj_stage_manager!\n",
			"This may be caused by putting parentheses after a script name in stage_data.\n");
		}
	
	//Background sprites
	background = 
		[
		background_define_script(spr_stage_gemmine_bg, -550, -275, 0.175, 0, 0, 0, 0, false, 0),
		
		//background_define(spr_stage_ranch_background2, 0, 64, 2, 0.1, 0.1),
		//background_define(spr_stage_campground_trees1, 0, 118, 2, 0.2, 0.3),
		//background_define(spr_stage_campground_trees2, 0, 158, 2, 0.5, 0.5),
		back_clear,
		//background_define(spr_stage_ranch_background1, 856, 704, 2, 0, 0, 0, 0, true, 0.1),
		];
	
	//Foreground sprites
	foreground = [];
	
	//Music
    stage_music_set(Mine);
	
	//Stage passive
	callback_stage_passive = [];
	
	//Color tint
	stage_tint = [0.0, 0.0, 0.0];
	
	//Blastzones
	blastzones = 
		{
		left : 0, 
		top : 0, 
		right : room_width, 
		bottom : room_height,
		};
	
	//Stage settings
	//setting().daynight_cycle_enable = true;
	setting().stage_background_color = c_white;
	setting().slope_collisions_enable = false;
	setting().background_is_static = true;
	setting().screen_shader_script = -1;
	
	//CPU Data
	cpu_up_b_distance = 500;
	cpu_main_stage_distance = 300;
	}
/* Copyright 2025 Springroll Games / Yosi */