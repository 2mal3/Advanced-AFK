import ../../macros/log.mcm


clock 1s {
    name loop

    execute as @a[tag=!global.ignore] run {
        # Auto afk module
        execute if data storage adaf:data gamerules{autoAFK:1b} run {
            # Test for every player if he is moving
            tag @s remove adaf.moving

            scoreboard players operation .temp0 adaf.data = @s adaf.pos.x
            scoreboard players operation .temp1 adaf.data = @s adaf.pos.y
            scoreboard players operation .temp2 adaf.data = @s adaf.pos.z

            data modify storage adaf:data pos set from entity @s Pos
            execute store result score @s adaf.pos.x run data get storage adaf:data pos[0] 0.5
            execute store result score @s adaf.pos.y run data get storage adaf:data pos[1] 0.5
            execute store result score @s adaf.pos.z run data get storage adaf:data pos[2] 0.5

            execute unless score .temp0 adaf.data = @s adaf.pos.x run tag @s add adaf.moving
            execute unless score .temp1 adaf.data = @s adaf.pos.y run tag @s add adaf.moving
            execute unless score .temp2 adaf.data = @s adaf.pos.z run tag @s add adaf.moving

            # Count afk time
            execute if entity @s[tag=adaf.moving] run scoreboard players set @s adaf.afkTime 0
            execute if entity @s[tag=!adaf.moving] run scoreboard players add @s adaf.afkTime 1

            # Switch afk mode
            execute store result score .temp0 adaf.data run data get storage adaf:data gamerules.time 60
            execute if entity @s[tag=!adaf.afk] if score @s adaf.afkTime >= .temp0 adaf.data run function adaf:core/enter
            execute if entity @s[tag=adaf.afk,tag=adaf.moving] run function adaf:core/leave
        }

        # Trigger module
        execute if data storage adaf:data gamerules{trigger: 1b} run {
            scoreboard players enable @a afk
            execute if score @s afk matches 1.. run {
                scoreboard players reset @s afk
                execute(if entity @s[tag=!adaf.afk]) {
                    function adaf:core/enter
                } else {
                    execute if entity @s[tag=adaf.afk] run function adaf:core/leave
                }
            }
        }
    }
}


function enter {
    log AdvancedAFK debug entity <Enter AFK mode>
    tag @s add adaf.afk

    execute if data storage adaf:data gamerules{message: 1b} run tellraw @a [{"selector":"@s","color":"gray"},{"text":" is now AFK.","color":"gray"}]
    execute if data storage adaf:data gamerules{name: 1b} run team join adaf.afk @s
    execute if data storage adaf:data gamerules{invulnerable: 1b} run {
        effect give @s minecraft:resistance 999999 255 true
        attribute @s minecraft:generic.knockback_resistance base set 1
        effect give @s minecraft:slowness 999999 255 true
        effect give @s minecraft:mining_fatigue 999999 255 true
        effect give @s minecraft:weakness 999999 255 true
        effect give @s minecraft:jump_boost 99999 200 true
    }
}

function leave {
    log AdvancedAFK debug entity <Leave AFK mode>
    tag @s remove adaf.afk

    execute if data storage adaf:data gamerules{name: 1b} run team leave @s
    execute if data storage adaf:data gamerules{message: 1b} run tellraw @a [{"selector":"@s","color":"gray"},{"text":" is no longer AFK.","color":"gray"}]
    execute if data storage adaf:data gamerules{invulnerable: 1b} run {
        effect clear @s minecraft:resistance
        attribute @s minecraft:generic.knockback_resistance base set 0
        effect clear @s minecraft:slowness
        effect clear @s minecraft:mining_fatigue
        effect clear @s minecraft:weakness
        effect clear @s minecraft:jump_boost
    }
}
