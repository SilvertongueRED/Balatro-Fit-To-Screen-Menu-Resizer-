# Fit To Screen

A small Balatro mod that stops tall mod menus from being cut off at the top and bottom of your screen.

Also on [Nexus Mods](https://www.nexusmods.com/balatro/mods/1001).

## The problem

<img width="1456" height="819" alt="image" src="https://github.com/user-attachments/assets/65c2248d-52ca-4ff6-a42d-7808031b1bb3" />

Balatro fits its play area to your window and leaves only a thin strip of room above and below it. Every mod that adds a button to the pause menu, or a row to the left sidebar, makes those columns taller. With enough mods installed they grow past the edge of the screen. You see:

- The pause menu's **Settings** button and **Back** button with no border, touching or clipped by the screen edge.
- The top of the boss blind name cut off.
- The bottom of the left sidebar (Ante and Round boxes) clipped.

This happens even in 4K, Borderless or Fullscreen, at the suggested resolution, and with the CRT effect turned off. It is a layout limit, not a display setting.

## What this mod does

<img width="3837" height="2157" alt="image" src="https://github.com/user-attachments/assets/7ea33e10-41d2-43d2-ba92-09dde39de414" />

1. **Adds more top and bottom room.** The base game uses 0.7 tiles of padding above and below the play area. This mod changes it to 1.3, so the whole game scales down by about 9% and tall columns fit. You can change the number (see Configuration).
2. **Hides the All-In-Jest coconut counter.** With the extra room, a stray "1/1" label can appear near the top right. It belongs to the hidden Load Bearing Coconut card area in All-In-Jest, which that mod parks above the screen on purpose. This mod pushes that area further up so the label stays off screen. It does this from its own code, so All-In-Jest updates do not undo it. If you do not use All-In-Jest, this part does nothing.

## Install

1. Install [Lovely](https://github.com/ethangreen-dev/lovely-injector) and [Steamodded](https://github.com/Steamodded/smods) if you have not already.
2. Download `FitToScreen-vX.Y.Z.zip` from the [Releases](../../releases) page.
   You can also download it from [Nexus Mods](https://www.nexusmods.com/balatro/mods/1001).
3. Unzip it so the folder ends up at `%AppData%\Balatro\Mods\FitToScreen`.
4. Restart Balatro fully (close it, start it again from Steam).

You can confirm it loaded by finding **Fit To Screen** in the **Mods** menu.

## Configuration

Open `Mods\FitToScreen\lovely.toml` and change the number in this line:

```
payload = "self.ROOM_PADDING_H = 1.3"
```

- Higher number: more margin top and bottom, smaller game.
- Lower number: less margin, bigger game.
- `0.7` is the base game value, which turns the effect off.

Restart the game after editing. If the pause menu still touches the edges, try `1.6`.

To move the coconut area further, change `EXTRA_TILES_UP` at the top of `Mods\FitToScreen\main.lua`.

## Uninstall

Delete the `FitToScreen` folder from your Mods folder.

## Compatibility and testing

- Confirmed working by the author on Windows 11, 3840 x 2160, Borderless, Steam version of Balatro, Lovely and Steamodded, with a large mod list.
- Not tested on other platforms or resolutions. The padding change is a single Lovely patch to `game.lua`, so it should behave the same anywhere Lovely works.
- The padding part only needs Lovely. The coconut part needs Steamodded and only matters with All-In-Jest installed.
- If another mod also changes `ROOM_PADDING_H`, the two patches will conflict. Check the newest file in `Mods\lovely\log` for a warning that the pattern `self.ROOM_PADDING_H= 0.7` matched nothing.

## How it works

- `lovely.toml` is a Lovely patch that replaces `self.ROOM_PADDING_H= 0.7` in `game.lua`. Balatro computes the window scale from the play area height plus this padding, so a bigger value shrinks everything evenly and gives tall UI room.
- `main.lua` registers a Steamodded `custom_card_areas` callback. After a run's card areas are created, it queues an event that moves `G.aij_coconut_holder` up by `EXTRA_TILES_UP` tiles if it exists.

## License

MIT. See [LICENSE](LICENSE).

---

<!-- other-mods:start -->
## More from SilvertongueRED

### See my other mods and forks

- [Balatro-Mod-Search-and-Sort](https://github.com/SilvertongueRED/Balatro-Mod-Search-and-Sort) ([Nexus Mods](https://www.nexusmods.com/balatro/mods/984))
- [Balatro-Mod-Updater](https://github.com/SilvertongueRED/Balatro-Mod-Updater)
- [Balatro-SaveRewinder-Config-Fix](https://github.com/SilvertongueRED/Balatro-SaveRewinder-Config-Fix)
- [Trance-Active-and-Updated](https://github.com/SilvertongueRED/Trance-Active-and-Updated)
- [Balatro-Preview-Accuracy-Update](https://github.com/SilvertongueRED/Balatro-Preview-Accuracy-Update)
- [BalatroMods-HoldForFinalHandScore-Update](https://github.com/SilvertongueRED/BalatroMods-HoldForFinalHandScore-Update)
- [Main-Menu-Theme-Selector](https://github.com/SilvertongueRED/Main-Menu-Theme-Selector)
- [Better Mouse and Gamepad (bmag)](https://github.com/SilvertongueRED/bmag)
- [Balatro-Music-Selector-Fixes-and-Features](https://github.com/SilvertongueRED/Balatro-Music-Selector-Fixes-and-Features)
<!-- other-mods:end -->
