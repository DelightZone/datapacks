execute unless score #sort.options.show_errors ceevyte matches 1 run return 0
playsound minecraft:block.note_block.bass voice @a ~ ~ ~ 999999 1 1
tellraw @a ["", {"text": "\u274c Error: ", "color": "red", "bold": true}, {"text": "No input provided. Please add entries before sorting.", "color": "white"}]
