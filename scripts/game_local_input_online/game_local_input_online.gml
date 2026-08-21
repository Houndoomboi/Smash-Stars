///@category Gameplay
///@param {buffer} buffer					The buffer to write the input data to
///@param {int} player_number				The number of the player to get inputs for
///@param {bool} [count_pressed_inputs]		Whether pressed inputs are counted or not
/*
Gets the input for a single local player, and writes the data to the given buffer.
Uses <game_local_input_write>.
You can optionally choose to NOT count pressed inputs, which is necessary if multiple frames are being run within 1 Step.
*/
function game_local_input_online()
	{
	//Buffers
	var _b = argument[0];
	var _num = argument[1];
	var _count_pressed_inputs = argument_count > 2 ? argument[2] : true;
	buffer_seek(_b, buffer_seek_start, 0);
	
	//Device / Custom Control specifications
	var _cc;
	var _d;
	var _dt;
	with (obj_player)
		{
		if (player_number == _num)
			{
			_cc = custom_controls;
			_d = device;
			_dt = device_type;
			break;
			}
		}
		
	//Read existing input data from buffer
	/*
	This allows the game to accumulate inputs over a few frames before using them, 
	which is useful if the game needs to drop frames while online to correct the rift.
	If the existing data in the buffer was NOT read, then dropped frames would also
	discard any player inputs that happened.
	
	Stick values are not accumulated, because the control stick cannot be in multiple
	positions at the same time.
	*/
	var _flag = buffer_read(_b, buffer_u32);
	buffer_seek(_b, buffer_seek_start, 0);
	
	game_local_input_write(_b, _d, _dt, _cc, _flag, _count_pressed_inputs);
	
	return;
	}
/* Copyright 2026 Springroll Games / Yosi */