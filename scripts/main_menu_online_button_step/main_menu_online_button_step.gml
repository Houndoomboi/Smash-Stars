function main_menu_online_button_step(){
ui_button_step();
if (ui_clicked)
    {
    menu_sound_play(snd_menu_select);
    room_goto(rm_main_menu_online_submenu);
    }
	
if (ui_hovered) 
	{
		with (obj_main_menu_online_display_image) {sprite_index = spr_online;}
	}
else 
	{
		with (obj_main_menu_online_display_image) {
			sprite_index = noone;
		}
	}
}

