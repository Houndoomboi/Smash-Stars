//Input - accept from all devices
var _confirm = false;
var _start = false;
var _select = false;
var _option = false;
var _array = mis_devices_get_array();
var _skip = false;
for (var i = 0; i < array_length(_array); i++)
	{
	var _id = _array[@ i];
	if (mis_device_input(_id, MIS_INPUT.confirm)) then _confirm = true;
	if (mis_device_input(_id, MIS_INPUT.start)) then _start = true;
	if (mis_device_input(_id, MIS_INPUT.select)) then _select = true;
	if (mis_device_input(_id, MIS_INPUT.option)) then _option = true;
	}
	
	
if (_confirm || _start)
	{
	//Stop victory theme
	audio_stop_all();
	menu_sound_play(snd_menu_start);
	room_goto(rm_arcade_css);
	exit;
	}