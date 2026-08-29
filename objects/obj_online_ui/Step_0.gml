//Get input from all MIS devices
var _confirm = false;
var _confirm_hold = 0;
var _gx = 0;
var _gy = 0;
var _array = mis_devices_get_array();
for(var i = 0; i < array_length(_array); i++)
    {
    var _id = _array[@ i];
    var _values = mis_device_stick_values(_id);
    if (_values.hold > 0)
        {
        _gx += _values.x;
        _gy += _values.y;
        }
    if (!_confirm) then _confirm = mis_device_input(_id, MIS_INPUT.confirm);
    if (_confirm_hold == 0) then _confirm_hold = mis_device_input(_id, MIS_INPUT.confirm, true);
    }

var _x = ui_cursor_x(0);
var _y = ui_cursor_y(0);

//Cursor speed
var _dir = point_direction(0, 0, _gx, _gy);
var _len = min(point_distance(0, 0, _gx * menu_cursor_speed, _gy * menu_cursor_speed), menu_cursor_speed);
_gx = lengthdir_x(_len, _dir);
_gy = lengthdir_y(_len, _dir);

//Update Cursor
ui_cursor_update
    (
    0,
    clamp(_x + _gx, 0, room_width - 1),
    clamp(_y + _gy, 0, room_height - 1),
    false,
    _confirm,
    _confirm_hold,
    );