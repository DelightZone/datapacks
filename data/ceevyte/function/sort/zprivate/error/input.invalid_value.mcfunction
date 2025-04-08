execute unless score #sort.options.show_errors ceevyte matches 1 run return 0
playsound minecraft:block.note_block.bass voice @a ~ ~ ~ 999999 1 1
tellraw @a ["", {"text": "\u26a0 Error: ", "color": "red", "bold": true}, {"text": "Invalid or missing 'value' in one or more entries.", "color": "white"}]
