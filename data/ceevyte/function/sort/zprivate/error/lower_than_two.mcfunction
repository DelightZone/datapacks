execute unless score #sort.options.show_errors ceevyte matches 1 run return 0
playsound minecraft:block.note_block.bass voice @a ~ ~ ~ 999999 1 1
tellraw @a ["", {"text": "\u26a0 Warning: ", "color": "yellow", "bold": true}, {"text": "Sorting requires at least two entries.", "color": "white"}]
