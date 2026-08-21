function ui_image_draw()
	{
	sprite_index = sprite;
	image_index = frame;
	
	if (sprite_exists(sprite_index))
		{
		draw_self();
		}
	}
/* Copyright 2025 Springroll Games / Yosi */