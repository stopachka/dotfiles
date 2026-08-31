# Advantage360 Pro custom keymap

This configuration makes four physical-key changes:

- The circled `(2)` key beside `G` (matrix position 34) becomes a holdable
  `Control+Option` chord for Wispr Flow push-to-talk.
- The left thumb-cluster `Home` key becomes a holdable `Command+Option` chord.
  The same mapping is applied on the Keypad layer so the physical key remains
  consistent and matches shortcuts that are also comfortable on a laptop.
- The left thumb-cluster `Control` key becomes the left `Command` key.
- The left thumb-cluster `End` key becomes the left `Control` key, preserving
  easy access to Control. Both mappings are also applied on the Keypad layer
  so the physical keys remain consistent.

The corresponding ZMK key-press behaviors are:

```dts
&kp LC(LALT)
&kp LA(LGUI)
&kp LGUI
&kp LCTRL
```

These are normal, holdable ZMK key-press behaviors. Pressing a mapped key
holds its modifiers; releasing it releases them.

The build is pinned to Kinesis's official Advantage360 Pro ZMK repository at
commit `97f5d7394d36f60754a483bf5551e16d996fe406` (2026-06-14).

## Recommended: program it live with Clique

If the keyboard already has Clique-capable firmware, no build is needed:

1. Connect the left module to the Mac with USB-C. Clique cannot program it
   over Bluetooth.
2. Open https://clique.kinesis-ergo.com/ in Chrome or Edge.
3. Select **Advantage360 Pro**, choose the **Adv360 Pro** serial port, and
   unlock when prompted with `Mod` plus the original Escape-key position.
4. On the Base layer:
   - Select circled `(2)` and assign a Key Combo containing Left Control and
     Left Alt/Option.
   - Select `Home` in the left thumb cluster and assign a Key Combo containing
     Left Alt/Option and Left GUI/Command.
   - Select `Control` in the left thumb cluster and assign Left GUI/Command.
   - Select `End` in the left thumb cluster and assign Left Control.
5. On the Keypad layer, repeat all four assignments at the same physical-key
   positions.
6. Apply and Save.

Then configure the Alfred and Wispr Flow shortcuts as described below.

## Firmware build fallback

Use this only if Clique cannot see the keyboard or cannot create the desired
modifier-only chords.

Docker must be running. Then run:

```sh
~/dotfiles/adv360/build.sh
```

Matched left- and right-side firmware files will be written to `firmware/`.
Although both customized keys are on the left module, Kinesis requires both
modules to run firmware from the same build.

## Configure Alfred Clipboard History

Open **Alfred Preferences → Features → Clipboard**. Select the **Viewer
Hotkey** field, then hold the remapped `Home` key and press `C`. Alfred should
record `Command+Option+C`.

## Configure Rectangle

Use `Command+Option` as the modifier chord for Rectangle's window actions.
The primary bindings are the four arrow keys for window halves, `U/I/J/K` for
corners, `Return` for Maximize, `H` for Maximize Height, `-/=` for resizing,
`C` for Center, `Delete` for Restore, and `[/]` for previous/next display.
These work by holding the remapped `Home` key on the Advantage360 and remain
easy to type directly on a laptop keyboard.

## Flash both modules

1. Connect the left module to the Mac with USB-C.
2. Hold `Mod` and press circled `(1)` to mount the bootloader drive.
3. Copy the generated `*-left-clique.uf2` file to the `ADV360PRO` drive and
   wait for the LEDs to stop flashing.
4. Leave the left module connected and powered. Connect the right module with
   USB-C, then use `Mod` plus circled `(3)` to mount its bootloader drive.
5. Copy the matching `*-right-clique.uf2` file to that drive and wait for the
   LEDs to stop flashing.
6. Power-cycle both keyboard halves, turning on the left half first.

Never put the left file on the right module or the right file on the left
module. Do not disconnect either module while its LEDs are flashing.

## Configure Wispr Flow

Open **Wispr Flow → Settings → General → Shortcuts**. Add `Control+Option` to
**Push to talk** by clicking an empty shortcut slot and then holding circled
`(2)`. Keep the Apple `Fn` binding as a second shortcut if desired.

Sources:

- https://github.com/KinesisCorporation/Adv360-Pro-ZMK
- https://zmk.dev/docs/keymaps/modifiers
- https://docs.wisprflow.ai/articles/2612050838-supported-unsupported-keyboard-hotkey-shortcuts
