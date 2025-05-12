data modify storage ceevyte narrativa.zprivate.input set from storage ceevyte narrativa.main.input[0]
data remove storage ceevyte narrativa.main.input[0]
execute if score #narrativa.options.use_next_trigger ceevyte matches 1 run scoreboard players enable @a ceevyte.narrativa.util.next
execute if score #narrativa.options.dont_display ceevyte matches 1 run function #ceevyte:narrativa/custom_display
execute unless score #narrativa.options.dont_display ceevyte matches 1 run function ceevyte:narrativa/zprivate/display with storage ceevyte narrativa.zprivate.input
execute unless score #narrativa.options.dont_display ceevyte matches 1 run function ceevyte:narrativa/zprivate/args
data modify storage ceevyte narrativa.zprivate.array set from storage ceevyte narrativa.zprivate.input.commands
execute if data storage ceevyte narrativa.zprivate.array[0] run function ceevyte:narrativa/zprivate/array with storage ceevyte narrativa.zprivate.array[0]
