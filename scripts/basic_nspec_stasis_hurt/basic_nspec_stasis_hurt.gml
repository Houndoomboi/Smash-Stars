function basic_nspec_stasis_hurt()
	{
	var _args = argument[0];
	var _hitbox = _args[@ 0];
	var _hurtbox = _args[@ 1];
	
	if (instance_exists(_hitbox) && instance_exists(_hurtbox))
		{
		// Variables
		var _p = custom_passive_struct;
		if (!variable_struct_exists(_p, "stasis_frame")) then _p.stasis_frame = 0;
		if (!variable_struct_exists(_p, "stasis_stored_knockback")) then _p.stasis_stored_knockback = 0;

		// Change the magnetized state back to hitlag
		if (state == PLAYER_STATE.magnetized)
			{
			state_set(PLAYER_STATE.hitlag);
			// Default knockback speed for any magnetboxes
			knockback_spd = 2;
			}

		if (state == PLAYER_STATE.hitlag)
			{
			// Extending hitlag
			if (state_frame < _p.stasis_frame)
				{
				state_frame = _p.stasis_frame;
				}

			// Calculate the new total knockback
			_p.stasis_stored_knockback = clamp(_p.stasis_stored_knockback + (knockback_spd * 0.6), 3, 12 + (damage * 0.25));
			_p.stasis_stored_knockback = min(_p.stasis_stored_knockback, 40);
			knockback_spd = ceil(_p.stasis_stored_knockback);
			stored_hitstun = ceil(knockback_spd * 1.5);
			stored_state = PLAYER_STATE.balloon;
			}
		}
	}
/* Copyright 2026 Springroll Games / Yosi */