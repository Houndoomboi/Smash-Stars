///@description Clear the replay buffer
buffer_reset(replay_data_get().buffer);

engine().win_screen_order = [];

gc_collect();
/* Copyright 2026 Springroll Games / Yosi */