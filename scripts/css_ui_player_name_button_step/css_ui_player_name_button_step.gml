function css_ui_player_name_button_step()
	{
	ui_button_step();

	if (ui_clicked)
		{
		with (obj_css_player_window)
			{
			if (player_instance_id == other.player_instance_id)
				{
				menu_sound_play(snd_menu_select);
				state = CSS_PLAYER_WINDOW_STATE.select_profile;
				css_player_get(player_instance_id, CSS_PLAYER.custom).cursor_active = false;
				break;
				}
			}
		}
	}
/* Copyright 2026 Springroll Games / Yosi */