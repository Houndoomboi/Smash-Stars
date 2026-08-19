///@category Collisions
/*
Moves a player based on their previously set speeds.
Players cannot move downward through platforms.
*/
function move_hit_platforms()
	{
	speed_fraction();
	move_x();
	move_y(false);
	}
/* Copyright 2025 Springroll Games / Yosi */