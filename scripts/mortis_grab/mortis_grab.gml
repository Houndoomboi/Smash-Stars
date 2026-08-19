function mortis_grab()
	{
	//Neutral Special
	/*
	- Grabs enemies in front
	- Hold the button to delay the grab
	- Throws the enemy forwards or upwards, depending on if the stick is tilted or not
	*/
var run = true
	if(on_ground()) then run = true; else attack_stop(PLAYER_STATE.aerial)
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
				anim_sprite = spr_mortis_grab;
				anim_speed = 0;
				anim_frame = 0;
			
				attack_frame = 8;
				
				reverse_b();
				

					speed_set(0, 0, true, false);


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
						attack_phase = 1;
						attack_frame = 35;
					//VFX
	
						var _vfx = vfx_create(spr_dust_dash_medium, 1, 0, 34, x, (bbox_bottom - 1) - 1, 2, 0, "VFX_Layer_Below");
						_vfx.vfx_xscale = 2 * facing;
				
					game_sound_play(snd_swing3);
					}
				break;
				}
			//Active / Endlag (Uncharged)
			case 1:
				{
				//Hitbox
				if (attack_frame == 30)
					{
					anim_frame = 3;
					hitbox_create_detectbox(22, 4, 0.5, 0.5, 2, SHAPE.square, 0);
					}
				
				//Speeds
		
					friction_gravity(ground_friction, grav, max_fall_speed);

					
				if (attack_frame == 25)
					anim_frame = 4;
				if (attack_frame == 10)
					anim_frame = 1;
				if (attack_frame == 5)
					anim_frame = 0;
				
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			//Grabbing someone
			case PHASE.detection:
				{
				var _target = argument[1];
				var _hitbox = argument[2];
				var _hurtbox = argument[3];
				if (!object_is(_target.object_index, obj_player)) then return;
				switch (_hurtbox.inv_type)
					{
					case INV.invincible:
					case INV.deactivate:
					case INV.reflector:
						break;
					default:
					case INV.normal:
					case INV.parry_press:
					case INV.parry_shield:
					case INV.counter:
					case INV.shielding:
					case INV.powershielding:
					case INV.heavyarmor:
					case INV.superarmor:
						//Grab
						command_grab(_target, 20, -3);
						anim_frame = 3;
						attack_phase = 3;
						attack_frame = 40;
						
						speed_set(0, 0, false, false);
						
						with (_target)
							{
							player_move_to_front();
							}
						
						//Change target to face the player
						_target.facing = -facing;
						
						//Grab VFX
						var _dir = 65;
						var _vfx = vfx_create(spr_hit_grab, 0, 0, 16, mean(x, other.x), mean(y, other.y), 3, _dir, "VFX_Layer_Below");
						_vfx.shrink = 0.88;
						_vfx.spin = 9;
						_vfx.fade = true;
						var _vfx = vfx_create(spr_hit_grab, 0, 0, 16, mean(x, other.x), mean(y, other.y), 3, _dir + 180, "VFX_Layer_Below");
						_vfx.shrink = 0.88;
						_vfx.spin = 9;
						_vfx.fade = true;
						
						//Sound
						game_sound_play(snd_hit_grab);
						
						//Destroy the detectbox
						hitbox_destroy(_hitbox);
						break;
					}
				return;
				}
			//Throw
			case 3:
				{
				//Animation
				if (attack_frame == 36)
					anim_frame = 4;
				if (attack_frame == 33)
					anim_frame = 5;
				if (attack_frame == 30)
					anim_frame = 6;
				if (attack_frame == 27)
					anim_frame = 7;
				if (attack_frame == 24)
					anim_frame = 8;
				if (attack_frame == 21)
					anim_frame = 9;
				if (attack_frame == 18)
					anim_frame = 10;
				if (attack_frame == 15)
					anim_frame = 11;
				if (attack_frame == 12)
					anim_frame = 12;
				if (attack_frame == 9)
					anim_frame = 13;
				if (attack_frame == 6)
					anim_frame = 14;
				if (attack_frame == 3)
					anim_frame = 15;
					
				//Grab Position
				if (attack_frame == 36)
					{
					self_hitlag_frame = 5;
					grabbed_id.self_hitlag_frame = 5;
					}
				if (anim_frame <= 1)
					{
					grab_snap_move();
					}
				if (anim_frame == 5 || anim_frame == 11)
					{
					grabbed_id.x = x + (facing * 5);
					grabbed_id.y = y;
					}
				if (anim_frame == 6 || anim_frame == 12)
					{
					grabbed_id.x = x + (facing * -10);
					grabbed_id.y = y + -5;
					}
				if (anim_frame == 7 || anim_frame == 13)
					{
					grabbed_id.x = x + (facing * -15);
					grabbed_id.y = y + -9;
					}
				if (anim_frame == 8)
					{
					grabbed_id.x = x + (facing * 10);
					grabbed_id.y = y + -4;
					}
				if (anim_frame == 9)
					{
					grabbed_id.x = x + (facing * 29);
					grabbed_id.y = y + -4;
					}
				if (anim_frame == 10)
					{
					grabbed_id.x = x + (facing * 30);
					grabbed_id.y = y + -4;
					}
			
				//Throw hitbox
		
					
					//Cooldown on throw
					
					
				if (attack_frame == 8)
					{
						{
						var _hitbox = hitbox_create_targetbox(0, 0, 2, 2, 10, 10, 0.5, 8, 0, 3, SHAPE.circle, 2, grabbed_id);
						_hitbox.knockback_state = PLAYER_STATE.balloon;
						_hitbox.hit_sfx = snd_hit_strong0;
						_hitbox.hit_vfx_style = [HIT_VFX.normal_medium, HIT_VFX.lines];
						_hitbox.force_reeling = true;
						_hitbox.techable = false
					attack_cooldown_set(40);
						}
					
					//Cooldown on throw
					attack_cooldown_set(40);
					}

				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement

		move();
		
	}
/* Copyright 2025 Springroll Games / Yosi */