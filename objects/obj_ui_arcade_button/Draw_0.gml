draw_self();
//place_meeting (x, y, obj)
if (position_meeting(mouse_x, mouse_y, id)) {
  // draw the preview stuff to the screen 
  draw_sprite(spr_arcade_trio, 0, room_width*3/4, room_height/2);
}