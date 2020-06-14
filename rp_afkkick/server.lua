-- Idea and based off Scammer's AFK resource | by ethanol20#4434
-- https://forum.cfx.re/t/release-afk-and-high-ping-kick/7904
-- Join my Discord for more awesome scripts and to submit your ideas so i can make them!
-- https://discord.gg/SQXvn5a


local reason = '[Project X] You have been AFK for too long. Bandwidth is not CHEAPPPPP. K thx baye.'
local webhook = 'WEBHOOKHERE'
local loggedalready = false -- Set this to true if you have a script that handles this already.

RegisterNetEvent('afk:kick')
AddEventHandler('afk:kick', function(player)
    local name = GetPlayerName(source)
    if Config.loggedalready == false and not IsPlayerAceAllowed(source, 'afk:immune') then
        DropPlayer(source, reason)
        DiscordWebHook(name, reason, color)
    elseif Config.loggedalready == true and not IsPlayerAceAllowed(source, 'afk:immune') then
        DropPlayer(source, reason)
    end
end)

function DiscordWebHook(name, message, color)
    local connect = {
          {
              ["color"] = color,
              ["title"] = "**" .. name .. "**",
              ["description"] = message,
              ["footer"] = {
              ["text"] = footer,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = connect}), { ['Content-Type'] = 'application/json' })
end
