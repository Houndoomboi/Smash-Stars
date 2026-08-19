function nita_strongair()
	{
	//Neutral Aerial
	/*
	- Jump cancelable on hit
	*/
	//Logic Control Variable
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
	aerial_drift();
	allow_hitfall();
	//Cancels
	if (run && cancel_ground_check()) then run = false;
	//Main Phases
	if (run)
		{
		switch (_phase)
			{
			//Initialize
			case PHASE.start:
				{
				anim_sprite = spr_nita_strongair;
				anim_frame = 0;
				landing_lag = 8;
				attack_frame = 8;
				return;
				}
			//Startup Hit 1
			case 0:
				{
				if (attack_frame == 4)
					anim_frame = 1;

				if (attack_frame == 0)
					{
					anim_frame = 2;
					game_sound_play(snd_swing1);
					var _hitbox = hitbox_create_melee(12, 0, 2, 2, 2, 4, 0.3, 2, -20, 6, SHAPE.square,0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_weak;
					attack_frame = 24;
					attack_phase++;
					}
				break;
				}
			//Hit 1 Active
			case 1:
				{
					if (attack_frame == 21)
					anim_frame = 3;
					if (attack_frame == 18){
					anim_frame = 4;
					var _hitbox = hitbox_create_melee(12, 0, 2, 2, 2, 4, 0.3, 2, -20, 6, SHAPE.square,1);
					_hitbox.hit_vfx_style = HIT_VFX.normal_weak;
					}
					if(attack_frame == 15)
						anim_frame = 5
			
					if(attack_frame == 12)
						anim_frame = 6
					if(attack_frame == 9)
						anim_frame = 7	
					
					if(attack_frame == 6){
						anim_frame = 8
				var _hitbox = hitbox_create_melee(12, 0, 2, 2, 3, 6, 0.3, 4, 40, 6, SHAPE.square,2);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					}
					if(attack_frame == 3)
						anim_frame = 9	
					if(attack_phase == 0){
						attack_stop(PLAYER_STATE.aerial)
					}


				if (attack_frame == 0)
					{
					sprite_scale = 1;
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}

			}
		}
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yosi */