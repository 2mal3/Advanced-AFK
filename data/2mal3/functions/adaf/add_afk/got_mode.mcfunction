# Description: Activates the got mode, if it is enabled
# AS: @a[tag=!adaf.afk,tag=!global.ignore], AT: @s
# Called from: 2mal3:adaf/add_afk/main
# Datapack by 2mal3

# Add protecting effects
effect give @s minecraft:resistance 99999 99 true
effect give @s minecraft:fire_resistance 99999 0 true
effect give @s minecraft:water_breathing 99999 0 true
attribute @s minecraft:generic.knockback_resistance base set 1

# Add blocking effects
effect give @s minecraft:slowness 99999 255 true
effect give @s minecraft:weakness 99999 255 true
effect give @s minecraft:jump_boost 99999 200 true
effect give @s minecraft:mining_fatigue 99999 255 true
