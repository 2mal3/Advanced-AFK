import ../../macros/log.mcm


function load {
  log AdvancedAFK info server <Datapack reloaded>

  scoreboard objectives add adaf.data dummy

  # scoreboard players set %installed adaf.data 0
  # Initializes the datapack at the first startup or new version
  execute unless score %installed adaf.data matches 1 run {
    log AdvancedAFK info server <Datapack installed>
    scoreboard players set %installed adaf.data 1

    scoreboard objectives add 2mal3.debugMode dummy
    scoreboard objectives add adaf.data dummy
    scoreboard objectives add afk trigger
    scoreboard objectives add adaf.afkTime dummy
    scoreboard objectives add adaf.pos.x dummy
    scoreboard objectives add adaf.pos.y dummy
    scoreboard objectives add adaf.pos.z dummy
    # Set the version in format: xx.xx.xx
    scoreboard players set $version adaf.data 020100
    # Teams
    team add adaf.afk
    team modify adaf.afk color gray
    team modify adaf.afk suffix {"text":" [AFK]","color": "gray"}
    # Set config
    #declare storage adaf:data
    data merge storage adaf:data {gamerules: {autoAFK: 1b, time: 5, message: 1b, name: 1b, invulnerable: 0b, trigger: 0b}, pos: []}

    schedule 4s replace {
      tellraw @a {"text":"Advanced AFK Datapack v2.1.0 by 2mal3 was installed!","color":"green"}
    }
  }
  execute if score %installed adaf.data matches 1 unless score $version adaf.data matches 020000 run {
    execute if score $version adaf.data matches 020000 run {
      log AdvancedAFK info server <Updated datapack from v2.0.0 to v2.1.0>
      scoreboard players set $version adaf.data 020100
    }
  }
}

function first_join {
  # Warns the player if he uses a not supported server software or minecraft version
  execute store result score .temp0 nola.data run data get entity @s DataVersion
  execute unless score .temp0 nola.data matches 3120 run tellraw @s [{"text":"[","color":"gray"},{"text":"NoLag","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use the 1.19.2 to prevent errors.","color":"gold"}]
}

advancement first_join {
  "criteria": {
      "requirement": {
          "trigger": "minecraft:tick"
      }
  },
  "rewards": {
      "function": "adaf:base/first_join"
  }
}

advancement adaf {
  "display": {
    "title": "Advanced AFK v2.1.0",
    "description": "A highly configurable AFK datapack with many features.",
    "icon": {
      "item": "minecraft:fishing_rod"
    },
    "announce_to_chat": false,
    "show_toast": false
  },
  "parent": "global:2mal3",
  "criteria": {
    "trigger": {
      "trigger": "minecraft:tick"
    }
  }
}

function uninstall {
  log AdvancedAFK info server <Datapack uninstalled>

  scoreboard objectives remove adaf.data
  scoreboard objectives remove afk
  scoreboard objectives remove adaf.afkTime
  scoreboard objectives remove adaf.pos.x
  scoreboard objectives remove adaf.pos.y
  scoreboard objectives remove adaf.pos.z
  team remove adaf.afk
  data remove storage adaf:data gamerules

  # Sends an uninstallation message to all players
  tellraw @a {"text":"Advanced AFK Datapack v2.1.0 by 2mal3 was successfully uninstalled.","color": "green"}

  # Disables the datapack
  datapack disable "file/Advanced-AFK-Datapack"
  datapack disable "file/Advanced-AFK-Datapack.zip"
}
