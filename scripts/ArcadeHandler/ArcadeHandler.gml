function ArcadeHandler(){
	stageArray = [rm_stage_giftshop,rm_stage_diner,rm_darrylship,rm_primoring,rm_gemmine,rm_mortuary,
	rm_stage_ranger_ranch,rm_rumblejungle,rm_stage_loveswamp];
	charArray = ["Shelly","Colt","Spike","Crow","Darryl","El Primo","Leon","Mortis","Nita",
	"Poco"]
	
	
	
	match_settings_default();
	while (array_length(engine().player_data) > 1) {array_delete(engine().player_data,1,1);}
	
	//end game if out of stocks or special condition
	if (global.arcadeStocks <= 0) {
		global.arcadePlayedStages = [];
		global.arcadePlayedCharacters = [];
		global.ffaChars = [];
		room_goto(rm_arcade_css);
		exit;
	}
	
	
	global.arcadeTransitionDone = !global.arcadeTransitionDone;
	
	var chosenStage, chosenCharacter, c1, c2;
	
	if (array_length(global.arcadePlayedStages) == 0) {
		array_push(global.arcadePlayedCharacters,
		character_data_get(player_data_get(0,PLAYER_DATA.character),CHARACTER_DATA.name));
	}
	
	//chunk is so characters are reset but still match the old ones
	if (!global.arcadeTransitionDone) {
		chosenStage = nextStage(stageArray, array_length(global.arcadePlayedStages));
		chosenCharacter = nextChar(charArray);
	}
	else {
		chosenStage = array_get(global.arcadePlayedStages,array_length(global.arcadePlayedStages)-1);
		chosenCharacter = array_get(global.arcadePlayedCharacters,array_length(global.arcadePlayedCharacters)-1);
		if (array_length(global.arcadePlayedStages) == 5) {
		chosenCharacter = array_get(global.arcadePlayedCharacters,array_length(global.arcadePlayedCharacters)-3);
		c1 = array_get(global.arcadePlayedCharacters,array_length(global.arcadePlayedCharacters)-1);
		c2 = array_get(global.arcadePlayedCharacters,array_length(global.arcadePlayedCharacters)-2);
		}
		
	}
	
	var stageNum = array_length(global.arcadePlayedStages);
	
	//either end game at last stage or advance to secret if at full lives
	if (stageNum > 8) {
		
		if (global.arcadeStocks == global.originalStocks 
		&& array_length(global.arcadePlayedStages) == 9) {
			addRandomCPU("Sirius");
			nextRoom(rm_stage_ranger_ranch);
		}
		else {
			global.ffaChars = [];
			global.arcadeTransitionDone = true;
			room_goto(rm_arcade_win);
			
			exit;
		}
	}
	//target mode
	else if (stageNum == 4) {
		nextRoom("target");
	}
	//2v2
	else if (stageNum == 5 ) {
		addRandomCPU(chosenCharacter,false);
		addRandomCPU(global.arcadeTransitionDone ? c1 : nextChar(charArray));
		addRandomCPU(global.arcadeTransitionDone ? c2 : nextChar(charArray));
		setting().match_team_mode = true;
		nextRoom(chosenStage);
	}
	//Many battle
	else if (stageNum == 8) {
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		addRandomCPU("");
		nextRoom(chosenStage);
	}	
    //Normal 1v1
	else {
		addRandomCPU(chosenCharacter);
		nextRoom(chosenStage);
	}
	
}
	

function nextRoom (room) {

	if (global.arcadeTransitionDone) {
		
		if (room == "target") {targetStageChooser();}
		else {room_goto(room);}
		
	}
	else {
		room_goto(rm_arcade_transition);
	}

}
	
function nextStage(stageArray,stageNum) {
	
	if (array_contains([3],stageNum)) {
		array_push(global.arcadePlayedStages,rm_stage_target);
		return rm_stage_target;
	}
	if (array_contains([8],stageNum)) {
		array_push(global.arcadePlayedStages,rm_stage_ranger_ranch);
		return rm_stage_ranger_ranch;
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
	
	var _randChar;
	if (character == "" && !global.arcadeTransitionDone) {
		
		_randChar = charArray[irandom(array_length(charArray) - 1)];
		while (array_contains(global.ffaChars, _randChar) || _randChar == global.arcadePlayedCharacters[0]) {
			_randChar = charArray[irandom(array_length(charArray) - 1)];
		}
		array_push(global.ffaChars,_randChar);
	    
	}
	else if (character == "") {
		_randChar = global.ffaChars[0];
		array_delete(global.ffaChars,0,1);
	}
	
	var characterPicked = character == "" ? character_find(_randChar) : character_find(character);
	
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

