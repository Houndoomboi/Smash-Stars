//Teleport any players who touch the portal
if (!custom_entity_struct.portal_used)
	{
	var _portal = id;
	with (obj_player)
		{
		//The portal owner teleports when they touch the portal, but other players only teleport if they are being launched
		if (_portal.owner == id || is_launched())
			{
			if (place_meeting(x, y, _portal))
				{
				var _other_portal = noone;
				with (obj_rick_fspec_portal)
					{
					if (owner.id == _portal.owner && id != _portal)
						{
						_other_portal = id;
						break;
						}
					}
				if (_other_portal != noone)
					{
					x = _other_portal.x;
					y = _other_portal.y;
					move_out_of_blocks(-1);
					_portal.custom_entity_struct.portal_used = true;
					_other_portal.custom_entity_struct.portal_used = true;
					_portal.image_index = 1;
					_other_portal.image_index = 1;
					}
				}
			}
		}
	}

/* Copyright 2025 Springroll Games / Yosi */