function targetStageChooser(){
	
	//rename character goto to the stage, don't forget to define a new stage in stage_data!
	
	
	
	var _array = css_players_get_array();
	var charNum = css_player_get(_array[@ 0], CSS_PLAYER.character);
	
	switch (charNum) {
	case 0: room_goto(rm_stage_target_colt); break; //colt
	case 1: room_goto(rm_stage_target_shelly); break; //shelly
	case 2: room_goto(rm_stage_target_spike); break; //spike
	case 3: room_goto(rm_stage_target_primo); break; //el primo
	case 4: room_goto(rm_stage_target_crow); break; //crow
	case 5: room_goto(rm_stage_target_nita); break; //nita
	case 6: room_goto(rm_stage_target_mortis); break; //mortis
	case 7: room_goto(rm_stage_target_poco); break; //poco
	case 8: room_goto(rm_stage_target_darryl); break; //darryl
	case 9: room_goto(rm_stage_target_leon); break; //leon
	//sirius wasn't 10 idk who is 10 oh its Poco_P which is for some reason defined after leon and darryl?
	case 11: room_goto(rm_stage_target_sirius); break; //sirius 
	default: room_goto(rm_stage_target); break;
	
	}
}