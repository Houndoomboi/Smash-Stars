only_one();

mis_init();

var _array = css_players_get_array();

var _character = css_player_get(_array[@ 0], CSS_PLAYER.character);
var _color_actual = css_player_get(_array[@ 0], CSS_PLAYER.color);


//Play the victory theme
audio_stop_all();

audio_play_sound_adjusted(song_stage_archive, 0, false, audiogroup_music);



