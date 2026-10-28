///The passive script for Polygon
function sirius_passive()
	{
	var _on_ground = on_ground();
	var _is_knocked_out = is_knocked_out();
	
	//Floaty jump variables
	var _float_time = 19;
	var _float_max_speed = -12;
	var _float_accel = -1.7;
	var _float_dip = 3;
	var _float_dip_time = 2;
	if (!variable_struct_exists(custom_passive_struct, "float_frame"))
		{
		custom_passive_struct.float_frame = _float_time;
		}
	
	//Reset the float frame when you start a double jump
	if (state == PLAYER_STATE.aerial && jump_is_midair_jump && state_time == 0)
		{
		custom_passive_struct.float_frame = 0;
		speed_set(0, _float_dip, true, false);
		}
	else if (state == PLAYER_STATE.aerial || (state == PLAYER_STATE.attacking && !_on_ground))
		{
		if (custom_passive_struct.float_frame > _float_dip_time &&
			custom_passive_struct.float_frame < _float_time &&
			vsp > _float_max_speed)
			{
			speed_set(0, _float_accel, true, true);
			}
		custom_passive_struct.float_frame++;
		}
	else
		{
		custom_passive_struct.float_frame = _float_time;
		}
	

	}
/* Copyright 2025 Springroll Games / Yosi */