function cheat_codes_check_script() {
	switch (argument[0]) {
		
		#region Characters
		//define default locked characters at the very top of engine_settings
		
		case "STARRMAN":
			unique_array_push(engine().stats.unlocked_characters,"Sirius");
			stats_save();
			popup_create("A Starr Is Born!");
			break;
			
		#region Skins
		//define skins locked by default in css_character_locked_skins 
		//Then use the same string you used to lock the skin here
		
		case "SOYSAUCE":
			unique_array_push(engine().stats.unlocked_skins,"dumplingDarryl");
			stats_save();
			popup_create("something something dumpling idk this is gonna be removed anyways");
			break;
		case "RALSEI":
			unique_array_push(engine().stats.unlocked_skins,"ralseiPoco");
			stats_save();
			popup_create("Okay...");
			break;
			case "SPLATATTACK":
			unique_array_push(engine().stats.unlocked_skins,"inklinggurlShelly");
			unique_array_push(engine().stats.unlocked_skins,"inklingboyShelly");
			stats_save();
			popup_create("Stay Fresh!");
			break;
			case "KNIGHTTHEORY":
			unique_array_push(engine().stats.unlocked_skins,"roryknightSirius");
			stats_save();
			popup_create("......");
			break;
			case "HOLLYJOLLY":
			unique_array_push(engine().stats.unlocked_skins,"HollySirius");
			stats_save();
			popup_create("Merry Christmas I guess...");
			break;
		
		#region Easter Eggs
			
		case "TOMAR753":
			popup_create("He's already in the game. Stop Begging...");
			break;
        case "GRIFF":
			popup_create("Griff Griff Griff Griff Griff Griff Griff Griff");
			break;
		case "JUMPSCARE":
			popup_create("BOO!");
			break;
		case "GREEDYCELL": 
			popup_create("Everything now costs 10k gems, You're Welcome.");
			break;
		default:
			popup_create("Invalid code " + string(argument[0]) + "!");
			break;
	}
}
		
function unique_array_push(_array,_value) {
	if (!array_contains(_array,_value)) {
		array_push(_array,_value);
	}
}