execute if score #narrativa.options.dont ceevyte matches 1 run return 0
execute unless score #narrativa.options.dont_trigger ceevyte matches 1 as @a if score @s ceevyte.narrativa.util.next matches 1.. run function ceevyte:narrativa/zprivate/next_line
execute unless score #narrativa.options.dont_display ceevyte matches 1 if data storage minecraft:ceevyte narrativa.zprivate.input run function ceevyte:narrativa/zprivate/display with storage ceevyte narrativa.zprivate.input
