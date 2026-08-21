///@category Characters
/*
This script defines the data used for each character, including the character's init script, palette, portrait, texture page, etc.
*/
function character_data_get_all()
	{
	static _data =
		[
		character_define
			(
			"Colt",
			character_colt_init,
			spr_colt_palette,
			spr_colt_portraitplaceholder,
			spr_colt_portraitplaceholder,
			spr_colt_HUD,
			spr_colt_stockicon,
			spr_colt_portraitplaceholder,
			song_default_victory,
			["texture_character_blocky", "texture_character_basic"],
			blocky_cpu_script,
			),
		character_define
			(
			"Shelly",
			character_shelly_init,
			spr_shelly_palette,
			spr_shelly_css,
			spr_shelly_css,
			spr_shelly_HUD,
			spr_shelly_stockicon,
			spr_shelly_css,
			song_default_victory,
			["texture_character_shelly", "texture_character_basic"],
			shelly_cpu_script,
			),
		character_define
			(
			"Spike",
			character_spike_init,
			spr_spike_palette,
			spr_spike_portrait,
			spr_spike_portrait,
			spr_spike_HUD,
			spr_spike_stockicon,
			spr_spike_portrait,
			song_default_victory,
			["texture_character_shelly", "texture_character_basic"],
			//shelly_cpu_script,
			),
			character_define
			(
			"El Primo",
			character_elprimo_init,
			spr_primo_palette,
			spr_primo_portraitplaceholder,
			spr_primo_portraitplaceholder,
			spr_primo_hud,
			spr_primo_stockicon,
			spr_primo_portraitplaceholder,
			song_default_victory,
			["texture_character_shelly", "texture_character_basic"],
			//shelly_cpu_script,
			),
			character_define
			(
			"Crow",
			character_crow_init,
			spr_crow_palette,
			spr_crow_portraitplaceholder,
			spr_crow_portraitplaceholder,
			spr_crow_hud,
			spr_crow_stockicon,
			spr_crow_portraitplaceholder,
			song_default_victory,
			["texture_character_shelly", "texture_character_basic"],
			//shelly_cpu_script,
			),
			character_define
			(
			"Nita",
			character_nita_init,
			spr_nita_palette,
			spr_nita_portrait,
			spr_nita_portrait,
			spr_crow_hud,
			spr_nita_stockicon,
			spr_nita_portrait,
			song_default_victory,
			["texture_character_shelly", "texture_character_basic"],
			//shelly_cpu_script,
			),
			character_define
			(
			"Mortis",
			character_mortis_init,
			spr_mortis_palette,
			spr_mortis_portrait,
			spr_mortis_portrait,
			spr_crow_hud,
			spr_mortis_stockicon,
			spr_mortis_portrait,
			song_default_victory,
			["texture_character_shelly", "texture_character_basic"],
			//shelly_cpu_script,
			),
		character_define
			(
			"Random",
			-1,
			spr_palette_random,
			spr_css_random,
			spr_css_random,
			spr_css_random,
			spr_css_random,
			spr_css_random,
			song_default_victory,
			undefined,
			),
		];
	return _data;
	}
/* Copyright 2025 Springroll Games / Yosi */