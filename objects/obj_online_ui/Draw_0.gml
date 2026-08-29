//Draw the cursor
var _cursor = 0;
var _frame = 0;
if (ui_cursor_held_time(_cursor) > 0) then _frame = 1;
draw_sprite_ext(spr_menu_cursor, _frame, ui_cursor_x(_cursor), ui_cursor_y(_cursor), 1, 1, 0, c_white, 1);