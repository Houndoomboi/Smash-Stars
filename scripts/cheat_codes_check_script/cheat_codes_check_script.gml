function cheat_codes_check_script()
    {
    if (argument[0] == "STARRMAN")
        {
        //Code to run if the expression equals Starrman
        engine().stats.unlock_sirius = true;
        stats_save();
        popup_create("A Starr Is Born!");
        show_debug_message("Unlocked Sirius!");
        }
		else if (argument[0] == "TOMAR753")
        {
        //Code to run if the expression equals Tomar753
        popup_create("He's already in the game. Stop Begging...");
        show_debug_message("Tomar753");
        }
			else if (argument[0] == "GRIFF")
        {
        //Code to run if the expression equals Tomar753
        popup_create("Griff Griff Griff Griff Griff Griff Griff Griff");
        show_debug_message("Griff Mentioned");
        }
				else if (argument[0] == "JUMPSCARE")
        {
        //Code to run if the expression equals Tomar753
        popup_create("BOO!");
        show_debug_message("BOO!");
        }
					else if (argument[0] == "GREEDYCELL")
        {
        //Code to run if the expression equals Tomar753
        popup_create("Everything now costs 10k gems, You're Welcome.");
        show_debug_message("BOO!");
        }
    else
        {
        popup_create("Invalid code " + string(argument[0]) + "!");
        show_debug_message("Invalid code " + string(argument[0]) + "!");
        }

    }