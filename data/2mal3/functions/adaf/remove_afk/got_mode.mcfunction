# Description: Disables the got mode, if it is activated
# Called from: 2mal3:adaf/remove_afk/main
# Datapack by 2mal3

effect clear @s minecraft:resistance
effect clear @s minecraft:fire_resistance
effect clear @s minecraft:water_breathing
attribute @s minecraft:generic.knockback_resistance base set 0

effect clear @s minecraft:slowness
effect clear @s minecraft:weakness
effect clear @s minecraft:jump_boost
effect clear @s minecraft:mining_fatigue