function rick_fspec_portal()
	{
	//Forward Special
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
				anim_sprite = spr_fox_dspec_shine;
				anim_speed = 0;
				anim_frame = 0;

				attack_frame = 10;
				
				custom_attack_struct.portal_x = x + (128 * facing);
				custom_attack_struct.portal_y = y;
				
				callback_add(callback_draw_end, rick_fspec_portal_draw);
				
				speed_set(0, 0, false, false);
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 5)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
				
					attack_phase++;
					attack_frame = 10;
					}
				break;
				}
			//Positioning
			case 1:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 3;
				
				//Dodge cancel
				if (cancel_airdodge_check()) then return;
				
				//Move the portal location
				var _speed = 6;
				if (stick_tilted(Lstick, DIR.horizontal) && sign(stick_get_value(Lstick, DIR.horizontal)) == facing)
					{
					custom_attack_struct.portal_x += (_speed * facing);
					}
				if (stick_tilted(Lstick, DIR.vertical))
					{
					custom_attack_struct.portal_y += (_speed * sign(stick_get_value(Lstick, DIR.vertical)));
					}
				
				//Place the portal
				if (attack_frame <= 0 && !input_held(INPUT.special))
					{
					if (!collision_point(custom_attack_struct.portal_x, custom_attack_struct.portal_y, obj_solid, false, true))
						{
						entity_create(custom_attack_struct.portal_x, custom_attack_struct.portal_y, obj_rick_fspec_portal);
					
						//Aerial version: create a portal next to yourself
						if (!on_ground())
							{
							entity_create(x, y, obj_rick_fspec_portal);
							}
						}
					
					attack_cooldown_set(60);
					attack_frame = 5;
					attack_phase++;
					
					//Destroy the oldest portal if there are more than 2
					var _num_portals = 0;
					var _oldest_portals = []
					with (obj_rick_fspec_portal)
						{
						if (owner == other.id)
							{
							_num_portals++;
							if (array_length(_oldest_portals) == 0)
								{
								array_push(_oldest_portals, id);
								}
							else if (sync_id < _oldest_portals[@ 0].sync_id)
								{
								array_insert(_oldest_portals, 0, id);
								}
							else
								{
								array_push(_oldest_portals, id);
								}
							}
						}
					while (_num_portals > 2)
						{
						instance_destroy(_oldest_portals[@ 0]);
						array_delete(_oldest_portals, 0, 1);
						_num_portals--;
						}
					}
				break;
				}
			//Endlag
			case 2:
				{
				if (!on_ground())
					{
					friction_gravity(air_friction, grav, max_fall_speed);
					aerial_drift();
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