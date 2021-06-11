# Description: Takes the afk mode away from a player
# Called from: 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Joins the AFK Team when it is activated
execute if score $name adaf.config matches 1 run team leave @s

# Sends an message if it is activated
execute if score $message adaf.config matches 1 run tellraw @a [{"selector":"@s","color":"gray"},{"text":" is no longer AFK.","color":"gray"}]

# Disables the got mode, if it is activated
execute if score $got_mode adaf.config matches 1 run function 2mal3:adaf/remove_afk/got_mode

# Tags
tag @s remove adaf.afk
execute if score $trigger adaf.config matches 1 run tag @s remove adaf.temp
