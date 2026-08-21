function basic_nspec_stasis()
	{
	// Neutral Special
	/*
	- Freeze time for any opponent that is hit.
	- While time is frozen, knockback is stored.
	- When time unfreezes, all of the stored knockback is applied at once.
	- The direction the opponent is launched is the direction of the LAST hit.
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;

	// Timer
	attack_frame = max(--attack_frame, 0);

	// Main Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				// Startup
				anim_sprite = spr_blocky_idle;
				anim_speed = 0.3;
				anim_frame = 0;
			
				attack_frame = 14;
				reverse_b();
				return;
				}
			// Startup
			case 0:
				{
				if (attack_frame == 9)
					{
					b_reverse();
					}

				// VFX
				if (attack_frame == 8)
					{
					var _vfx = vfx_create(spr_basic_nspec_stasis_attack, 0.25, 0, 32, x + (48 * facing), y, 2.0, 0);
					_vfx.vfx_xscale *= facing;
					_vfx.follow = id;
					_vfx.follow_offset_x = (48 * facing);
					}

				// Apply forces like normal
				friction_gravity(on_ground() ? ground_friction : air_friction, grav, max_fall_speed);
				if (attack_frame == 0)
					{
					attack_phase = 1;
					attack_frame = 3;
					game_sound_play(snd_hit_glitch);

					// Stop all movement
					speed_set(0, 0, false, false);

					// Hitbox
					hitbox_create_detectbox(48, 0, 2.0, 2.0, 3, SHAPE.circle, 0);

					// Animation
					anim_sprite = spr_basic_spot_dodge;
					anim_speed = anim_calculate_speed(anim_sprite, 3 + 30);
					anim_frame = 0;
					}
				break;
				}
			// Active
			case 1:
				{
				// No forces

				// Go to endlag
				if (attack_frame == 0)
					{
					attack_phase = 2;
					attack_frame = attack_connected() ? 15 : 30;
					}
				break;
				}
			// Endlag
			case 2:
				{
				// No forces

				// Ending
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			// Detect phase
			case PHASE.detection:
				{
				var _target = argument[1];
				var _hitbox = argument[2];
				var _hurtbox = argument[3];

				// Don't grab non-player objects
				if (!object_is(_target.object_index, obj_player)) then return;
				switch (_hurtbox.inv_type)
					{
					case INV.invincible:
					case INV.deactivate:
					case INV.reflector:
						break;
					default:
					case INV.normal:
					case INV.parry_press:
					case INV.parry_shield:
					case INV.counter:
					case INV.shielding:
					case INV.powershielding:
					case INV.heavyarmor:
					case INV.superarmor:
						// Freeze the opponent in time
						with (_target)
							{
							attack_stop(PLAYER_STATE.hitlag);
							// 3 seconds
							state_frame = 3 * 60;
							// Reset the stored knockback
							knockback_dir = 90;
							knockback_spd = 3;
							stored_hitstun = 10;
							stored_state = PLAYER_STATE.hitstun;
							facing = -other.facing;
							player_move_to_front();

							// Give them the stasis callback scripts
							callback_add(callback_passive, basic_nspec_stasis_passive, CALLBACK_TYPE.permanent);
							callback_add(callback_hurt, basic_nspec_stasis_hurt, CALLBACK_TYPE.permanent);
							callback_add(callback_draw_end, basic_nspec_stasis_draw_end, CALLBACK_TYPE.permanent);
							custom_passive_struct.stasis_frame = state_frame;
							custom_passive_struct.stasis_stored_knockback = knockback_spd;

							// VFX
							for (var i = 0; i < 7; i++)
								{
								var _vfx = vfx_create(spr_basic_nspec_stasis_chains, 0, 0, prng_number(0 + i, 90, 45), x, y, 1.0, (i * (360 / 7)) + prng_number(1 + i, 15), "VFX_Layer_Below");
								_vfx.vfx_xscale = 40;
								_vfx.vfx_blend = c_yellow;
								_vfx.fade = true;
								}
							}
						break;
					}
				return;
				}
			}
		}

	// Movement
	move();
	}

/* Copyright 2026 Springroll Games / Yosi */