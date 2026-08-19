function shelly_jab()
	{
	//Jab for Shelly
	/*
	- Press the button multiple times to continue the combo
	- The first two hits can be canceled into tilts
	*/
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
				anim_sprite = spr_shelly_jab;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 2
				
				hurtbox_anim_match();
				return;
				}
			//First Jab Startup
			case 0:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 1;
					
				if (attack_frame == 0)
					{
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 3;
					var _hitbox = hitbox_create_magnetbox(23, -1.5, 0.5, 0.7, 4, 3, -16, 6, 16, 4, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.can_be_parried = false;
					_hitbox.can_lock = true;
					}
				break;
				}
			//First Jab Active
			case 1:
				{
				//Animation
				if (attack_frame == 0)
					anim_frame = 3;
					
				if (attack_frame == 0)
					{
					anim_frame = 4;
					attack_phase++;
					attack_frame = 15;
					}
				break;
				}
			//First Jab Endlag
			case 2:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame = 5;
				if (attack_frame == 5)
					anim_frame = 6;
					
				//Continue to next jab
				if (input_pressed(INPUT.attack, 12)) || (attack_connected() && input_held(INPUT.attack))
					{
					anim_frame = 5;
					attack_phase++;
					attack_frame = 5;
					}
				//Auto end
				else if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					run = false;
					}
				break;
				}
			//Second Jab Startup
			case 3:
				{
				//Animation
				if (attack_frame == 4)
					anim_frame = 6;
				if (attack_frame == 3)
					anim_frame = 7;
					
				if (attack_frame == 2)
					{
					anim_frame = 8;
					attack_phase++;
					attack_frame = 2
					camera_shake(0, 4);
					speed_set(facing * 6, 0, false, false);
					game_sound_play(snd_hit_strong0);
					//Finisher
					var _hitbox = hitbox_create_melee(3, 6.5, 0.8, 0.8, 4, 10, 0.4, 10, 50, 4, SHAPE.square, 1);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.hitstun_scaling = 0.5;
					}
				break;
				}
			//Second Jab Active
			case 4:
				{
				//Animation
				if (attack_frame == 1)
					anim_frame = 9
				if (attack_frame == 0)
					anim_frame = 10
			
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 10;
					}
				break;
				}
			//Second Jab Endlag
			case 5:
				{
				//Animation
				if (attack_frame == 1)
					anim_frame = 13;
				if (attack_frame == 0)
					anim_frame = 14;
			
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
	
	//Hurtbox
	}
/* Copyright 2025 Springroll Games / Yosi */