# Description: First datapack run
# Called from: 2mal3:adaf/core/reload
# Datapack by 2mal3

# Sends installation message to all players
tellraw @s {"text":"Advanced AFK Datapack v1.0.0 by 2mal3 was installed!","color":"blue"}


# Sets the start config
scoreboard players set $auto_afk adaf.config 1
scoreboard players set $time adaf.config 5
scoreboard players set $name adaf.config 1
scoreboard players set $message adaf.config 0
scoreboard players set $trigger adaf.config 1
scoreboard players set $got_mode adaf.config 0

team modify adaf.afk suffix {"text":" [AFK]","color":"gray"}
team modify adaf.afk color gray



# Remembers that the datapack has been installed
scoreboard players set $first_run adaf.data 1
