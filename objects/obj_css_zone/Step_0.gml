//Unlock Sirius debug
if (keyboard_check(vk_escape))
  {
  engine().stats.unlocked_characters = [];
  engine().stats.unlocked_skins = [];
  }