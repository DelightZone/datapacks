data modify storage ceevyte sort.zprivate.compare.a set from storage ceevyte sort.zprivate.input[0]
data remove storage ceevyte sort.zprivate.input[0]
execute if score #sort.zprivate.input_length ceevyte matches 1.. run scoreboard players remove #sort.zprivate.input_length ceevyte 1
execute if score #sort.zprivate.input_length ceevyte matches 1.. run function ceevyte:sort/zprivate/loop
