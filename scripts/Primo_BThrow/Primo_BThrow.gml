function Primo_BThrow()
	{
	//Backward Throw for Polygon
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_primo_backthrow;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 8;
				
				//Grant superarmor to avoid interruptions
				invulnerability_set(INV.superarmor, 25);
			
				//No speed
				speed_set(0, 0, false, false);
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 1;
			
				if (attack_frame == 6)
					{
					anim_frame = 2;
					}
				if (attack_frame == 3)
					{
					anim_frame = 2;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 3;
					attack_phase++;
					attack_frame = 15;
					game_sound_play(snd_hit_light);
					var _hitbox = hitbox_create_melee(0, 10, 0.8, 2, 5, 4, 0.8, 1, 180, 3, SHAPE.circle, 0);
					_hitbox.hit_vfx_style = HIT_VFX.electric;
					_hitbox.hit_sfx = snd_hit_weak1;
					_hitbox.extra_hitlag = 22;
					_hitbox.custom_hitstun = 34;
					}
				break;
				}
			//Active -> Finish
			case 1:
				{
				//Animation
				if (attack_frame == 12)
					anim_frame = 4;
				if (attack_frame == 9)
					anim_frame = 5;
				if (attack_frame == 6)
					anim_frame = 6;
				if (attack_frame == 3)
					anim_frame = 7;
					
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			}
		}
	//No movement
	}
/* Copyright 2025 Springroll Games / Yosi */