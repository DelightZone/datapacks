data modify storage ceevyte sort.zprivate.input set from storage ceevyte sort.main.input
execute store result score #sort.zprivate.input_length ceevyte run data get storage ceevyte sort.zprivate.input
scoreboard players add #sort.zprivate.input_length ceevyte 1
function ceevyte:sort/zprivate/next
data remove storage ceevyte sort.main.output
data modify storage ceevyte sort.main.output set from storage ceevyte sort.zprivate.lock
data remove storage ceevyte sort.main.input
data remove storage ceevyte sort.zprivate
scoreboard players reset #sort.zprivate.compare.a ceevyte
scoreboard players reset #sort.zprivate.compare.b ceevyte
scoreboard players reset #sort.zprivate.input_length ceevyte
scoreboard players reset #sort.zprivate.loop ceevyte
