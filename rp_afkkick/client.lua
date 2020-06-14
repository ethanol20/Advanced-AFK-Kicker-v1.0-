-- Idea and based off Scammer's AFK resource | by ethanol20#4434
-- https://forum.cfx.re/t/release-afk-and-high-ping-kick/7904
-- Join my Discord for more awesome scripts and to submit your ideas so i can make them!
-- https://discord.gg/SQXvn5a


local kicktime = 10 --(IN SECONDS)
local voice = false

Citizen.CreateThread(function()	
	while true do
		Wait(1000)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)
			if currentPos == prevPos and not IsEntityDead(playerPed) then
				if time > 0 then
					if time == math.ceil(kicktime / 2) then
						afkinfo("You will be kicked in " .. math.modf(time/60) .. " minute/s")
					end
					if time == math.ceil(kicktime / 3) then
						afkinfo("You will be kicked in " .. math.modf(time/60) .. " minute/s")
					end
					if time == math.ceil(kicktime / 5) then
						afkinfo("You will be kicked in " .. math.modf(time/60) .. " minute/s")
						if Config.voice == true then 
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'afk', 0.8)
						end
					end
					if time == math.ceil(kicktime / 15) then
						afkinfo("You will be kicked in " .. math.modf(time) .. " seconds")
					end
					time = time - 1
				else
					TriggerServerEvent("afk:kick")
				end
			else
				time = kicktime
			end
			prevPos = currentPos
		end
	end
end)

function afkinfo(text)
    SetNotificationTextEntry("STRING");
    AddTextComponentString(text);
    SetNotificationMessage('CHAR_FLOYD', 'AFK', true, 1, '[Project X] AFK KICK');
    DrawNotification(false, false)
end 
