function shelly_special()
	{
	//Neutral Special
	/*
	- Tap the button for a fast but weak fireball
	- Hold the button for a strong but slow fireball
	- Hold shield to not create a projectile
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions / Cancels
	if (on_ground())
		{
		friction_gravity(ground_friction, grav, max_fall_speed);
		}
	else
		{
		friction_gravity(air_friction, grav, max_fall_speed);
		}
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_shelly_shot;
				anim_frame = 0;
				anim_speed = 0;
		
				attack_frame = 13;
				
				reverse_b();
				return;
				}
			//Startup -> Throw
			case 0:
				{
				
				if (attack_frame == 8)
					{
					b_reverse();
					}
					
				//Animation
				if (attack_frame == 9)
					anim_frame = 1;
				if (attack_frame == 6)
					anim_frame = 2;
				if (attack_frame == 2)
					anim_frame = 3;
				
				if (attack_frame == 0)
					{
					anim_frame = 4;
					
					game_sound_play(Shotgun);
					
					//VFX
					var _vfx = vfx_create(spr_dust_dash_medium, 1, 0, 34, x, (bbox_bottom - 1) - 1, 2, 0, "VFX_Layer_Below");
					_vfx.vfx_xscale = 2 * facing;
						//Create the projectile 1 frame later, so if the melee hit lands the projectile will spawn after the hitlag
						attack_phase++;
						attack_frame = 33;
					}
				break;
				}
			//Throw -> Finish
			case 1:
				{
				//Projectile
				if (attack_frame == 32)
					{
						for (var i = 0; i < 15; ++i)
						{
					var _proj = hitbox_create_projectile(32, 8, 0.1, 0.1, 1, 1, 1, 10, 30, SHAPE.circle, prng_choose(i, 14, 13, 12, 11, 10, 13, 12, 11, 10), prng_choose(i, 0, 1, 2, 3, 4, -1, -2, -3, -4));
					_proj.bounce_multiplier = 0;
					_proj.destroy_on_blocks = true;
					_proj.grav = 0;
					_proj.overlay_sprite = spr_shelly_bullet;
					_proj.base_hitlag = 5;
					_proj.hit_vfx_style = HIT_VFX.normal_weak;
						}
						
					//Cooldown
					attack_cooldown_set(50);
					}
					
				//Animation
				if (attack_frame == 31)
					anim_frame = 4;
				if (attack_frame == 25)
					anim_frame = 5;
				if (attack_frame == 20)
					anim_frame = 6;
			
				if (attack_frame == 15)
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