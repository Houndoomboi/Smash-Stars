///@category GGMR
///@param {bool} [count_pressed_inputs]		Whether pressed inputs are counted or not
/*
Adds inputs for all local players using the local_input callback.
*/
function ggmr_session_input_add_local()
	{
	var _count_pressed_inputs = argument_count > 0 ? argument[0] : true;
	with (obj_ggmr_session) 
		{
		//Loop through all of the local players
		for (var i = 0; i < array_length(session_players_local); i++) 
			{
			var _number = session_clients_local[@ i];
			script_execute(session_callbacks.local_input, ggmr_session_input_buffer_get(_number), _number, _count_pressed_inputs);
			ggmr_session_input_received(_number);
			}
		return;
		}
	ggmr_crash("obj_ggmr_session did not exist when ggmr_session_input_add_local was called");
	}

/* Copyright 2026 Springroll Games / Yosi */