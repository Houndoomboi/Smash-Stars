draw_self();
//place_meeting(x, y, id))
var _x = -1;
var _y = -1;
if (ds_list_size(obj_ui_runner.cursors) > 0)
  {
  _x = obj_ui_runner.cursors[| 0][@ UI_CURSOR.x];
  _y = obj_ui_runner.cursors[| 0][@ UI_CURSOR.y];
  }
if (position_meeting(_x, _y, id)) {
  // draw the preview stuff to the screen 
  if (sprite=arcadeicon){
	draw_sprite(spr_arcade_trio, 0, room_width*3/4, room_height/2);
  }
    if (sprite=battleIcon){
	draw_sprite(spr_battle, 0, room_width*3/4, room_height/2);
  }
    if (sprite=extrasicon){
	draw_sprite(spr_extras, 0, room_width*3/4, room_height/2);
  }
    if (sprite=settingsicon){
	draw_sprite(spr_settings, 0, room_width*3/4, room_height/2);
  }
}