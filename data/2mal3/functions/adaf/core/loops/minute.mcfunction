# Description: Tick commands every minute
# AS: server, AT: server
# Called from: 2mal3:adaf/core/reload, 2mal3:adaf/core/loops/minute
# Datapack by 2mal3

# Tests if the player moves
execute as @a run function 2mal3:adaf/get_moving

# Counts AFK minutes
execute if score $auto_afk adaf.config matches 1 as @a[tag=!adaf.is_moving] run scoreboard players add @s adaf.afk_time 1
execute if score $auto_afk adaf.config matches 1 as @a[tag=adaf.is_moving] run scoreboard players set @s adaf.afk_time 0


# Call the function next second
schedule function 2mal3:adaf/core/loops/minute 60s replace
