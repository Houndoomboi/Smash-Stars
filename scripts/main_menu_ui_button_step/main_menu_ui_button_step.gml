function main_menu_ui_button_step()
	{
	ui_button_step();
	
	if (ui_clicked)
		{
		menu_sound_play(snd_menu_alert);
		main_menu_sidebar_choose(name);
		}
	if (ui_hovered) 
		{
			with (obj_main_menu_display_image) {
				sprite_index = 1;
			}
		}
	}
	
	
/* Copyright 2026 Springroll Games / Yosi */