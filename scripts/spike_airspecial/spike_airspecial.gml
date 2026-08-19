function spike_airspecial()
	{
	//Jab
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav / 3, max_fall_speed / 3);
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_spike_airspecial;
				anim_speed = 0.5;
				anim_frame = 0;
				reverse_b();
				attack_frame = 3;
				return;
				}
			//Startup
			case 0:
				{
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 60;
					game_sound_play(snd_swing0);
					speed_set(hsp, -12, true, false);
					}
				break;
				}
			//Active
			case 1:
				{
				aerial_drift();
				if (attack_frame == 0)
					{
					attack_phase++;
					}
				}
			//Endlag
			case 2:
				{
					if (check_ledge_grab()) return;
					//Wall Jump Cancel
				if (check_wall_jump())
					{
					attack_stop_preserve_state();
					return;
					}
			aerial_drift();
				if (fastfall_attack_try() || on_ground())
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