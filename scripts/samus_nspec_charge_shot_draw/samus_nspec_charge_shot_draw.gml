function samus_nspec_charge_shot_draw()
	{
	//Neutral Special - Draw
	//Charging up
	if (attack_phase == 1 || attack_phase == 2)
		{
		var _total_charge = 125;
		var _size = lerp(0.45, 1.55, (custom_attack_struct.samus_nspec_charge_shot_charge / _total_charge));
		
		global.pocoProjSprite = spr_poco_projectile_1;
		
		
		if (ex_move_is_activated()) then _size = 1;
		palette_shader_set(palette_base, palette_swap, 0.0, 1.0, fade_value, false);
		
		var yDisplace = 0;
		
		
		if (custom_attack_struct.samus_nspec_charge_shot_charge <  50) {
			draw_sprite_ext(spr_poco_projectile, 0, x, y-yDisplace, _size, _size, 0, c_white, 1);
			global.pocoProjSprite = spr_poco_projectile_1;
		}
		else if (custom_attack_struct.samus_nspec_charge_shot_charge <  100) {
			if (custom_attack_struct.samus_nspec_charge_shot_charge < 55) { 	
				draw_sprite_ext(spr_poco_projectile, 1, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else if (custom_attack_struct.samus_nspec_charge_shot_charge < 60) { 	
				draw_sprite_ext(spr_poco_projectile, 2, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else if (custom_attack_struct.samus_nspec_charge_shot_charge < 65) { 	
				draw_sprite_ext(spr_poco_projectile, 3, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else if (custom_attack_struct.samus_nspec_charge_shot_charge < 70) { 	
				draw_sprite_ext(spr_poco_projectile, 4, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else  { 	
				draw_sprite_ext(spr_poco_projectile, 5, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			global.pocoProjSprite = spr_poco_projectile_2;
			
		}
		else {
			if (custom_attack_struct.samus_nspec_charge_shot_charge < 105) { 	
				draw_sprite_ext(spr_poco_projectile, 6, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else if (custom_attack_struct.samus_nspec_charge_shot_charge < 110) { 	
				draw_sprite_ext(spr_poco_projectile, 7, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else if (custom_attack_struct.samus_nspec_charge_shot_charge < 115) { 	
				draw_sprite_ext(spr_poco_projectile, 8, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else if (custom_attack_struct.samus_nspec_charge_shot_charge < 120) { 	
				draw_sprite_ext(spr_poco_projectile, 9, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			else  { 	
				draw_sprite_ext(spr_poco_projectile, 10, x, y-yDisplace, _size, _size, 0, c_white, 1);
			}
			global.pocoProjSprite = spr_poco_projectile_3;
		}
		
		
		/*
		draw_sprite_ext
			(
			spr_samus_nspec_charge_shot_projectile, 
			obj_game.current_frame div 3, 
			x + (45 * facing), 
			y, 
			_size, 
			_size, 
			0, 
			c_white, 
			1
			);
		shader_reset();
		
		*/
		}
	}
/* Copyright 2025 Springroll Games / Yosi */