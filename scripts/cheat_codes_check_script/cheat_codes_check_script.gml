function cheat_codes_check_script()
    {
    if (argument[0] == "STARRMAN")
        {
        //Code to run if the expression equals Starrman
        engine().stats.unlock_sirius = true;
        stats_save();
        popup_create("Unlocked Sirius!");
        show_debug_message("Unlocked Sirius!");
        }
    else
        {
        popup_create("Invalid code " + string(argument[0]) + "!");
        show_debug_message("Invalid code " + string(argument[0]) + "!");
        }
    }