function El_Primo_Strong_Air()
	{
	//Down Special
	/*
	- Any opponents it hits will become dizzy
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	if (on_ground())
		{
		friction_gravity(ground_friction);
		}
	else
		{
		friction_gravity(air_friction, grav, max_fall_speed);
		}
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_primo_strongair;
				anim_frame = 0;
				anim_speed = 0;
				
				landing_lag = 12;
			
				attack_frame = 4;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 4)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
				
					attack_phase++;
					attack_frame = 40;
					game_sound_play(Primo_PRIMO);
				
					//Hitboxes
						//Grounded sweetspot
					var _hitbox = hitbox_create_melee(0, 20, 0.1, 0.4, 8, 11, 0.3, 12, 270, 9, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.hit_restriction = HIT_RESTRICTION.grounded_only;
					_hitbox.techable = false;
					speed_set(5 * facing ,4,false,false);
                    game_sound_play(Primo_StrongAir_Sfx)
					var _hitbox = hitbox_create_melee(5, -1, 1.5, 1.5, 10, 0, 0, 20, 90, 9, SHAPE.circle, 0);
					_hitbox.hit_vfx_style = HIT_VFX.explosion;
					
					var _hitbox = hitbox_create_detectbox(5, -1, 1.5, 1.5, 3, SHAPE.circle, 1);
					_hitbox.hit_restriction = HIT_RESTRICTION.grounded_only;
					}
				break;
				}
			//Active / Endlag
			case 1:
				{
				//Animation
				if (attack_frame == 35)
					anim_frame = 3;
				if (attack_frame == 10)
					anim_frame = 4;
			
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			//Detection
			case PHASE.detection:
				{
				var _hit = argument[1];
				if (!object_is(_hit.object_index, obj_player)) then return;
				if (attack_connected())
					{
					with (_hit)
						{
						state_set(PLAYER_STATE.bury);
						state_frame = 240;
						}
					}
				break;
				}
			}
		}
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yosi */