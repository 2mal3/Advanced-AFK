# Description: Sets a player to AFK mode
# Called from: 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Sends an message if it is activated
execute if score $message adaf.config matches 1 run tellraw @a [{"selector":"@s","color":"gray"},{"text":" is now AFK.","color":"gray"}]

# Joins the AFK Team when it is activated
execute if score $name adaf.config matches 1 run team join adaf.afk @s

# Activates the got mode, if it is enabled
execute if score $got_mode adaf.config matches 1 run function 2mal3:adaf/add_afk/got_mode


# Tags
tag @s add adaf.afk
execute if score $adaf.trigger adaf.config matches 1 run tag @s remove adaf.temp
