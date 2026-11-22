function stage_bizarre_circus_init()
	{
	if (!object_is(object_index, obj_stage_manager))
		{
		crash("Trying to run a stage init script on an instance that is not obj_stage_manager!\n",
			"This may be caused by putting parentheses after a script name in stage_data.\n");
		}
	
	//Background sprites
	background = 
		[
		background_define_script(spr_bizarre_circus_tent, 0, 0, 1, 0, 0, 0, 0, false, 0),
		background_define_script(spr_bizarre_spiders, 0, 0, 1, .2, .2, 0, 0, false, 0),
		background_define_script(spr_bizarre_pillars, 0, 0, 1, .3, .3, 0, 0, false, 0),
		background_define_script(spr_bizarre_objects, 0, 0, 1, .6, .6, 0, 0, false, 0),
		back_clear,
		];
	
	//Foreground sprites
	foreground = [
	background_define_script(spr_bizarre_seats, 0, 0, 1, .2, .2, 0, 0, false, 0),
	];
	
	//Music
	stage_music_set(Bizarre_Circus_Jingle);
	
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
	setting().slope_collisions_enable = false;
	setting().background_is_static = true;
	setting().screen_shader_script = -1;
	
	//CPU Data
	cpu_up_b_distance = 500;
	cpu_main_stage_distance = 300;
	}
/* Copyright 2025 Springroll Games / Yosi */