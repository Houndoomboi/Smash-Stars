function ArcadeHandler(){
	stageArray = [rm_stage_giftshop,rm_stage_diner,rm_darrylship,rm_primoring,rm_gemmine,rm_mortuary,rm_stage_ranch,
	rm_rumblejungle,rm_stage_loveswamp];
		
	var chosenStage = nextStage(stageArray);
		
	
	global.originalMatchTimer = setting().match_time;
	
	if (array_length(global.arcadePlayedStages) == 4) {
		//array_push(global.arcadePlayedStages,rm_stage_target);
		targetStageChooser();
	}
	else if (array_length(global.arcadePlayedStages) > 7) {
		global.arcadePlayedStages = [];
		room_goto(rm_arcade_css);
	}
	else {
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