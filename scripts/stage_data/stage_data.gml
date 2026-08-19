///@category Stages
/*
This script defines the data used for each stage.
*/
function stage_data_get_all()
	{
	static _data = 
		[
		stage_define
			(
			"Darryl's Ship",
			stage_darrylship_init,
			rm_darrylship,
			spr_stage_darrylship_icon,
			["texture_stage_peak"],
			0
			),
		stage_define
			(
			"El Primo's Ring",
			stage_primoring_init,
			rm_primoring,
			spr_stage_primoring_icon,
			["texture_stage_islands"],
			0
			),
		stage_define
			(
			"Gem Mine",
			stage_gemmine_init,
			rm_gemmine,
			spr_stage_gemmine_icon,
			["texture_stage_desert"],
			0
			),
		stage_define
			(
			"Giftshop",
			stage_giftshop_init,
			rm_stage_giftshop,
			spr_stage_giftshop_icon,
			["texture_stage_campground"],
			0
			),
		stage_define
			(
			"Ranger Ranch",
			stage_ranch_init,
			rm_stage_ranch,
			spr_stage_ranch_icon,
			["texture_stage_desert"],
			0
			),
		stage_define
			(
			"Swamp of Love",
			stage_loveswamp_init,
			rm_stage_loveswamp,
			spr_stage_loveswamp_icon,
			["texture_stage_factory"],
			0
			),
		stage_define
			(
			"Rumble Jungle",
			stage_rumblejungle_init,
			rm_rumblejungle,
			spr_stage_rumblejungle_icon,
			["texture_stage_factory"],
			0
			),
		stage_define
			(
			"Mortis' Mortuary",
			stage_mortuary_init,
			rm_mortuary,
			spr_stage_mortuary_icon,
			["texture_stage_factory"],
			0
			),
	    ];
	return _data;
	}
/* Copyright 2025 Springroll Games / Yosi */