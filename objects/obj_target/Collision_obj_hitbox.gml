image_index = 1;
if (!audio_is_playing(target_smash)) {
audio_play_sound(target_smash, 10, false);
}


call_later(0.5, time_source_units_seconds, function() {
    instance_destroy();
});