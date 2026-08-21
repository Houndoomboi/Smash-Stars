///@category Attacking
/*
Allows a player to start special attacks, and returns true if they do.
*/
function allow_special_attacks()
	{
	var _started = false;
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.special);
	//Special Attacks (ground or aerial)
	if (input_pressed(INPUT.special, buffer_time_standard, false))
		{
			//Nspec
					if (on_ground()) then _started = attack_start(my_attacks[$ "Nspec"], true);
					else _started = attack_start(my_attacks[$ "Uspec"], true);
		return _started;
		}
	return false;
	}
/* Copyright 2025 Springroll Games / Yosi */