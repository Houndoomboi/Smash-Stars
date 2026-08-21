function stage_rumblejungle_init()
	{
	if (!object_is(object_index, obj_stage_manager))
		{
		crash("Trying to run a stage init script on an instance that is not obj_stage_manager!\n",
			"This may be caused by putting parentheses after a script name in stage_data.\n");
		}
	
	//Background sprites
	background = 
		[
		background_define_script(spr_jungle_skybox, 0, 0, 1, 0, 0, 0, 0, false, 0),
		background_define_script(spr_jungle_volcano, 0, 0, 1, .5, .5, 0, 0, false, 0),
		background_define_script(spr_jungle_plains, 0, 0, 1, .5, .5, 0, 0, false, 0),
		background_define_script(spr_jungle_rocks, 0, 0, 1, .5, .5, 0, 0, false, 0),
		back_clear,
		];
	
	//Foreground sprites
	foreground = [];
	
	//Music
	stage_music_set(Rumble_Jungle);
	
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
	setting().daynight_cycle_enable = false;
	setting().stage_background_color = c_white;
	setting().slope_collisions_enable = true;
	setting().background_is_static = true;
	setting().screen_shader_script = -1;
	
	//CPU Data
	cpu_up_b_distance = 9999;
	cpu_main_stage_distance = 9999;
	}
/* Copyright 2025 Springroll Games / Yosi */