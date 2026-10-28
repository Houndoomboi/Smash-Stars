///@category Menus
/*
This object displays the String Inputter. There can only be one instance at a time.
The string inputter allows players to create strings with controller input, or by typing on the keyboard.
You can use the function <string_inputter_get_string> to create an instance, and <string_inputter_is_open> to check if one already exists.
*/
///@description
inputter_letters = valid_string_characters;
inputter_letter_count = array_length(inputter_letters);
inputter_prompt = "ENTER A CHEAT CODE!:";
inputter_string = "";
inputter_max_length = 16;
inputter_current = 0;
inputter_default = "";
inputter_callback = obj_string_inputter_cheatcodes_switch_script;
inputter_custom = undefined;
inputter_row_length = 16;
inputter_hidden = false;

//Menu input system
mis_init();

//Keyboard backspace repeat
inputter_backspace_held_time = 0;
/* Copyright 2026 Springroll Games / Yosi */