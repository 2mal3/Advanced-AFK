# Description: Sends a debug message with information about the datapack and the world to the executing player
# AS: player, AT: player
# Called from tag: 2mal3:adaf/debug
# Datapack by 2mal3

# Get variables
execute store result score .temp_0 adaf.data run data get entity @s DataVersion
execute store result score .temp_1 adaf.data run datapack list
execute store result score .temp_2 adaf.data run execute if entity @a

# adaf version; minecraft version; datapack count; player count
tellraw @s [{"text":"Debug data: ","color":"gold"},{"score":{"name":"$version","objective":"adaf.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":".temp_0","objective":"adaf.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":".temp_1","objective":"adaf.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":".temp_2","objective":"adaf.data"},"color":"red"}]
