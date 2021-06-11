# Description: Uninstall the datapack
# Called from: core/uninstall/uninstall_ask
# Datapack by 2mal3

# send remove message
tellraw @a {"text":"Advanced AFK Datapack v1.0.0 by 2mal3 was successfully uninstalled."}


# remove scoreboards
scoreboard objectives remove adaf.data
scoreboard objectives remove adaf.config
scoreboard objectives remove adaf.afk_time
scoreboard objectives remove afk

scoreboard objectives remove adaf.pos_x
scoreboard objectives remove adaf.pos_y
scoreboard objectives remove adaf.pos_z


# remove teams
team remove adaf.afk


# stop ticks
schedule clear 2mal3:adaf/core/loop



# disable datapack
datapack disable "file/Advanced-AFK-Datapack-v1.0.0"
datapack disable "file/Advanced-AFK-Datapack-v1.0.0.zip"
