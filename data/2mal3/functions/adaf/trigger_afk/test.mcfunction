# Description: Tests if the player has triggered AFK if this is allowed
# Called from: 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Toggles AFK if allowed
execute if score $trigger adaf.config matches 1 run function 2mal3:adaf/trigger_afk/true

# Reset
scoreboard players reset @s afk
