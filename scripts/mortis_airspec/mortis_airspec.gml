function mortis_airspec()
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

				anim_sprite = spr_mortis_airspecial;
				anim_speed = 0;
				anim_frame = 0;
				reverse_b();
				attack_frame = 12;
				return;
				
				}
				
			//Startup
			case 0:
				{

					if (attack_frame == 9)
					anim_frame = 1;
					if (attack_frame == 6)
					anim_frame = 2;
					if (attack_frame == 3)
					anim_frame = 3;
				if (attack_frame == 0)
					{
					attack_frame = 45;
					anim_frame = 4;
					attack_phase++;
					global.AirSpecialUsed++
					if (!hsp * facing == 0){ speed_set(4 * facing, -22.5, false, false);}
					else{ speed_set(0, -22.5, true, false)}
					}
				break;
				}
			//Aerial Height
			case 1:
				{
				if (attack_frame == 43)
					anim_frame = 5;
				if (attack_frame == 41)
					anim_frame = 6;
				if (attack_frame == 39)
					anim_frame = 7;
				if (attack_frame == 37)
					anim_frame = 8;		
				if (attack_frame == 35)
					anim_frame = 9;
				if (attack_frame == 33)
					anim_frame = 10;
				if (attack_frame == 31)
					anim_frame = 11;
				if (attack_frame ==  29)
					anim_frame = 12;	
				if(attack_frame == 27)
					anim_frame = 13
				if (attack_frame == 25)
					anim_frame = 14;
				if (attack_frame ==  23)
					anim_frame = 15;
				if (attack_frame ==  21){
					attack_frame = 3;
					attack_phase++
				}
				break;
			}
			//Endlag
			case 2:
			{
				if(attack_frame == 0)

					if(global.AirSpecialUsed < 1){

						attack_stop(PLAYER_STATE.aerial);
					}else{
						attack_stop(PLAYER_STATE.helpless);
					}
					break;

				}

			}
		}
	//Movement
	move();
	}
/* Copyright 2025 Springroll Games / Yos