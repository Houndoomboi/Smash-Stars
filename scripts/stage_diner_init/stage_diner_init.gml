function stage_diner_init()
	{
	if (!object_is(object_index, obj_stage_manager))
		{
		crash("Trying to run a stage init script on an instance that is not obj_stage_manager!\n",
			"This may be caused by putting parentheses after a script name in stage_data.\n");
		}
	
	//Background sprites
	background = 
		[
		];
	
	//Foreground sprites
	foreground = [];
	
	//Music
	stage_music_set(Ranch);
	
	//Stage passive
	callback_stage_passive = [];
	
	//Color tint
	stage_tint = [0.0, 0.0, 0.0];
	
	//Blastzones
	blastzones = 
		{
		left : -125, 
		top : 0, 
		right : 1275, 
		bottom : 675,
		};
	
	//Stage settings
	setting().daynight_cycle_enable = false;
	setting().stage_background_color = c_black;
	setting().slope_collisions_enable = false;
	setting().background_is_static = true;
	setting().screen_shader_script = -1;
	
	//CPU Data
	cpu_up_b_distance = 500;
	cpu_main_stage_distance = 300;
	}
/* Copyright 2025 Springroll Games / Yosi */