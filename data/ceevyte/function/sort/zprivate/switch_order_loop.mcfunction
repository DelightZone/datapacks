data modify storage ceevyte sort.main.output prepend from storage ceevyte sort.zprivate.lock[0]
data remove storage ceevyte sort.zprivate.lock[0]
execute if data storage ceevyte sort.zprivate.lock[0] run function ceevyte:sort/zprivate/switch_order_loop
