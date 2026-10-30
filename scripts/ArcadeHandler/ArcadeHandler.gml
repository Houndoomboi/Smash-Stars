function ArcadeHandler(){
	stageArray = [rm_stage_giftshop,rm_stage_diner,rm_darrylship,rm_primoring,rm_gemmine,rm_mortuary,
	rm_stage_ranger_ranch,rm_rumblejungle,rm_stage_loveswamp];
	charArray = ["Shelly","Colt","Spike","Crow","Darryl","El Primo","Leon","Mortis","Nita",
	"Poco"]
	
	match_settings_default();
	
	var chosenStage = nextStage(stageArray, array_length(global.arcadePlayedStages));
	var chosenCharacter = nextChar(charArray);
	var stageNum = array_length(global.arcadePlayedStages);
	
	while (array_length(engine().player_data) > 1) {array_delete(engine().player_data,1,1);}
	
	//end game if out of stocks or special condition
	if (global.arcadeStocks <= 0) {
		global.arcadePlayedStages = [];
		global.arcadePlayedCharacters = [];
		room_goto(rm_arcade_win);
	}
	//either end game at last stage or advance to secret if at full lives
	else if (stageNum > 8) {
		
		if (global.arcadeStocks == global.originalStocks 
		&& array_length(global.arcadePlayedStages) == 9) {
			addRandomCPU("Colt");
			addRandomCPU("Colt");
			addRandomCPU("Colt");
			addRandomCPU("Colt");
			addRandomCPU("Colt");
			addRandomCPU("Colt");
			addRandomCPU("Colt");
			
			room_goto(rm_stage_ranger_ranch);
		}
		else {
			global.arcadePlayedStages = [];
			global.arcadePlayedCharacters = [];
			room_goto(rm_arcade_win);
		}
	}
	//target mode
	else if (stageNum == 4) {
		targetStageChooser();
	}
	//2v2
	else if (stageNum == 5 ) {
		addRandomCPU(chosenCharacter,false);
		addRandomCPU(nextChar(charArray));
		addRandomCPU(nextChar(charArray));
		setting().match_team_mode = true;
		room_goto(chosenStage);
	}
	//Many battle
	else if (stageNum == 8) {
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		room_goto(rm_stage_ranger_ranch);
	}	
    //Normal 1v1
	else {
		addRandomCPU(chosenCharacter);
		room_goto(chosenStage);
	}
	
	
	
		
}


function nextStage(stageArray,stageNum) {
	
	if (array_contains([3,8],stageNum)) {
		array_push(global.arcadePlayedStages,rm_stage_target);
		return rm_stage_target;
	}
	
	shuffled = array_shuffle(stageArray);
	for (i = 0; i < array_length(shuffled); i++) {
		if (!array_contains(global.arcadePlayedStages,shuffled[i])) {
			array_push(global.arcadePlayedStages,shuffled[i]);
			return shuffled[i];
		}
	}
}

function nextChar(charArray) {
	shuffled = array_shuffle(charArray);
	for (i = 0; i < array_length(shuffled); i++) {
		if (!array_contains(global.arcadePlayedCharacters,shuffled[i])) {
			array_push(global.arcadePlayedCharacters,shuffled[i]);
			return shuffled[i];
		}
	}
}

function addRandomCPU(character, team = true) {
	
	var characterPicked = character == "" ? character_choose_random() : character_find(character);
	
	var _cursor_index = engine().css_index_current;
	var _group = 1;
	
	var _cc = custom_controls_create();
	_cc.scs = array_create(SCS.LENGTH, false);
	
	var _profile = profile_create
		(
		team ? "Rival" : "Good Random",
		_cc, 
		true
		);
		
		
	player_data_create
		(
		characterPicked,
		1, 
		-1, 
		DEVICE.none, 
		_profile,
		true, 
		true, 
		false, 
		team, 
		css_ui_player_custom_struct_build
			(
			-1,
			_cursor_index,
			_group,
			noone,
			862 + irandom_range(-20, 20), 
			164 + irandom_range(-20, 20),
			false
			)
		);
}