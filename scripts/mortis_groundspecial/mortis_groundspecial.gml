function mortis_groundspecial()
	{
	//Neutral Special
	/*
	- Hit the button for a silver bullet

	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions / Cancels

		friction_gravity(ground_friction, grav, max_fall_speed);
	
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_mortis_groundspecial
				anim_frame = 0;

		
				attack_frame = 25;
				
				reverse_b();
				return;
				}
				
			//Startup -> Throw
			case 0:
				{
				
					
				//Animation
				if (attack_frame == 24)
					//invulnerability_set(INV.normal, 5)
					anim_frame = 1;
					
				if (attack_frame == 21)
					anim_frame = 2;
					
				if (attack_frame == 18)
					anim_frame = 3;
					
				if (attack_frame == 15)
					anim_frame = 4;
				
				if (attack_frame == 10)
					{
					anim_frame = 5;
					
					game_sound_play(snd_punch0);
					
					//VFX
					var _vfx = vfx_create(spr_dust_dash_medium, 1, 0, 34, x, (bbox_bottom - 1) - 1, 2, 0, "VFX_Layer_Below");
					_vfx.vfx_xscale = 2 * facing;
			
						attack_phase++;
						attack_frame = 33;
					}
				break;
				}
			//Throw -> Finish
			case 1:
				{
				//Projectile
				if (attack_frame == 32){
					anim_frame = 6
	                var _damage = calculate_smash_damage(10)
					var _proj = hitbox_create_projectile(32, 8, 0.4, 0.4, _damage, 6, 1, 0, 20, SHAPE.circle, 15, 0);
					_proj.bounce_multiplier = 0;
					_proj.destroy_on_blocks = true;
					_proj.grav = 0;
					_proj.overlay_facing = facing;
					_proj.overlay_sprite = spr_mortis_batcloud
					_proj.base_hitlag = 5;
					game_sound_play(Nita_bear);
					_proj.hit_vfx_style = HIT_VFX.normal_weak;
					
					//Cooldown
					attack_cooldown_set(150);
					
				}
				//Animation
				if (attack_frame == 31)
					anim_frame = 7;

				if (attack_frame == 25)

					anim_frame = 8;
				if (attack_frame == 20)
			
					anim_frame = 9;
				if (attack_frame == 15)
					{
					sprite_scale = 1;
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