# NPC armor mod for Fallout 2

[![Build Status](https://travis-ci.org/BGforgeNet/Fallout2_NPC_Armor.svg?branch=master)](https://travis-ci.org/BGforgeNet/Fallout2_NPC_Armor)
[![Discord chat](https://img.shields.io/discord/420268540700917760?logo=discord)](https://discord.gg/4Yqfggm)

[__Download__](releases/latest)
| [__Installation__](#installation)
| [__Report issues__](issues)

This is a Fallout 2 mod enabling party members to change their appearance according to the armor that they are wearing. Originally constructed by B-team.

## Installation
1. Download the latest [release](https://github.com/BGforgeNet/Fallout2_NPC_Armor/releases/latest).
2. Extract the archive into main game directory. NPC armor requires sfall (`ddraw.dll`) version 4+, it's shipped with the mod. If you have a newer version, you don't need to overwite the dll when extracting.
3. In `ddraw.ini` (main game directory), find `[Scripts]` section (if it doesn't exist, create one) and set `IniConfigFolder=mods`.

__Notes:__
- You can use the mod with [killap's Unofficial Patch](https://github.com/BGforgeNet/Fallout2_Unofficial_Patch), other modifications or even vanilla game.
- NPC armor is **included** in [killap's Restoration Project](https://github.com/BGforgeNet/Fallout2_Restoration_Project). If you use RPU, you don't need to download this mod separately.
- The mod is preconfigured for Fallout 2 (see `mods/npc_armor.ini`). It'll work with other games based on F2 engine, but that might require tinkering with the config.
