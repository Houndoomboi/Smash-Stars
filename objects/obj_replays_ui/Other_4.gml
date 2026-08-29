///@description

//Offline
engine().is_online = false;
ggmr_destroy_all();
				
//Menu Input System
mis_init();
mis_auto_connect_enable(true);

//Scan replay files
replays_ui_scan();

replay_current = 0;
replay_scroll = 0;
replay_delete = false;

active = true;
/* Copyright 2026 Springroll Games / Yosi */