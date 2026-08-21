function basic_nspec_stasis_passive()
	{ 
	// Variables
	var _p = custom_passive_struct;
	if (!variable_struct_exists(_p, "stasis_frame")) then _p.stasis_frame = 0;
	if (!variable_struct_exists(_p, "stasis_stored_knockback")) then _p.stasis_stored_knockback = 0;

	// Player tint
	var _stored_percentage = clamp(_p.stasis_stored_knockback / 40, 0, 1);
	flash_color = make_color_hsv(lerp(40, 0, _stored_percentage), 220, 255);
	flash_alpha = 0.75 + (dcos(_p.stasis_frame * 20) * 0.2);

	_p.stasis_frame -= 1;
	// Extending hitlag
	if (state == PLAYER_STATE.hitlag)
		{
		if (state_frame < _p.stasis_frame)
			{
			state_frame = _p.stasis_frame;
			}
		}

	// Ending stasis
	if (state != PLAYER_STATE.hitlag || _p.stasis_frame <= 0)
		{
		// Effects
		game_sound_play(snd_hit_explosion2);
		camera_shake(clamp(knockback_spd / 3, 4, 10));
		for (var i = 0; i < 20; i++)
			{
			var _angle = (i * (360 / 20)) + prng_number(1 + i, 15);
			var _vfx = vfx_create(spr_basic_nspec_stasis_chains, lengthdir_x(20, _angle), lengthdir_y(20, _angle), prng_number(0 + i, 20, 5), x, y, 1.0, prng_number(1 + i, 360));
			_vfx.vfx_xscale = prng_number(i * 2, 4, 1);
			_vfx.vfx_blend = flash_color;
			_vfx.shrink = 0.98;
			_vfx.spin = 1;
			_vfx.hsp = lengthdir_x(7, _angle);
			_vfx.vsp = lengthdir_y(7, _angle);
			}
		var _vfx = vfx_create(spr_hit_final_hit, 2, 0, 18, x, y, 1.0, prng_number(0, 360), "VFX_Layer_Below");
		_vfx.vfx_blend = c_white;

		callback_remove(callback_passive, basic_nspec_stasis_passive);
		callback_remove(callback_hurt, basic_nspec_stasis_hurt);
		callback_remove(callback_draw_end, basic_nspec_stasis_draw_end);
		return;
		}
	if (is_knocked_out())
		{
		callback_remove(callback_passive, basic_nspec_stasis_passive);
		callback_remove(callback_hurt, basic_nspec_stasis_hurt);
		callback_remove(callback_draw_end, basic_nspec_stasis_draw_end);
		return;
		}
	}
/* Copyright 2026 Springroll Games / Yosi */