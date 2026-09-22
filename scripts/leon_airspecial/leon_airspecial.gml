function leon_airspecial()
	{
	//Up Special
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Main Phases
	if (run)
		{
		switch (_phase)
			{
			//Initialize
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_leon_teleport;
				anim_speed = 0;
				anim_frame = 0;
			
				speed_set(0, 0, false, false);
				attack_frame = 24;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 24)
					anim_frame = 1;
				if (attack_frame == 21)
					anim_frame = 2;
				if (attack_frame == 18)
					anim_frame = 3;
				if (attack_frame == 15)
					anim_frame = 4;
				if (attack_frame == 12)
					anim_frame = 5;
				
				if (attack_frame == 9)
					{
					anim_frame = 6;
				if (attack_frame == 6)
					anim_frame = 7;
				if (attack_frame == 3)
					anim_frame = 8;
				if (attack_frame == 0)
					anim_frame = 9;
				
				
					//Invulnerability
					invulnerability_set(INV.invincible, 10);
				
					attack_frame = 10;
					attack_phase++;
					}
				break;
				}
			//Active
			case 1:
				{
				//Animation
				if (attack_frame == 6)
					anim_frame = 10;
				
				if (attack_frame == 0)
					{
					anim_frame = 11;
					game_sound_play(prng_choose(1, Leon_sneakytime, Leon_Invisibility));
					attack_phase++;
					var _hitbox = hitbox_create_melee(0, 0, 1.2, 1.1, 12, 5.5, 1, 23, 40, 8, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_medium;
					_hitbox.hit_sfx = snd_hit_strong1;
					_hitbox.shieldstun_scaling = 0.1;
					_hitbox.hitstun_scaling = 0.5;
					
					
					//Teleport
					var _teleport_dir = stick_tilted(Lstick) ? stick_get_direction(Lstick) : 90;
					var _teleport_length = 250;
					var _move_x = lengthdir_x(_teleport_length, _teleport_dir);
					var _move_y = lengthdir_y(_teleport_length, _teleport_dir);
				
					move_x(_move_x);
				
					//Check ledge grab after every move vertically
					repeat (abs(_move_y))
						{
						move_y(false, sign(_move_y));
						
						//Snap to ledges
						if (check_ledge_grab()) then return;
						}
						
					//Reset the speed
					speed_set(0, 0, false, false);

					//Aerial vs grounded ending
					if (on_ground())
						{
						attack_frame = 15;
						attack_phase = 3;
						}
					else
						{
						landing_lag = 15;
						attack_frame = 18;
						attack_phase = 2;
						
						//Snap to ledges if you moved completely horizontally
						if (_move_y == 0)
							{
							if (check_ledge_grab()) then return;
							}
						}
					}
				break;
				}
			//Endlag aerial
			case 2:
				{
				//Snap to ledges
				if (check_ledge_grab()) then return;
						
				//Animation
				if (attack_frame == 18)
					anim_frame = 12;
				if (attack_frame == 15)
					anim_frame = 13;
				if (attack_frame == 12)
					anim_frame = 14;
				if (attack_frame == 9)
					anim_frame = 15;
				if (attack_frame == 6)
					anim_frame = 16;
				if (attack_frame == 3)
					anim_frame = 17;
				
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.helpless);
					}
				break;
				}
			//Endlag grounded
			case 3:
				{
				//Animation
				if (attack_frame == 12)
					anim_frame = 7;
				if (attack_frame == 9)
					anim_frame = 8;
				if (attack_frame == 6)
					anim_frame = 9;
				if (attack_frame == 3)
					anim_frame = 10;
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			}
		}
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yosi */