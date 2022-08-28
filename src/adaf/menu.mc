
function display {
  playsound minecraft:ui.button.click master @s
  gamerule sendCommandFeedback false
  schedule 1t replace {
    gamerule sendCommandFeedback true
  }


  # Display the config
  # Start
  tellraw @s {"text":"\n\n\n\n"}
  tellraw @s [{"text":"Advanced AFK Config","bold":true,"color":"gold"},{"text":"\n--------------------------------","color":"gold"}]
  tellraw @s {"text":""}

  # Auto afk
  execute if data storage adaf:data gamerules{autoAFK: 0b} run {
    tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/auto_afk/enable"}},{"text":" Auto afk","color":"gold","hoverEvent":{"action":"show_text","contents":"Players are automatically marked as afk after a certain time."}}]
  }
  execute if data storage adaf:data gamerules{autoAFK: 1b} run {
    tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/auto_afk/disable"}},{"text":" Auto afk","color":"gold","hoverEvent":{"action":"show_text","contents":"Players are automatically marked as afk after a certain time."}}]
  }
  execute store result score .temp0 adaf.data run data get storage adaf:data gamerules.time
  tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/data modify storage adaf:data gamerules.time set value "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Auto afk time: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Time after the player is marked as afk."}},{"score":{"name":".temp0","objective":"adaf.data"},"color":"red"}]
  tellraw @s {"text":""}

  # Afk messages
  execute if data storage adaf:data gamerules{message: 0b} run {
    tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/message/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk message","color":"gold","hoverEvent":{"action":"show_text","contents":"Sends a message to all players when a player is afk or not."}}]
  }
  execute if data storage adaf:data gamerules{message: 1b} run {
    tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/message/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk message","color":"gold","hoverEvent":{"action":"show_text","contents":"Sends a message to all players when a player is afk or not."}}]
  }
  tellraw @s {"text":""}

  # Afk trigger
  execute if data storage adaf:data gamerules{trigger: 0b} run {
    tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/trigger/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk trigger","color":"gold","hoverEvent":{"action":"show_text","contents":"Players can set their own AFK status with a command."}}]
  }
  execute if data storage adaf:data gamerules{trigger: 1b} run {
    tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/trigger/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk trigger","color":"gold","hoverEvent":{"action":"show_text","contents":"Players can set their own AFK status with a command."}}]
  }
  tellraw @s {"text":""}

  # Afk name
  summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["adaf.example"], CustomName: '{"text":"Steve"}'}
  team join adaf.afk @e[type=minecraft:area_effect_cloud,tag=adaf.example]
  execute if data storage adaf:data gamerules{name: 0b} run {
    tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/name/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk name","color":"gold","hoverEvent":{"action":"show_text","contents":"Players who are afk get a different name (incompatible with teams)."}}]
  }
  execute if data storage adaf:data gamerules{name: 1b} run {
    tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/name/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk name","color":"gold","hoverEvent":{"action":"show_text","contents":"Players who are afk get a different name (incompatible with teams)."}}]
  }
  tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/team modify adaf.afk color "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Name color","color":"gold","hoverEvent":{"action":"show_text","contents":"The color of the name."}}]
  tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/team modify adaf.afk prefix "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Name prefix","color":"gold","hoverEvent":{"action":"show_text","contents":"The prefix of the name. Must be in json."}}]
  tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/team modify adaf.afk suffix "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Name suffix","color":"gold","hoverEvent":{"action":"show_text","contents":"The suffix of the name. Must be in json."}}]
  tellraw @s [{"text":"Example: ","color":"gold"},{"selector":"@e[type=minecraft:area_effect_cloud,tag=adaf.example]"}]
  tellraw @s {"text":""}

  # Invulnerable
  execute if data storage adaf:data gamerules{invulnerable: 0b} run {
    tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/invulnerable/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Invulnerable","color":"gold","hoverEvent":{"action":"show_text","contents":"All players who are AFK are invulnerable, but cannot do anything else."}}]
  }
  execute if data storage adaf:data gamerules{invulnerable: 1b} run {
    tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function adaf:menu/buttons/invulnerable/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Invulnerable","color":"gold","hoverEvent":{"action":"show_text","contents":"All players who are AFK are invulnerable, but cannot do anything else."}}]
  }
  tellraw @s {"text":""}

  # Refresh button
  tellraw @s {"text":"\u25b6 Refresh","color":"red","clickEvent":{"action":"run_command","value":"/function adaf:menu/display"},"hoverEvent":{"action":"show_text","contents":"*click*"}}

}

dir buttons {
  dir auto_afk {
    function enable {
      data modify storage adaf:data gamerules.autoAFK set value 1b
      function adaf:menu/display
    }
    function disable {
      data modify storage adaf:data gamerules.autoAFK set value 0b
      function adaf:menu/display
    }
  }

  dir message {
    function enable {
      data modify storage adaf:data gamerules.message set value 1b
      function adaf:menu/display
    }
    function disable {
      data modify storage adaf:data gamerules.message set value 0b
      function adaf:menu/display
    }
  }

  dir trigger {
    function enable {
      data modify storage adaf:data gamerules.trigger set value 1b
      function adaf:menu/display
    }
    function disable {
      data modify storage adaf:data gamerules.trigger set value 0b
      function adaf:menu/display
    }
  }

  dir invulnerable {
    function enable {
      data modify storage adaf:data gamerules.invulnerable set value 1b
      function adaf:menu/display
    }
    function disable {
       data modify storage adaf:data gamerules.invulnerable set value 0b
      function adaf:menu/display
    }
  }

  dir name {
    function enable {
      data modify storage adaf:data gamerules.name set value 1b
      function adaf:menu/display
    }
    function disable {
      data modify storage adaf:data gamerules.name set value 0b
      function adaf:menu/display
    }
  }
}
