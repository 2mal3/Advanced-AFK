# Description: Init datapack
# Called from: #reaload
# Datapack by 2mal3

# add scoreboards
scoreboard objectives add adaf.data dummy
scoreboard objectives add adaf.config dummy
scoreboard objectives add adaf.afk_time dummy
scoreboard objectives add afk trigger {"text":"AFK Toggled"}

scoreboard objectives add adaf.pos_x dummy
scoreboard objectives add adaf.pos_y dummy
scoreboard objectives add adaf.pos_z dummy

# set version
scoreboard players set $version adaf.data 010000


# add teams
team add adaf.afk



# send reload massage after 4 sekonds
execute unless score $first_run adaf.data matches 1 run schedule function 2mal3:adaf/core/first_run 4s

# start other ticks
function 2mal3:adaf/core/tick/second
