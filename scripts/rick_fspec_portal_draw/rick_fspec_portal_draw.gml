function rick_fspec_portal_draw()
	{
	//Draw portal placement marker
	if (attack_phase == 1)
		{
		palette_shader_set(palette_base, palette_swap, 0.0, 1.0, fade_value, false);
		draw_sprite_ext
			(
			spr_rick_fspec_portal,
			2,
			custom_attack_struct.portal_x, 
			custom_attack_struct.portal_y, 
			2, 
			2, 
			(obj_game.current_frame % 180) * 2, 
			c_white, 
			1
			);
		shader_reset();
		}
	}

/* Copyright 2025 Springroll Games / Yosi */