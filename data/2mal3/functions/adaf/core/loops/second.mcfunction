# Description: Tick commands every second
# AS: server, AT: server
# Called from: 2mal3:adaf/core/reload, 2mal3:adaf/core/loops/second
# Datapack by 2mal3

# A player is afk
execute if score $auto_afk adaf.config matches 1 as @a[tag=!adaf.afk,tag=!global.ignore] if score $time adaf.config = @s adaf.afk_time run function 2mal3:adaf/add_afk/main
# A player is no longer afk
execute as @a[tag=adaf.afk,tag=adaf.is_moving] run function 2mal3:adaf/remove_afk/main
# AFK trigger
execute if score $trigger adaf.config matches 1 as @a[scores={afk=1..}] run function 2mal3:adaf/toggle_afk
execute if score $trigger adaf.config matches 1 run scoreboard players enable @a afk

# Call the function next second
schedule function 2mal3:adaf/core/loops/second 1s replace
