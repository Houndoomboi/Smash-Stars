function main_menu_extras_button_step()
	{
	ui_button_step();
	
	if (ui_clicked)
		{
		if (room != rm_main_menu_extras_submenu ||
		array_length(layer_get_all_elements("Input")) == 0) {
			menu_sound_play(snd_menu_alert);
		}
		main_menu_sidebar_choose(name);
		
		}
	if (ui_hovered) 
		{			
			with (obj_main_menu_extras_display_image) {sprite_index = spr_extras;}
		}
	else 
		{
			with (obj_main_menu_extras_display_image) {sprite_index = noone;}
		}
	}
	
	
	
/* Copyright 2026 Springroll Games / Yosi */