function end_anim_target(){

	//First 4 frames don't display anything (to make online play smoother)
	var _diff = (game_end_time - game_end_frame);
	if (_diff > 4)
		{
		//Fade in over the next 10 framesS
		var _col = c_black;
		if (_diff < 14)
			{
			draw_set_alpha(lerp(0, 0.5, _diff / 14));
			draw_rectangle_color(0, 0, screen_width, screen_height, _col, _col, _col, _col, false);
			draw_set_alpha(1);
			var _scale = 2;
			var _alpha = lerp(0, 1, _diff / 14);
			draw_sprite_ext
	                    (
						spr_match_end,
						0,
						center_x,
						center_y,
						1,
						1,
						0,
						c_white,
						_alpha,
						);
			}
		else
			{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, screen_width, screen_height, _col, _col, _col, _col, false);
			draw_set_alpha(1);
			var _scale = 2;
			var _alpha = lerp(0, 2, game_end_frame / game_end_time);
			draw_sprite_ext
	                    (
						spr_match_end,
						0,
						center_x,
						center_y,
						1,
						1,
						0,
						c_white,
						_alpha,
						);
			}
		}
	}

