function poco_capo_jab(){
	//Jab for Da Capo Poco
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
				anim_sprite = spr_poco_weak_capo;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 12
				
				hurtbox_anim_match();
				return;
				}
			//First Jab Startup
			case 0:
				{
				//Animation
				if (attack_frame == 12)
					anim_frame = 1;
				if (attack_frame == 10)
					anim_frame = 2;
				if (attack_frame == 8)
					anim_frame = 3;
				if (attack_frame == 6)
					anim_frame = 4;
				if (attack_frame == 4)
					anim_frame = 5;
					
				if (attack_frame == 0)
					{
					anim_frame = 6;
			
					attack_phase++;
					attack_frame = 6;
					var _hitbox = hitbox_create_magnetbox(45, 3, 0.4, 0.2, 2, 5, -16, 6, 6, 4, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.can_be_parried = false;
					_hitbox.can_lock = true;
					}
				break;
				}
			//First Jab Active
			case 1:
				{
					
				if (attack_frame == 0)
					{
					anim_frame = 7;
					attack_phase++;
					attack_frame = 15;
					}
				break;
				}
			//First Jab Endlag
			case 2:
				{
				if (attack_frame == 5)
					anim_frame = 8;
					
				//Continue to next jab
				if (input_pressed(INPUT.attack, 12)) || (attack_connected() && input_held(INPUT.attack))
					{
					anim_frame = 9;
					attack_phase++;
					attack_frame = 8;
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
					anim_frame = 9;
					
				if (attack_frame == 2)
					{
					anim_frame = 10;
					attack_phase++;
					attack_frame = 2
					speed_set(facing * 6, 0, false, false);
					game_sound_play(snd_punch1);
					//Finisher
					var _hitbox = hitbox_create_melee(45, 4, 0.4, 0.2, 4, 6, 0.5, 6, 45, 6, SHAPE.square, 1);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.hitstun_scaling = 0.5;
					}
				break;
				}
			//Second Jab Active
			case 4:
				{
				if (attack_frame == 0)
					anim_frame = 11
			
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 12;
					}
				break;
				}
			//Second Jab Endlag
			case 5:
				{
					if (attack_frame = 8)
						anim_frame = 13
					if (attack_frame = 4)
						anim_frame = 14
			
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
	if (run)
		{
		hurtbox_anim_match();
		}
	}
/* Copyright 2025 Springroll Games / Yosi */