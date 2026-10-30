//Find the image for the character player played as

var winImage;
var _array = css_players_get_array();
var _character = css_player_get(_array[@ 0], CSS_PLAYER.character);
	
switch (_character) {
	case 0: winImage = spr_colt_arcadeWin; break; //colt
	case 1: winImage = spr_shelly_idle; break; //shelly
	case 2: winImage = spr_spike_idle; break; //spike
	case 3: winImage = spr_elprimo_idle; break; //el primo
	case 4: winImage = spr_crow_idle; break; //crow
	case 5: winImage = spr_nita_idle; break; //nita
	case 6: winImage = spr_mortis_idle; break; //mortis
	case 7: winImage = spr_poco_idle; break; //poco
	case 8: winImage = spr_darryl_idle; break; //darryl
	case 9: winImage = spr_leon_idle; break; //leon
	//case 10 is Poco P
	case 11: winImage = spr_sirius_idle; break; //sirius 
	default: winImage = spr_extras; break;
}

draw_sprite_ext(winImage, 0, 0, 0, 0.375, 0.375, 0, c_white, 1);


var livesString = string(global.arcadeStocks) + " / " + string(global.originalStocks);

//other text
draw_set_font(fnt_main_menu);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(screen_width - 215, 14, "YOU WIN!!!");
draw_text(screen_width - 215, 94, "Lives left:");
draw_text(screen_width - 215, 134, livesString);
draw_text(screen_width - 215, screen_height - 120, "Press");
draw_text(screen_width - 215, screen_height - 80, "Confirm To");
draw_text(screen_width - 215, screen_height - 40, "Continue...");
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(screen_width - 210, 10, "YOU WIN!!!");
draw_text(screen_width - 210, 90, "Lives left:");
draw_text(screen_width - 210, 130, livesString);
draw_text(screen_width - 210, screen_height - 124, "Press");
draw_text(screen_width - 210, screen_height - 84, "Confirm To");
draw_text(screen_width - 210, screen_height - 44, "Continue...");