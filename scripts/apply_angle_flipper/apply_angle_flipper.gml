///@category Attacking
///@param {real} base_angle				The angle of the knockback before any flippers are applied
///@param {int} flipper					The angle flipper to use, from the FLIPPER enum
///@param {id} [attacking_player]		The id of the attacking player
///@param {id} [target_player]			The id of the target player
///@param {real} [knockback]			The amount of knockback
///@param {int} [facing]				The direction the attacking player is facing (-1 or 1)
/*
Calculates the knockback angle of an attack after applying an angle flipper.
Angle flippers change the angle of an attack based on things such as player position, damage, and the direction a player is facing.
	- standard: If the attacker is facing to the left, the angle is flipped horizontally.
	- from_player_center: The angle is set to the direction from the attacker to the target. Usually for 360 degree moves.
	- toward_player_center: The angle is set to the direction from the target to the attacker.
	- from_player_center_horizontal: The angle is flipped horizontally if the target is to the left of the attacker.
	- toward_player_center_horizontal: The angle is flipped horizontally if the target is to the right of the attacker.
	- from_hitbox_center: The angle is set to the direction from the hitbox to the target.
	- toward_hitbox_center: The angle is set to the direction from the target to the hitbox.
	- from_hitbox_center_horizontal: The angle is flipped horizontally if the target is to the left of the hitbox.
	- toward_hitbox_center_horizontal: The angle is flipped horizontally if the target is to the right of the hitbox.
	- sakurai: If the target is grounded, the angle changes based on the knockback threshold. If the target is aerial, the angle is a different number. The angle is also flipped afterwards, the same as standard.
	- sakurai_reverse: Same as sakurai, but the angle is flipped in the opposite direction at the end.
	- autolink: The angle is set to the direction from the attacker's current position to their estimated future position.
	- autolink_center: The angle is set to the direction from the target's current position to the attacker's estimated future position. Usually for multihit moves.
*/
function apply_angle_flipper()
	{
	var _angle = argument[0];
	var _flipper = argument[1];
	var _player = argument_count > 2 ? argument[2] : noone;
	var _target = argument_count > 3 ? argument[3] : noone;
	var _knockback = argument_count > 4 ? argument[4] : 0;
	var _facing = argument_count > 5 ? argument[5] : _player.facing;
	switch (_flipper)
		{
		case FLIPPER.standard:
			//Flips the angle based on the direction the player was facing
			if (_facing == -1)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.from_player_center:
			//Hits away from the player's origin
			if (_player.x != _target.x || _player.y != _target.y)
				{
				_angle = point_direction(_player.x, _player.y, _target.x, _target.y);
				}
			else
				{
				_angle = knockback_angle_default;
				}
			break;
		case FLIPPER.toward_player_center:
			//Hits toward the player's origin
			if (_player.x != _target.x || _player.y != _target.y)
				{
				_angle = point_direction(_target.x, _target.y, _player.x, _player.y);
				}
			else
				{
				_angle = knockback_angle_default;
				}
			break;
		case FLIPPER.from_player_center_horizontal:
			//Flips based on the target's position relative to the player
			if (_target.x < _player.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.toward_player_center_horizontal:
			//Flips based on the target's position relative to the player
			if (_target.x >= _player.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.from_hitbox_center:
			//Hits away from the center of the hitbox
			if (other.x != _target.x || other.y != _target.y)
				{
				_angle = point_direction(other.x, other.y, _target.x, _target.y);
				}
			else
				{
				_angle = knockback_angle_default;
				}
			break;
		case FLIPPER.toward_hitbox_center:
			//Hits toward the center of the hitbox
			if (other.x != _target.x || other.y != _target.y)
				{
				_angle = point_direction(_target.x, _target.y, other.x, other.y);
				}
			else
				{
				_angle = knockback_angle_default;
				}
			break;
		case FLIPPER.from_hitbox_center_horizontal:
			//Flips based on the target's position relative to the hitbox
			if (_target.x < other.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.toward_hitbox_center_horizontal:
			//Flips based on the target's position relative to the hitbox
			if (_target.x >= other.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.sakurai:
			with (_target)
				{
				if (on_ground())
					{
					_angle = (_knockback >= s_angle_knockback_threshold) ? s_angle_high_angle : s_angle_low_angle;
					}
				else
					{
					_angle = s_angle_aerial_angle;
					}
				}
			//Flip the angle
			if (_facing == -1)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.sakurai_reverse:
			with (_target)
				{
				if (on_ground())
					{
					_angle = (_knockback > s_angle_knockback_threshold) ? s_angle_high_angle : s_angle_low_angle;
					}
				else
					{
					_angle = s_angle_aerial_angle;
					}
				}
			//Flip the angle (reversed)
			if (_facing == 1)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.autolink:
			//Find the angle that will send towards the player's next position
			var _new_x = _player.hsp * autolink_speed_multiplier;
			var _new_y = _player.vsp * autolink_speed_multiplier;
			_angle = point_direction(0, 0, _new_x, _new_y);
			break;
		case FLIPPER.autolink_center:
			//Find the angle that will send towards the player's next position
			var _new_x = _player.hsp * autolink_speed_multiplier;
			var _new_y = _player.vsp * autolink_speed_multiplier;
			_angle = point_direction(_target.x, _target.y, _player.x + _new_x, _player.y + _new_y);
			break;
		case FLIPPER.fixed:
			break;
		default: break;
		}
	return _angle;
	}
/* Copyright 2025 Springroll Games / Yosi */