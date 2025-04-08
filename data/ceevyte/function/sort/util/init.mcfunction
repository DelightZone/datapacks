data modify storage ceevyte sort.zprivate.input set from storage ceevyte sort.main.input
execute store result score #sort.zprivate.input_length ceevyte run data get storage ceevyte sort.zprivate.input
execute if score #sort.zprivate.input_length ceevyte matches 0..2 run function ceevyte:sort/zprivate/low_input
scoreboard players add #sort.zprivate.input_length ceevyte 1
execute if score #sort.zprivate.input_length ceevyte matches 4.. run function ceevyte:sort/zprivate/next
function ceevyte:sort/zprivate/save
