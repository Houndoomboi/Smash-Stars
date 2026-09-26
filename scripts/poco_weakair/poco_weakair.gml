function poco_weakair(){
//Neutral Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
	allow_hitfall();
	aerial_drift();
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
				anim_sprite = spr_poco_weakair;
				anim_speed = 0;
				anim_frame = 0;
		
				landing_lag = 12;
				speed_set(0, -1, true, true);
				attack_frame = 5;
				return;
				}
			//First Hit
			case 0:
				{
				//Animation
				if (attack_frame == 5)
					anim_frame = 1;
				if (attack_frame == 3)
					anim_frame = 2;
				
				if (attack_frame == 0)
					{
					anim_frame = 3;
			
					attack_phase++;
					attack_frame = 4;
					var _hitbox = hitbox_create_melee(32, 0, 0.4, 1, 3, 6, 0.4, 6, 45, 2, SHAPE.rotation, 0);
				
					hitbox_sprite_angle_set(_hitbox, 340);
					_hitbox.hit_sfx = snd_hit_weak0;
					_hitbox.hit_vfx_style = HIT_VFX.slash_medium;
					}
				break;
				}
			//Second Hit
			case 1:
				{
				//Animation
				if (attack_frame == 3)
					anim_frame = 4;
				
				//Reduce landing lag on hit
				if (attack_connected())
					{
					landing_lag = 5;
					}
				
				if (run && attack_frame == 0)
					{
					anim_frame = 5;
				
					attack_phase++;
					attack_frame = 22;
					var _hitbox = hitbox_create_melee(32, 0, 0.5, 1, 7, 6, 0.4, 6, 85, 7, SHAPE.circle, 1, FLIPPER.sakurai_reverse);
					hitbox_sprite_angle_set(_hitbox, 20);
					_hitbox.hit_sfx = snd_hit_weak0;
					_hitbox.hit_vfx_style = HIT_VFX.slash_weak;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 17)
					anim_frame = 6;
				if (attack_frame == 11)
					anim_frame = 7;
				if (attack_frame == 5)
					anim_frame = 8;
				
				//Reduce landing lag on hit
				if (attack_connected())
					{
					landing_lag = 5;
					}

				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}
			}
		}
	//Movement
	move();
}