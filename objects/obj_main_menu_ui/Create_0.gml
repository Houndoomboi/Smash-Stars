///@category Menus
/*
Handles the cursor on the main menu screen.
*/
only_one();

//Background animation


//Menu music
if (!audio_is_playing(song_menu)) 
	{
	audio_play_sound_adjusted(song_menu, 0, true, audiogroup_music_menu);
	}
/* Copyright 2025 Springroll Games / Yosi */