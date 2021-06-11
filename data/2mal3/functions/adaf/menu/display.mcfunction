# Description: Displays the config menu
# Called from tag: 2mal3:adaf/core/tick/second
# Datapack by 2mal3

# Disables command feedback for one tick so that no annoying message is displayed.
gamerule sendCommandFeedback false
schedule function 2mal3:adaf/menu/send_command_feedback_true 1t


# Plays click sound
playsound minecraft:ui.button.click master @s


# Display the config
# Start
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

tellraw @s [{"text":"Advanced AFK Config","bold":true,"color":"gold"},{"text":"\n--------------------------------","color":"gold"}]

tellraw @s {"text":""}

# Auto afk
execute if score $auto_afk adaf.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/auto_afk/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Auto afk","color":"gold","hoverEvent":{"action":"show_text","contents":"Players are automatically marked as afk after a certain time."}}]
execute if score $auto_afk adaf.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/auto_afk/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Auto afk","color":"gold","hoverEvent":{"action":"show_text","contents":"Players are automatically marked as afk after a certain time."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $time adaf.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Auto afk time: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Time after the player is marked as afk."}},{"score":{"name":"$time","objective":"adaf.config"},"color":"red"}]

tellraw @s {"text":""}

# Afk messages
execute if score $message adaf.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/message/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk message","color":"gold","hoverEvent":{"action":"show_text","contents":"Sends a message to all players when a player is afk or not."}}]
execute if score $message adaf.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/message/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk message","color":"gold","hoverEvent":{"action":"show_text","contents":"Sends a message to all players when a player is afk or not."}}]

tellraw @s {"text":""}

# Afk trigger
execute if score $trigger adaf.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/trigger/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk trigger","color":"gold","hoverEvent":{"action":"show_text","contents":"Players can set their own AFK status with a command."}}]
execute if score $trigger adaf.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/trigger/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk trigger","color":"gold","hoverEvent":{"action":"show_text","contents":"Players can set their own AFK status with a command."}}]

tellraw @s {"text":""}

# Afk name
summon area_effect_cloud ~ ~ ~ {Tags: ["adaf.example"], CustomName: '{"text":"Steve"}'}
team join adaf.afk @e[type=minecraft:area_effect_cloud,tag=adaf.example]

execute if score $name adaf.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/name/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk name","color":"gold","hoverEvent":{"action":"show_text","contents":"Players who are afk get a different name (incompatible with teams)."}}]
execute if score $name adaf.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/name/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk name","color":"gold","hoverEvent":{"action":"show_text","contents":"Players who are afk get a different name (incompatible with teams)."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/team modify adaf.afk color "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Name color","color":"gold","hoverEvent":{"action":"show_text","contents":"The colour of the name."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/team modify adaf.afk prefix "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Name prefix","color":"gold","hoverEvent":{"action":"show_text","contents":"The prefix of the name. Must be in json."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/team modify adaf.afk suffix "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Name suffix","color":"gold","hoverEvent":{"action":"show_text","contents":"The suffix of the name. Must be in json."}}]
tellraw @s [{"text":"Example: ","color":"gold"},{"selector":"@e[type=minecraft:area_effect_cloud,tag=adaf.example]"}]

kill @e[type=minecraft:area_effect_cloud,tag=adaf.example]

tellraw @s {"text":""}

# Got mode
execute if score $got_mode adaf.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/got_mode/enable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk got mode","color":"gold","hoverEvent":{"action":"show_text","contents":"All players who are AFK are invulnerable, but cannot do anything else."}}]
execute if score $got_mode adaf.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/buttons/got_mode/disable"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Afk got mode","color":"gold","hoverEvent":{"action":"show_text","contents":"All players who are AFK are invulnerable, but cannot do anything else."}}]

tellraw @s {"text":""}

# Refresh button
tellraw @s {"text":"Refresh","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/menu/display"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
