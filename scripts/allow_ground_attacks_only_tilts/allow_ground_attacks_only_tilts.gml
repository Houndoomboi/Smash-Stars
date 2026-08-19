///@category Attacking
/*
Allows a player to start a tilt, and returns true if they do.
*/
function allow_ground_attacks_only_tilts()
	{
	var _started = false;
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.attack);
	//If the player is on the ground
	if (on_ground())
		{
		//If the attack button has been pressed
		if (input_pressed(INPUT.attack, buffer_time_standard, false))
			{		
			if (_stick == Rstick)
				{
				//Change direction
				var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buffer_time_standard, false);
				if (_frame == -1) then _frame = 0;
				//Utilt
				if (stick_flicked(Rstick, DIR.up, buffer_time_standard, true, STICK_CHECK_TYPE.backwards))
					{
					_started = attack_start(my_attacks[$ "Utilt"], true, Rstick, _frame);
					}
				else
				//Dtilt
				if (stick_flicked(Rstick, DIR.down, buffer_time_standard, true, STICK_CHECK_TYPE.backwards))
					{
					_started = attack_start(my_attacks[$ "Dtilt"], true, Rstick, _frame);
					}
				else
				//Ftilt
				if (stick_flicked(Rstick, DIR.horizontal, buffer_time_standard, true, STICK_CHECK_TYPE.backwards))
					{
					_started = attack_start(my_attacks[$ "Ftilt"], true, Rstick, _frame);
					}
				}
			else
				{
				//Utilt
				if (stick_tilted(Lstick, DIR.up))
					{
					_started = attack_start(my_attacks[$ "Utilt"], true, Lstick);
					}
				else
				//Dtilt
				if (stick_tilted(Lstick, DIR.down))
					{
					_started = attack_start(my_attacks[$ "Dtilt"], true, Lstick);
					}
				else
				//Ftilt
				if (stick_tilted(Lstick, DIR.horizontal))
					{
					_started = attack_start(my_attacks[$ "Ftilt"], true, Lstick);
					}
				}
			return _started;
			}
		}
	return false;
	}
/* Copyright 2025 Springroll Games / Yosi */