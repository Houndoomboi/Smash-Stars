function main_menu_arcade_button_step()
	{
	ui_button_step();
	
	if (ui_clicked)
		{
		menu_sound_play(snd_menu_alert);
		main_menu_sidebar_choose(name);
		}
	if (ui_hovered) 
		{			
			with (obj_main_menu_arcade_display_image) {sprite_index = spr_arcade_trio;}
		}
	else 
		{
			with (obj_main_menu_arcade_display_image) {sprite_index = noone;}
		}
	}
	
	
	
/* Copyright 2026 Springroll Games / Yosi */