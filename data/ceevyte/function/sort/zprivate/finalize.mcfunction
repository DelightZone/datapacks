data modify storage ceevyte sort.zprivate.lock append from storage ceevyte sort.zprivate.compare.a
data remove storage ceevyte sort.zprivate.compare.a
data modify storage ceevyte sort.zprivate.input set from storage ceevyte sort.zprivate.compare.c
data remove storage ceevyte sort.zprivate.compare.c
function ceevyte:sort/zprivate/next
