///@description Draw all controls

if (!disable && visible)
	{
	with (obj_touch_button)
		{
		event_user(Game_Event_Draw);
		}
	with (obj_touch_stick)
		{
		event_user(Game_Event_Draw);
		}
	}

/* Copyright 2025 Springroll Games / Yosi */