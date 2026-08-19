///@category Attacking
/*
Allows a player to start aerial attacks, and returns true if they do.
*/
function allow_aerial_attacks()
	{
	var _started = false;
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.attack);
	//If the attack button was pressed
	if (input_pressed(INPUT.attack, buffer_time_standard, false))
		{
		//If the player is in the air
		if (!on_ground())
			{
			if (item_system_type == ITEM_SYSTEM_TYPE.standard ||
				item_system_type == ITEM_SYSTEM_TYPE.simplified)
				{
				//Pick up items and continue attacking
				pick_up_item();
				}
					_started = attack_start(my_attacks[$ "Nair"], true);
			return _started;
			}
		}
	//Tether Aerial
	else if (input_pressed(INPUT.grab, buffer_time_standard, false))
		{
		if (!on_ground())
			{
			if (item_system_type == ITEM_SYSTEM_TYPE.simplified)
				{
				//Try to pick up items. Stop the attack and clear the buffer if successful
				if (pick_up_item() != noone)
					{
					input_reset(INPUT.grab);
					return false;
					}
				}
				
			_started = attack_start(my_attacks[$ "Zair"], true);
			return _started;
			}
		}
	return false;
	}
/* Copyright 2025 Springroll Games / Yosi */