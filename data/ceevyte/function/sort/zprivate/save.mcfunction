data remove storage ceevyte sort.main.output
execute if score #sort.options.from_lowest ceevyte matches 1 run data modify storage ceevyte sort.main.output set from storage ceevyte sort.zprivate.lock
execute unless score #sort.options.from_lowest ceevyte matches 1 run function ceevyte:sort/zprivate/switch_order_loop
data remove storage ceevyte sort.main.input
data remove storage ceevyte sort.zprivate
scoreboard players reset #sort.zprivate.compare.a ceevyte
scoreboard players reset #sort.zprivate.compare.b ceevyte
scoreboard players reset #sort.zprivate.input_length ceevyte
scoreboard players reset #sort.zprivate.loop ceevyte
scoreboard players reset #sort.zprivate.valid_value ceevyte
scoreboard players reset #sort.zprivate.valid_value_child ceevyte
