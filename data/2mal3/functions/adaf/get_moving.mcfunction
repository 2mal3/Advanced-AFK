# Description: Tests if the player moves
# Called from function: 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Reset
tag @s remove adaf.is_moving

# Saves old position
scoreboard players operation $adaf.temp_0 adaf.data = @s adaf.pos_x
scoreboard players operation $adaf.temp_1 adaf.data = @s adaf.pos_y
scoreboard players operation $adaf.temp_2 adaf.data = @s adaf.pos_z

# Saves new position
execute store result score @s adaf.pos_x run data get entity @s Pos[0]
execute store result score @s adaf.pos_y run data get entity @s Pos[1]
execute store result score @s adaf.pos_z run data get entity @s Pos[2]

# Tests if the positions are different
execute unless score @s adaf.pos_x = $adaf.temp_0 adaf.data run tag @s add adaf.is_moving
execute unless score @s adaf.pos_y = $adaf.temp_1 adaf.data run tag @s add adaf.is_moving
execute unless score @s adaf.pos_z = $adaf.temp_2 adaf.data run tag @s add adaf.is_moving