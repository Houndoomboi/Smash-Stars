function leon_grab(){
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
				anim_sprite = spr_leon_grab;
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
			//Startup -> Active
			case 3:
				{
				//Launch hitbox
				if (attack_frame == 39)
					{
					anim_frame = 1;
					//Move the player to the correct position
					grabbed_id.x = x + (45 * facing);
					grabbed_id.y = y;
					var _hitbox = hitbox_create_targetbox(45, 0, 1, 1, 3, 13, 0, 4, 45, 1, SHAPE.square, 0, grabbed_id);
					_hitbox.drift_di_multiplier = 0;
					_hitbox.di_angle = 0;
					_hitbox.asdi_multiplier = 0;
					_hitbox.hit_vfx_style = [HIT_VFX.normal_strong];
					_hitbox.hit_sfx = snd_hit_strong1;
					_hitbox.knockback_state = PLAYER_STATE.balloon;
					}
					
				//Animation
				if (attack_frame == 31 ||
					attack_frame == 28 ||
					attack_frame == 22 ||
					attack_frame == 19)
					{
					anim_frame++;
					}
					
				//Projectiles
				if (attack_frame == 34 || attack_frame == 25)
					{
					anim_frame++;
					game_sound_play(snd_hit_shot);
					var _dir = 30;
					var _hsp = lengthdir_x(18, _dir);
					var _vsp = lengthdir_y(18, _dir);
					var _projectile = hitbox_create_projectile(32, -4, 0.4, 0.4, 1, 3, 0, 50, 60, SHAPE.circle, _hsp, _vsp);
					if (facing == -1) then _dir = 180 - _dir;
					hitbox_overlay_sprite_set(_projectile, spr_mewtwo_fthrow_projectile, 0, 1, 2, _dir, c_white, 1, 1);
					_projectile.destroy_on_blocks = false;
					_projectile.base_hitlag = 15;
					_projectile.asdi_multiplier = 0;
					_projectile.di_angle = 0;
					_projectile.drift_di_multiplier = 0;
					_projectile.hit_vfx_style = [HIT_VFX.normal_weak, HIT_VFX.magic];
					_projectile.hit_sfx = snd_hit_wind;
					_projectile.background_clear_allow = false;
					}
				if (attack_frame == 16)
					{
					anim_frame++;
					game_sound_play(snd_hit_shot);
					var _dir = 30;
					var _hsp = lengthdir_x(18, _dir);
					var _vsp = lengthdir_y(18, _dir);
					var _projectile = hitbox_create_projectile(32, -4, 0.4, 0.4, 4, 7, 0.85, 50, 60, SHAPE.circle, _hsp, _vsp);
					if (facing == -1) then _dir = 180 - _dir;
					hitbox_overlay_sprite_set(_projectile, spr_mewtwo_fthrow_projectile, 0, 1, 2, _dir, c_white, 1, 1);
					_projectile.destroy_on_blocks = false;
					_projectile.base_hitlag = 2;
					_projectile.hit_vfx_style = [HIT_VFX.normal_medium, HIT_VFX.magic];
					_projectile.hit_sfx = snd_hit_wind;
					}
				
				if (attack_frame == 14)
					anim_frame = 9;
				if (attack_frame == 9)
					anim_frame = 10;
				if (attack_frame == 5)
					anim_frame = 11;
					
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			}
		}
	//Stay on the ground
	move_grounded();
	}
/* Copyright 2025 Springroll Games / Yosi */