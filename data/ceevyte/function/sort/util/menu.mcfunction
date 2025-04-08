tellraw @s {"text": "\ud83d\udd27 Options:\n", "color": "gold", "bold": true}
execute if score #sort.options.show_errors ceevyte matches 1 run tellraw @s ["", {"text": "\u2757 Show Errors:\n", "color": "gold", "bold": false}, {"text": "Show where you screwed up in chat. Useful, sometimes.\n", "color": "white"}, {"text": "ON\n", "color": "green", "bold": true, "clickEvent": {"action": "run_command", "value": "/function ceevyte:sort/zprivate/menu/unshow_errors"}}]
execute unless score #sort.options.show_errors ceevyte matches 1 run tellraw @s ["", {"text": "\u2757 Show Errors:\n", "color": "gold", "bold": false}, {"text": "Show where you screwed up in chat. Useful, sometimes.\n", "color": "white"}, {"text": "OFF\n", "color": "red", "bold": true, "clickEvent": {"action": "run_command", "value": "/function ceevyte:sort/zprivate/menu/show_errors"}}]
execute if score #sort.options.from_lowest ceevyte matches 1 run tellraw @s ["", {"text": "\ud83d\udcca Return the output in order of:\n", "color": "gold", "bold": false}, {"text": "Whether to sort ascending or descending.\n", "color": "white"}, {"text": "Lowest < Highest\n", "color": "white", "bold": true, "clickEvent": {"action": "run_command", "value": "/function ceevyte:sort/zprivate/menu/highest_to_lowest"}}]
execute unless score #sort.options.from_lowest ceevyte matches 1 run tellraw @s ["", {"text": "\ud83d\udcca Return the output in order of:\n", "color": "gold", "bold": false}, {"text": "Whether to sort ascending or descending.\n", "color": "white"}, {"text": "Highest > Lowest\n", "color": "white", "bold": true, "clickEvent": {"action": "run_command", "value": "/function ceevyte:sort/zprivate/menu/lowest_to_highest"}}]
