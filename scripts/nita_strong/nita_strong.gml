function nita_strong()
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
				anim_sprite = spr_nita_groundstrong;
				anim_speed = 0;
				anim_frame = 0;
				attack_frame = 14;
				return;
				}
			//Charging
			case 0:
				{
				
				if (attack_frame == 0)
					{
						custom_attack_struct.draw_frame = 1;
						attack_phase++;
						attack_frame = 7;
						}
				break;
				}
			//Startup
			case 1:
				{
				if (attack_frame == 4)
					anim_frame = 6;	
				if (attack_frame == 0)
					{
					anim_frame = 7;
					attack_phase++;
					attack_frame = 8;
					var _hitbox = hitbox_create_melee(62, 0, 0.9, 0.4, 14, 7, 1, 10, 50, 8, SHAPE.rotation, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					hitbox_sprite_angle_set(_hitbox, 50);
					_hitbox.hit_sfx = Nita_Strong;
					_hitbox.shieldstun_scaling = 0.1;
					_hitbox.hitstun_scaling = 0.5;
					}
				break;
				}
			//Active
			case 2:
				{
				
				//Animation
				if (attack_frame == 6)
					anim_frame = 8;
				if (attack_frame == 3)
					anim_frame = 9;
		
				if (attack_frame == 0)
					{
						sprite_scale = 1;
				attack_stop(PLAYER_STATE.idle);
					run = false;
					}
				break;
				}
			//Finish
			case 3:
				{
				//Animation
				if (attack_frame <= 20)
					anim_frame = 8;
				if (attack_frame <= 10)
					anim_frame = 9;
		
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					run = false;
					}
				break;
				}
			}
		}
	
	//Movement
	move_grounded();
	}
/* Copyright 2025 Springroll Games / Yosi */