# Description: Uninstalls the Datapack
# AS: player, AT: player
# Called from function: core/uninstall/uninstall_ask
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={adaf.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"AdvancedAFK","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack uninstalled","color":"green"}]


# Stops the loop
schedule clear 2mal3:adaf/core/loops/second
schedule clear 2mal3:adaf/core/loops/minute

# Deletes the scoreboards
scoreboard objectives remove adaf.data
scoreboard objectives remove adaf.debug_mode
scoreboard objectives remove adaf.config
scoreboard objectives remove adaf.afk_time
scoreboard objectives remove afk
scoreboard objectives remove adaf.pos_x
scoreboard objectives remove adaf.pos_y
scoreboard objectives remove adaf.pos_z
# Remove teams
team remove adaf.afk

# Sends an uninstallation message to all players
tellraw @a [{"text":"Advanced AFK Datapack v1.1.0 by 2mal3 was successfully uninstalled."}]

# Disables the datapack
datapack disable "file/Advanced-AFK-Datapack-v1.1.0"
datapack disable "file/Advanced-AFK-Datapack-v1.1.0.zip"
