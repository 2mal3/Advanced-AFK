# Description: Toggles the AFK status
# Called from: 2mal3:adaf/core/loop
# Datapack by 2mal3

execute if entity @s[tag=adaf.afk,scores={afk=1..}] run function 2mal3:adaf/remove_afk/main
execute if entity @s[tag=!adaf.afk,scores={afk=1..}] run function 2mal3:adaf/add_afk/main

