-- Idea and based off Scammer's AFK resource | by ethanol20#4434
-- https://forum.cfx.re/t/release-afk-and-high-ping-kick/7904
-- Join my Discord for more awesome scripts and to submit your ideas so i can make them!
-- https://discord.gg/SQXvn5a


local kicktime = 600 --(IN SECONDS)
local voice = false

Citizen.CreateThread(function()	
	while true do
		Wait(1000)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)
			if currentPos == prevPos and not IsEntityDead(playerPed) then
				if time > 0 then
					if time == math.ceil(kicktime/60 / 5) then
						ShowInfo("You will be kicked in " .. time .. " minutes")
					end
					if time == math.ceil(kicktime/60 / 4) then
						ShowInfo("You will be kicked in " .. time .. " minutes")
					end
					if time == math.ceil(kicktime/60 / 3) then
						ShowInfo("You will be kicked in " .. time .. " minutes")
					end
					if time == math.ceil(kicktime/60 / 2) then
						ShowInfo("You will be kicked in " .. time .. " minutes")
					end
					time = time - 1
				else
					TriggerServerEvent("afk:kick")
				end
			else
				time = kicktime
			end
			if time == math.ceil(kicktime / 5) then
				TriggerServerEvent('InteractSound_SV:PlayOnAll', 'afk', 0.8)
			end
			prevPos = currentPos
		end
	end
end)

function ShowInfo(text)
    SetNotificationTextEntry("STRING");
    AddTextComponentString(text);
	SetNotificationMessage('CHAR_FLOYD', 'AFK', true, 1, '[Project X] AFK KICK');
	DrawNotification(false, false)
end 
