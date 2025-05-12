scoreboard players reset #narrativa.util.not_last ceevyte
function ceevyte:narrativa/util/next
execute unless score #narrativa.options.dont_trigger ceevyte matches 1 if score #narrativa.options.use_next_trigger ceevyte matches 1 run tellraw @a {"text": "\n> Next\n", "color": "white", "bold": true, "click_event": {"action": "run_command", "command": "/trigger ceevyte.narrativa.util.next"}}
