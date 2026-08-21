function colt_airstrong()
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
				anim_sprite = spr_colt_strongair;
				anim_frame = 0;
				
				landing_lag = 18;
				attack_frame = 12;
				return;
				}
			//Startup
			case 0:
				{
				if (attack_frame == 9)
					anim_frame = 1;
					if (attack_frame == 6)
					anim_frame = 2;
				if (attack_frame == 3)
					anim_frame = 3;
				if (attack_frame == 0)
					{
					anim_frame = 4;
					attack_phase++;
					attack_frame = 20;
					game_sound_play(snd_punch1);
					var _proj = hitbox_create_projectile(32, 8, 0.4, 0.4, 5, 6, 1, 0, 20, SHAPE.circle, 12, 0);
					_proj.bounce_multiplier = 0;
					_proj.destroy_on_blocks = true;
					_proj.grav = 0;
					_proj.overlay_facing = facing;
					_proj.overlay_sprite = spr_coltbullet;
					_proj.overlay_frame = 0;
					_proj.base_hitlag = 5;
					_proj.hit_vfx_style = HIT_VFX.normal_weak;
					speed_set((-14 * facing), 0, true, false)

					}
				break;
				}
			//Active
			case 1:
				{
				//Animation
				if (attack_frame == 17)
					anim_frame = 6;
				if (attack_frame == 14)
					anim_frame = 7;
				if (attack_frame == 11)
					anim_frame = 8;
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					}
					
				//Reduce landing lag on hit
				if (attack_connected())
					{
					landing_lag = 7;
					}
				break;
				}
			}
		}
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yosi */