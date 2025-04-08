execute if score #sort.zprivate.input_length ceevyte matches 0 run function ceevyte:sort/zprivate/error/no_input
execute if score #sort.zprivate.input_length ceevyte matches 1 run function ceevyte:sort/zprivate/low_input/nested_execute_0
execute if score #sort.zprivate.input_length ceevyte matches 0..1 run return 0
data modify storage ceevyte sort.zprivate.compare.a set from storage ceevyte sort.zprivate.input[0]
data modify storage ceevyte sort.zprivate.compare.b set from storage ceevyte sort.zprivate.input[1]
data remove storage ceevyte sort.zprivate.input[0]
data remove storage ceevyte sort.zprivate.input[0]
execute store result score #sort.zprivate.compare.a ceevyte run data get storage ceevyte sort.zprivate.compare.a.value 1
execute store result score #sort.zprivate.compare.b ceevyte run data get storage ceevyte sort.zprivate.compare.b.value 1
scoreboard players set #sort.zprivate.valid_value ceevyte 0
execute if data storage ceevyte sort.zprivate.compare.a.value if data storage ceevyte sort.zprivate.compare.b.value run scoreboard players set #sort.zprivate.valid_value ceevyte 1
execute if score #sort.zprivate.valid_value ceevyte matches 0 run function ceevyte:sort/zprivate/error/input.invalid_value
execute if score #sort.zprivate.valid_value ceevyte matches 0 run return 0
execute if score #sort.zprivate.compare.a ceevyte > #sort.zprivate.compare.b ceevyte run function ceevyte:sort/zprivate/low_input/nested_execute_1
execute if score #sort.zprivate.compare.a ceevyte <= #sort.zprivate.compare.b ceevyte run function ceevyte:sort/zprivate/low_input/nested_execute_2
