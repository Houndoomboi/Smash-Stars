function nita_airlight()
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
				anim_sprite = spr_nita_weakair;
				anim_speed = 0;
				anim_frame = 0;
				landing_lag = 8;
				attack_frame = 8;
				speed_set(0, -1, true, true);
				return;
				}
			//Startup
			case 0:
				{
				if (attack_frame == 4)
					anim_frame = 1;

				if (attack_frame == 0)
					{
					anim_frame = 2;
					game_sound_play(snd_swing1);
					var _hitbox = hitbox_create_melee(5.5, 0, 0.6, 0.6, 9, 9, 0.3, 8, 40, 12, SHAPE.circle, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					attack_frame = 20;
					attack_phase++;
					}
				break;
				}
			//Active
			case 1:
				{
					if (attack_frame == 16)
					anim_frame = 3;
					if (attack_frame == 12)
					anim_frame = 4;
					if (attack_frame == 8)
					anim_frame = 5;
					if (attack_frame == 4)
					anim_frame = 0;
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