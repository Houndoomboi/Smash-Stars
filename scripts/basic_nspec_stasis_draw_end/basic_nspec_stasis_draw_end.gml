function basic_nspec_stasis_draw_end()
	{ 
	// Variables
	var _p = custom_passive_struct;
	if (!variable_struct_exists(_p, "stasis_frame")) then _p.stasis_frame = 0;
	if (!variable_struct_exists(_p, "stasis_stored_knockback")) then _p.stasis_stored_knockback = 0;

	// Draw the knockback arrow
	var _scale = clamp(_p.stasis_stored_knockback / 40, 0.25, 1) * 2.0;
	draw_sprite_ext(spr_basic_nspec_stasis_arrow, 0, x, y, _scale, _scale, knockback_dir, flash_color, 1.0);
	}
/* Copyright 2026 Springroll Games / Yosi */