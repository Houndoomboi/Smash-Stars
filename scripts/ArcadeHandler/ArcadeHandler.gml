function ArcadeHandler(){
	stageArray = [rm_stage_giftshop,rm_stage_diner,rm_darrylship,rm_primoring,rm_gemmine,rm_mortuary,
	rm_stage_ranger_ranch,rm_rumblejungle,rm_stage_loveswamp];
	
	
	
	
	var chosenStage = nextStage(stageArray);
	
	setting().match_stock = global.arcadeStocks;
	
	
	if (array_length(global.arcadePlayedStages) > 7 ||  global.arcadeStocks <= 0) {
		
		if (global.arcadeStocks == global.originalStocks 
		&& array_length(global.arcadePlayedStages) == 8) {
			room_goto(rm_stage_ranger_ranch);
		}
		else {
			global.arcadePlayedStages = [];
			setting().match_stock = global.originalStocks;
			room_goto(rm_arcade_css);
		}
	}
	else if (array_length(global.arcadePlayedStages) == 4) {
		//array_push(global.arcadePlayedStages,rm_stage_target);
		targetStageChooser();
	}
    
	else {
		//room_goto(rm_css);
		//css_ui_add_cpu_button_step();
		room_goto(chosenStage);
	}
	
	
	
		
}


function nextStage(stageArray) {
	shuffled = array_shuffle(stageArray);
	for (i = 0; i < array_length(shuffled); i++) {
		if (!array_contains(global.arcadePlayedStages,shuffled[i])) {
			array_push(global.arcadePlayedStages,shuffled[i]);
			return shuffled[i];
		}
	}
}