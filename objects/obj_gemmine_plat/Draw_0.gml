if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	var _color = merge_color(c_white, c_white, background_get_clear_amount());
	draw_sprite_ext(gemmineplatform, (y > 752 ? 1 : 0), x, y, 2, 2, 0, _color, 1);
	if (game_surface_enable) surface_reset_target();
	}
/* Copyright 2025 Springroll Games / Yosi */