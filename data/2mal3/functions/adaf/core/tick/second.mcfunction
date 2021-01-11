# Description: Tick commands every second
# Called from: 2mal3:adaf/core/reload, 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Tests if the player moves
execute as @a run function 2mal3:adaf/get_moving

# Counts AFK seconds
execute if score $adaf.auto_afk adaf.config matches 1 as @a[tag=!adaf.is_moving] run scoreboard players add @s adaf.afk_time 1
execute if score $adaf.auto_afk adaf.config matches 1 as @a[tag=adaf.is_moving] run scoreboard players set @s adaf.afk_time 0

# A player is afk
execute if score $adaf.auto_afk adaf.config matches 1 as @a[tag=!adaf.afk] if score $adaf.time adaf.config = @s adaf.afk_time run function 2mal3:adaf/add_afk/main

# A player is no longer afk
execute as @a[tag=adaf.afk,tag=adaf.is_moving] run function 2mal3:adaf/remove_afk/main

# AFK trigger
execute as @a[scores={afk=1..}] run function 2mal3:adaf/trigger_afk/test
execute if score $adaf.trigger adaf.config matches 1 run scoreboard players enable @a afk


# Call the function next second
schedule function 2mal3:adaf/core/tick/second 1s
