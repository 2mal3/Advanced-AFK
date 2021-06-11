# Description: Takes the afk mode away from a player
# AS: @a[tag=adaf.afk,tag=adaf.is_moving], AT: @s
# Called from: 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Output debug message in chat, if enabled (DEBUG)
tellraw @a[scores={adaf.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"AdvancedAFK","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector": "@s","color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Player is not longer AFK","color":"aqua"}]

# Leaves the AFK Team
team leave @s[team=adaf.afk]
# Sends an message if it is activated
execute if score $message adaf.config matches 1 run tellraw @a [{"selector":"@s","color":"gray"},{"text":" is no longer AFK.","color":"gray"}]
# Disables the got mode, if it is activated
execute if score $got_mode adaf.config matches 1 run function 2mal3:adaf/remove_afk/got_mode

# Tags
tag @s remove adaf.afk
scoreboard players reset @s afk
