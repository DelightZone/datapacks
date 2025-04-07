scoreboard players reset #sort.zprivate.loop ceevyte
data modify storage ceevyte sort.zprivate.compare.b set from storage ceevyte sort.zprivate.input[0]
data remove storage ceevyte sort.zprivate.input[0]
execute store result score #sort.zprivate.compare.a ceevyte run data get storage ceevyte sort.zprivate.compare.a.value 1
execute store result score #sort.zprivate.compare.b ceevyte run data get storage ceevyte sort.zprivate.compare.b.value 1
execute if score #sort.zprivate.compare.a ceevyte > #sort.zprivate.compare.b ceevyte run function ceevyte:sort/zprivate/greater
execute if score #sort.zprivate.compare.a ceevyte <= #sort.zprivate.compare.b ceevyte run function ceevyte:sort/zprivate/lower
execute store success score #sort.zprivate.loop ceevyte if data storage ceevyte sort.zprivate.input[0] run function ceevyte:sort/zprivate/loop
execute if score #sort.zprivate.loop ceevyte matches 1 run return 0
function ceevyte:sort/zprivate/finalize
