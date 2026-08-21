///@category Attacking
/*
Allows a player to start a smash attack, or an aerial attack if in the air, and returns true if they do.
The "A+B smash" and "smash stick" special control settings affect what inputs can be used to start smash attacks.
*/
function allow_smash_attacks()
	{
	var _started = false;
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.smash);
	var _smash_button = input_pressed(INPUT.smash, buffer_time_standard, false);
	var _ab_smash = (scs[@ SCS.AB_smash] && input_pressed(INPUT.attack, buffer_time_standard, false) && input_pressed(INPUT.special, buffer_time_standard, false));
	var _smash_stick = (scs[@ SCS.smash_stick] && stick_flicked(Lstick, DIR.any, buffer_time_standard, false) && input_pressed(INPUT.attack, buffer_time_standard, false));
	//Smash stick override
	if (_smash_stick) then _stick = Lstick;
	//Check for all possible smash inputs
	if (_smash_button || _ab_smash || _smash_stick)
		{
		//If the player is on the ground
		if (on_ground())
			{
					{
					//Change direction 
					_started = attack_start(my_attacks[$ "Fsmash"], true, Lstick);
					}
			return _started;
			}
		else
		//If the player is in the air
			{
			if (item_system_type == ITEM_SYSTEM_TYPE.standard ||
				item_system_type == ITEM_SYSTEM_TYPE.simplified)
				{
				//Pick up items and continue attacking
				pick_up_item();
				}
					{
					_started = attack_start(my_attacks[$ "Dair"], true);
					}
			return _started;
			}
		}
	return false;
	}
/* Copyright 2025 Springroll Games / Yosi */