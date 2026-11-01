var stageNum = array_length(global.arcadePlayedStages);
var chosenStage = array_get(global.arcadePlayedStages,stageNum-1);
var _stage = stage_data_get(chosenStage, STAGE_DATA.sprite);
var _stageName = stage_data_get(chosenStage, STAGE_DATA.name);
var _nameArray, goalString;

if (stageNum == 4) {
	draw_sprite_ext(spr_target, 0, 0, 0, 1, 1, 0, c_white, 1);
	_nameArray = ["You"];
	goalString = "Break All the Targets!";
} else if (stageNum == 5) {
	draw_sprite_ext(_stage, 0, 113, 74, 1, 1, 0, c_white, 1);
	_nameArray = ["You","G. Random","Rival","Rival"];
	goalString = "2v2";
} else if (stageNum == 8) {
	draw_sprite_ext(_stage, 0, 113, 74, 1, 1, 0, c_white, 1);
	_nameArray = ["You","Rival","Rival","Rival","Rival","Rival"];
	goalString = "Free For All!";
} else if (stageNum == 9) {
	draw_sprite_ext(spr_stage_ranch_icon, 0, 113, 74, 1, 1, 0, c_white, 1);
	_nameArray = ["You","The Darkest Starr"];
	goalString = "Defeat Sirius!";
} else {
	draw_sprite_ext(_stage, 0, 113, 74, 1, 1, 0, c_white, 1);
	_nameArray = ["You","Rival"];
	goalString = "1v1";
}

var livesString = string(global.arcadeStocks) + " / " + string(global.originalStocks);
var stagesString = "Stage " + string(stageNum) + " / 8";

//other text
draw_set_font(fnt_main_menu);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(230, 4, "Next Stage:");
draw_text(230, 44, _stageName);
draw_text(230, 84, goalString);

draw_text(screen_width - 205, 4, "Lives left:");
draw_text(screen_width - 80, 44, livesString);

draw_text(10, screen_height - 80, "You are on:");
draw_text(10, screen_height - 40, stagesString);

draw_text(screen_width - 555, screen_height - 40, "Press Confirm To Continue...");


draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(235, 0, "Next Stage:");
draw_text(235, 40, _stageName);
draw_text(235, 80, goalString);

draw_text(screen_width - 200, 0, "Lives left:");
draw_text(screen_width - 75, 40, livesString);

draw_text(15, screen_height - 84, "You are on:");
draw_text(15, screen_height - 44, stagesString);

draw_text(screen_width - 550, screen_height - 44, "Press Confirm To Continue...");


draw_set_alpha(1);
draw_set_font(fnt_podium_1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
//Screen width divided by the number of players in the match



var _xscale = 1 - (array_length(engine().player_data) * 0.1);
var _yscale = 1 - (array_length(engine().player_data) * 0.1);
		
for (var i = 0; i < array_length(engine().player_data); i++)
	{
	var _x = (screen_width/(array_length(engine().player_data) + 1) * (i+1));
	var _y = screen_height/2;
		
	var _character = player_data_get(i,0);
	var _color = player_data_get(i,1);
	
	_palette_base = character_data_get(_character, CHARACTER_DATA.palette_column_arrays)[@ 0];
	_palette_swap = character_data_get(_character, CHARACTER_DATA.palette_column_arrays)[@ _color];
	var _portrait = character_data_get(_character, CHARACTER_DATA.css_portrait);
	var _name = _nameArray[i];

	//Player portrait outline
	draw_sprite_ext(_portrait, 0, _x + 2, _y, _xscale, _yscale, 0, c_black, 1);
	draw_sprite_ext(_portrait, 0, _x - 2, _y, _xscale, _yscale, 0, c_black, 1);
	draw_sprite_ext(_portrait, 0, _x, _y + 2, _xscale, _yscale, 0, c_black, 1);
	draw_sprite_ext(_portrait, 0, _x, _y - 2, _xscale, _yscale, 0, c_black, 1);
		
	if (!setting().disable_shaders)
		{
		palette_shader_simple_set(_palette_base, _palette_swap);
		draw_sprite_ext(_portrait, 0, _x, _y, _xscale, _yscale, 0, c_white, 1);
		shader_reset();
		}
	else
		{
		var _blend = palette_color_get(character_data_get(_character, CHARACTER_DATA.palette_data), 0, _color);
		draw_sprite_ext(_portrait, 0, _x, _y, _xscale, _yscale, 0, _blend, 1);
		}
			
	//Name
	draw_text_outline(_x, _y + 52, _name, c_black, c_white);
	}
		
draw_set_alpha(1);