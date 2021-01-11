# Description: Toggles the AFK status
# Called from: 2mal3:adaf/trigger_afk/test
# Datapack by 2mal3

# add tag for the system
tag @s add adaf.temp

# toggle
execute if entity @s[tag=adaf.afk,tag=adaf.temp] run function 2mal3:adaf/remove_afk/main
execute if entity @s[tag=!adaf.afk,tag=adaf.temp] run function 2mal3:adaf/add_afk/main

