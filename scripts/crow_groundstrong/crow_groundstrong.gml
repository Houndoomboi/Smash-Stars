function crow_groundstrong()
	{
	//Forward Smash
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(ground_friction, grav, max_fall_speed);

	//Canceling
	if (run && cancel_air_check()) then run = false;
	

	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_crow_strongground;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 6;
				return;
				}
				
				
			//Charging
			case 0:
				{
				
				if (attack_frame == 0)
					{
						anim_frame = 1;
						attack_phase++;
						attack_frame = 7;
						speed_set(3 * facing, 8, false, false);
						}
				break;
				}
			//Startup
			case 1:
				{
					
				if (attack_frame == 0)
					{
						speed_set(0, -16, false, false);
					anim_frame = 4;
					attack_phase++;
					attack_frame = 8;
					game_sound_play(Crow_GroundStrongSFX)
					var _hitbox = hitbox_create_melee(0, -5, 0.5, 0.6, 7, 5.5, 1, 23, 40, 8, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.hit_sfx = snd_hit_strong1;
					_hitbox.shieldstun_scaling = 0.1;
					_hitbox.hitstun_scaling = 0.5;
					}
				break;
				}
			//Active
			case 2:
				{
				
				//Animation
				if (attack_frame == 3)
					anim_frame = 8;
					speed_set(0,8,false,false)
		
				if (attack_frame == 0)
					{
					anim_frame = 9;
					attack_phase++;
					attack_frame = attack_connected() ? 20 : 30;
					}
				break;
				}
			//Finish
			case 3:
				{
				//Animation
				if (attack_frame <= 20)
					anim_frame = 10;
				if (attack_frame <= 10)
					anim_frame = 11;
		
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					run = false;
					}
				break;
				}
			}
		}
	
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yosi */