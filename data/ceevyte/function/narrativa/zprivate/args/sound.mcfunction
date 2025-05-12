function ceevyte:narrativa/zprivate/args/_sound with storage ceevyte narrativa.tmp
$execute as @a at @s run playsound $(sound) voice @s ~ ~ ~ 1 1 1
data modify storage ceevyte narrativa.tmp.sound set from storage ceevyte narrativa.zprivate.args.sound
