only_one();

mis_init();

state_phase = 0;
state_timer_max = 100;
state_timer = state_timer_max;

var _array = css_players_get_array();
var _character = css_player_get(_array[@ 0], CSS_PLAYER.character);

//Play the victory theme
audio_stop_all();
var _music = character_data_get(_character, CHARACTER_DATA.music);
if (audio_exists(_music))
	{
	audio_play_sound_adjusted(_music, 0, false, audiogroup_music);
	}

//Time Limit
time_left = (engine().win_screen_time_limit * 60);


