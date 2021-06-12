# Description: Installs the Datapack on first start
# AS: server, AT: server
# Called from function: 2mal3:adaf/core/reload
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={adaf.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"AdvancedAFK","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text": "Server","color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed","color":"green"}]

# Adds scoreboards
scoreboard objectives add adaf.data dummy
scoreboard objectives add adaf.debug_mode dummy
scoreboard objectives add adaf.config dummy
scoreboard objectives add adaf.afk_time dummy
scoreboard objectives add afk trigger {"text":"AFK Toggled"}
scoreboard objectives add adaf.pos_x dummy
scoreboard objectives add adaf.pos_y dummy
scoreboard objectives add adaf.pos_z dummy
# Add teams
team add adaf.afk

# Set the version in format: xx.xx.xx
scoreboard players set $version adaf.data 010100
# Sets the start config
scoreboard players set $auto_afk adaf.config 1
scoreboard players set $time adaf.config 5
scoreboard players set $name adaf.config 1
scoreboard players set $message adaf.config 0
scoreboard players set $trigger adaf.config 1
scoreboard players set $got_mode adaf.config 0
team modify adaf.afk suffix {"text":" [AFK]","color":"gray"}
team modify adaf.afk color gray

# Sends Insatlations message after 4 sekonds
schedule function 2mal3:adaf/core/first_run/send_message 4s


# Remembers that the Datapack was installed
scoreboard players set .first_run adaf.data 1
