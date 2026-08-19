function shelly_airspecial()
	{
	//Jab
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_shelly_airshot;
				anim_speed = 0;
				anim_frame = 0;
				reverse_b();
				attack_frame = 10;
				return;
				}
			//Startup
			case 0:
				{
					if (attack_frame == 7)
					anim_frame = 1;
					if (attack_frame == 3)
					anim_frame = 2;
				if (attack_frame == 0)
					{
					anim_frame = 3;
					attack_phase++;
					attack_frame = 3;
					game_sound_play(snd_swing0);
					speed_set(6 * facing, -14, false, false)
					var _hitbox = hitbox_create_melee(20, 10.5, 0.5, 0.6, 11, 5.5, 1, 23, 40, 8, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.hit_sfx = snd_hit_strong1;
					_hitbox.shieldstun_scaling = 0.1;
					_hitbox.hitstun_scaling = 0.5;
					}
				break;
				}
			//Active
			case 1:
				{
				if (attack_frame == 0)
					{
					anim_frame = 4;
					attack_phase++;
					
					//Whiff lag
					attack_frame = 18;
					}
				}
			//Endlag
			case 2:
				{
					if (check_ledge_grab()) return;
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.helpless);
					}
				break;
				}
			}
		}
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yosi */