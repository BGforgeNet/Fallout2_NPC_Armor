# NPC armor mod for Fallout 2

[![Build Status](https://travis-ci.org/BGforgeNet/Fallout2_NPC_Armor.svg?branch=master)](https://travis-ci.org/BGforgeNet/Fallout2_NPC_Armor)
[![Discord chat](https://img.shields.io/discord/420268540700917760?logo=discord)](https://discord.gg/4Yqfggm)

[__Download__](https://github.com/BGforgeNet/Fallout2_NPC_Armor/releases/latest)
| [__Installation__](#installation)
| [__Report issues__](#bug-reports-feature-requests)

This is a Fallout 2 mod enabling party members to change their appearance according to the armor that they are wearing. Originally constructed by B-team.

## Installation
1. Download the [latest](https://github.com/BGforgeNet/Fallout2_NPC_Armor/releases/latest) release.
2. Extract the archive into main game directory.
  NPC armor requires sfall (`ddraw.dll`) version 4+, it's shipped with the mod. If you have a newer version, you don't need to overwite the dll when extracting.
3. In `ddraw.ini`, find and set
    ```ini
    [Scripts]
    IniConfigFolder=mods
    ```

__Notes:__
- You can use the mod with [killap's Unofficial Patch](https://github.com/BGforgeNet/Fallout2_Unofficial_Patch), other modifications or even vanilla game.
- NPC armor is **included** in [killap's Restoration Project](https://github.com/BGforgeNet/Fallout2_Restoration_Project). If you use RPU, you don't need to download this mod separately.
- The mod is preconfigured for Fallout 2. To work with other games based on F2 engine, it'll require additional configuration in `mods/npc_armor.ini`, and [`critters.lst`](https://github.com/BGforgeNet/Fallout2_Restoration_Project/blob/master/data/art/critters/critters.lst) (which might not be the task for the faint of heart).

### Bug reports, feature requests
Go to [github issues](https://github.com/BGforgeNet/Fallout2_NPC_Armor/issues) or [forums](https://forums.bgforge.net/viewforum.php?f=39).

### Additional info
[__Changelog__](docs/changelog.md)
