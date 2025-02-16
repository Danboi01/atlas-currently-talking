local startingHeight = 0.01 
local titleColor = '~b~' 
local outerIdColor = '~w~' 
local innerIdColor = '~w~' 
local defaultNameColor = '~w~' 

function drawTxt(x, y, scale, text)
    SetTextFont(6)
    SetTextScale(scale, scale)
    SetTextCentre(true)
    SetTextOutline()
    SetTextJustification(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        local displayed = false
        for _, player in ipairs(GetActivePlayers()) do
            if NetworkIsPlayerTalking(player) then
                local playerId = GetPlayerServerId(player)
                local playerName = GetPlayerName(player)
                local name = string.format("%s[%s%d%s] %s%s", outerIdColor, innerIdColor, playerId, outerIdColor, defaultNameColor, playerName)
                drawTxt(0.5, startingHeight, 0.35, titleColor .. "Currently Talking:\n" .. name)
                displayed = true
                break 
            end
        end
        if not displayed then
            Citizen.Wait(100) 
        else
            Citizen.Wait(0) 
        end
    end
end)
