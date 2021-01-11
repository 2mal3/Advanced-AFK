# Description: Ask if you want to uninstall
# Called from: #uninstall
# Datapack by 2mal3

tellraw @s [{"text":"Do you really want to deinstall the Advanced AFK Datapack v1.0.0","color":"red"},{"text":" by 2mal3?","color":"red"},{"text":"\n"},{"text":"[No]","color":"dark_green","hoverEvent":{"action":"show_text","value":"*click*"},"clickEvent":{"action": "run_command", "value": "/tellraw @s {\"text\":\"Thanks!\",\"color\":\"green\"}"}},{"text":" \u0020"},{"text":"[Yes]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:adaf/core/uninstall/uninstall"},"hoverEvent":{"action":"show_text","value":"*click*"}}]
