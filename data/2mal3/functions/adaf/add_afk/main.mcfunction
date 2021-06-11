# Description: Sets a player to AFK mode
# AS: @a[tag=!adaf.afk,tag=!global.ignore], AT: @s
# Called from: 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Output debug message in chat, if enabled (DEBUG)
tellraw @a[scores={adaf.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"AdvancedAFK","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector": "@s","color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Player is now AFK","color":"aqua"}]

# Sends an message if it is activated
execute if score $message adaf.config matches 1 run tellraw @a [{"selector":"@s","color":"gray"},{"text":" is now AFK.","color":"gray"}]
# Joins the AFK Team when it is activated
execute if score $name adaf.config matches 1 run team join adaf.afk @s
# Activates the got mode, if it is enabled
execute if score $got_mode adaf.config matches 1 run function 2mal3:adaf/add_afk/got_mode

# Tags
tag @s add adaf.afk
scoreboard players reset @s afk
