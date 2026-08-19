///@category Gameplay
/*
Spawns either <obj_game>, <obj_game_online>, <obj_game_replay>, or <obj_game_negative> depending on the type of match.
*/
only_one();

//Online mode
if (engine().is_online)
	{
	instance_create_layer(0, 0, layer, obj_game_online);
	}
//Replay mode
else if (setting().replay_mode)
	{
	instance_create_layer(0, 0, layer, obj_game_replay);
	}
//Negative input delay
else if (setting().negative_input_delay != 0)
	{
	instance_create_layer(0, 0, layer, obj_game_negative);
	}
else
	{
	instance_create_layer(0, 0, layer, obj_game);
	}

instance_destroy();