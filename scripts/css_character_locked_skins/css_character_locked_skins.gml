//Before the semicolon, name the locked skin, and use it later in cheat_codes_check_script
//1st value of the array is the character_find function to get the character
//2nd value is the column the skin appears in the palette, start counting with 0

//also make sure there are always 6 unlocked skins for 6 players/bots, the game won't crash
//it will just use some of the locked skins in battle anyways



function css_character_locked_skins() {
	lockedSkins = {
		dumplingDarryl: [character_find("Darryl"),2],
		ralseiPoco: [character_find("Poco"),9]
	
	
	







	};
	return lockedSkins;

}