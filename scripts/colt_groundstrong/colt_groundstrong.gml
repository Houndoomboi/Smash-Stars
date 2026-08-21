function colt_groundstrong()
	{
	//Ground Strong for Colt
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
				anim_sprite = spr_colt_groundstrong;
				anim_speed = 0;
				anim_frame = 0;

				attack_frame = 28
				
				hurtbox_anim_match();
				return;
				}
			case 0:
				{
				//Animation
				if (attack_frame == 20)
					anim_frame = 1;
				if (attack_frame == 12)
					anim_frame = 2;	
				if (attack_frame == 6)
					anim_frame = 3;
				if (attack_frame == 0)
					{
					anim_frame = 4;
			
					attack_phase++;
					attack_frame = 12;

					}
				break;
				}
			//Hitboxes
			case 1:
				{
				//Animation
				
				
				if (attack_frame == 12)
				{
					var _hitbox = hitbox_create_melee(125, 57, 2, 1, 2, 3, 0.1, 2, 0, 3, SHAPE.square,0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.can_be_parried = false;
					_hitbox.can_lock = true;
					anim_frame = 5;
				}
				if (attack_frame == 9){
					var _hitbox = hitbox_create_melee(125, 57, 2, 1, 2, 3, 0.1, 2, 0, 3, SHAPE.square, 1);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.can_be_parried = false;
					_hitbox.can_lock = true;
					anim_frame = 6;
				}
				if (attack_frame == 6){
					var _hitbox = hitbox_create_melee(125, 57, 2, 1, 2, 3, 0.1, 2, 0, 3, SHAPE.square, 2);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.can_be_parried = false;
					_hitbox.can_lock = true;
					anim_frame = 7;
				}
				if (attack_frame == 2){
					var _hitbox = hitbox_create_melee(125, 57, 2, 1, 4, 12, 0.8, 2, 0, 3, SHAPE.square, 3);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.can_be_parried = false;
					_hitbox.can_lock = true;
					anim_frame = 8;
				}
				if (attack_frame == 0)
					{
					anim_frame = 9;
					attack_phase++;
					attack_frame = 30;
					}
				break;
				}
			//Long Attack endlag
			case 2:
				{
				//Animation
				if (attack_frame == 27)
					anim_frame = 10;
				if (attack_frame == 24)
					anim_frame = 11;
				if (attack_frame == 18)
					anim_frame = 4;
				if (attack_frame == 12)
					anim_frame = 2;	
				if (attack_frame == 6)
					anim_frame = 1;
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
	//Hurtbox

/* Copyright 2025 Springroll Games / Yosi */
