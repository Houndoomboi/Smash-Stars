function ArcadeHandler(){
	stageArray = [rm_stage_giftshop,rm_stage_diner,rm_darrylship,rm_primoring,rm_gemmine,rm_mortuary,
	rm_stage_ranger_ranch,rm_rumblejungle,rm_stage_loveswamp];
	charArray = ["Shelly","Colt","Spike","Crow","Darryl","El Primo","Leon","Mortis","Nita",
	"Poco"]
	
	var chosenStage;
	
	if (array_length(global.arcadePlayedStages) != 3) {
		chosenStage = nextStage(stageArray);
	} else {
		array_push(global.arcadePlayedStages,rm_stage_target);
	}
	var chosenCharacter = nextChar(charArray);
	while (array_length(engine().player_data) > 1) {array_delete(engine().player_data,1,1);}
	
	
	if (global.arcadeStocks <= 0) {
		global.arcadePlayedStages = [];
		global.arcadePlayedCharacters = [];
		room_goto(rm_arcade_css);
	}
	
	else if (array_length(global.arcadePlayedStages) > 8) {
		
		if (global.arcadeStocks == global.originalStocks 
		&& array_length(global.arcadePlayedStages) == 9) {
			addRandomCPU("");
			addRandomCPU("");
			room_goto(rm_stage_ranger_ranch);
		}
		else {
			global.arcadePlayedStages = [];
			global.arcadePlayedCharacters = [];
			room_goto(rm_arcade_css);
		}
	}
	else if (array_length(global.arcadePlayedStages) == 8) {
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		room_goto(rm_stage_ranger_ranch);
	}
	else if (array_length(global.arcadePlayedStages) == 4) {
		targetStageChooser();
	}
    
	else {
		addRandomCPU(chosenCharacter);
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

function nextChar(charArray) {
	shuffled = array_shuffle(charArray);
	for (i = 0; i < array_length(shuffled); i++) {
		if (!array_contains(global.arcadePlayedCharacters,shuffled[i])) {
			array_push(global.arcadePlayedCharacters,shuffled[i]);
			return shuffled[i];
		}
	}
}

function addRandomCPU(character) {
	
	var characterPicked = character == "" ? character_choose_random() : character_find(character);
	
	var _cursor_index = engine().css_index_current;
	var _group = 1;
	
	var _cc = custom_controls_create();
	_cc.scs = array_create(SCS.LENGTH, false);
	
	var _profile = profile_create
		(
		"Rival",
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
		true, 
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