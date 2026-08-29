function main_menu_online_button_step(){
ui_button_step();
if (ui_clicked)
    {
    menu_sound_play(snd_menu_select);
    room_goto(rm_main_menu_online_submenu);
    }
}