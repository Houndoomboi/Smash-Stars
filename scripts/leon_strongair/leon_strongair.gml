function leon_strongair()
	{
	//Downward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_try();
	aerial_drift();
	allow_hitfall();
	//Canceling
	if (run && cancel_ground_check()) then run = false;
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_leon_strongair;
				anim_speed = 0;
				anim_frame = 0;
				
				landing_lag = 18;
				speed_set(0, -1, true, true);
				attack_frame = 6;
				return;
				}
			//Startup
			case 0:
				{
				
				if (attack_frame = 4)
					anim_frame = 1
				if (attack_frame = 2)
					anim_frame = 2
					
				if (attack_frame == 0)
					{
					anim_frame = 3;
					attack_phase++;
					attack_frame = 5;
					game_sound_play(snd_punch1);
					var _hitbox = hitbox_create_melee(16, -20, 0.5, 0.35, 11, 6, 1.3, 10, 60, 4, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong0;
					_hitbox.hitstun_scaling = 1.1;
					}
				break;
				}
			//Second Hitbox
				case 1:
				{
			
				if (attack_frame == 0)
					{
					anim_frame = 4;
					attack_phase++;
					attack_frame = 8;
					game_sound_play(snd_punch1);
					var _hitbox = hitbox_create_melee(16, 15, 0.5, 0.35, 11, 6, 1.3, 10, 25, 4, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong0;
					_hitbox.hitstun_scaling = 1.1;
					}
				break;
				}
			
			
			
			
			
			
			//Endlag
			case 2:
				{
				//Animation
				if (attack_frame == 6)
					anim_frame = 5;
				if (attack_frame == 4)
					anim_frame = 6;
				
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					}
					
				//Reduce landing lag on hit
				if (attack_connected())
					{
					landing_lag = 6;
					}
				break;
				}
			}
		}
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yosi */