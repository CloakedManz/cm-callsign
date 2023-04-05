local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('setcallsign', function(source, args, rawCommand)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "police" then
            local playerPed = PlayerPedId()
            local vehicle

            if Config.UseQBTarget == true then
                vehicle = QBCore.Functions.GetClosestVehicle()
            else
                vehicle = GetVehiclePedIsIn(playerPed, false)
            end

            if #callsign == 3 then
                local callsign1 = tonumber(string.sub(callsign, 1, 1))
                local callsign2 = tonumber(string.sub(callsign, 2, 2))
                local callsign3 = tonumber(string.sub(callsign, 3, 3))

                SetVehicleModKit(vehicle, 0)

                if Config.ProjectSlothCars == true then
                    SetVehicleMod(vehicle, 28, callsign1, false)
                    SetVehicleMod(vehicle, 29, callsign2, false)
                    SetVehicleMod(vehicle, 30, callsign3, false)
                elseif Config.CarLabs == true then
                    SetVehicleMod(vehicle, 42, callsign1, false)
                    SetVehicleMod(vehicle, 44, callsign2, false)
                    SetVehicleMod(vehicle, 45, callsign3, false)
                end
            else
                QBCore.Functions.Notify('Your callsign must be 3 digits long!', 'error', 7000)
            end
        else
            QBCore.Functions.Notify('You are not allowed to use this command!', 'error', 7000)
        end
    end)
end)

RegisterCommand('setcallsigncolor', function(source, args, rawCommand)
    local PlayerData = QBCore.Functions.GetPlayerData()

    if PlayerData.job.name == "police" then
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        local color = tostring(args[1])

        if color == "black" then
            SetVehicleDashboardColour(vehicle, 0)
        elseif color == "white" then
            SetVehicleDashboardColour(vehicle, 111)
        elseif color == "red" then
            SetVehicleDashboardColour(vehicle, 27)
        elseif color == "yellow" then
            SetVehicleDashboardColour(vehicle, 88)
        elseif color == "blue" then
            SetVehicleDashboardColour(vehicle, 64)
        elseif color == "pink" then
            SetVehicleDashboardColour(vehicle, 136)
        else
            if Config.QBNotify == true then
                QBCore.Functions.Notify('CM-Callsign: Invalid Color! Only black, white, red, yellow, pink, and blue are supported.', 'error', 7000)
            else
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {"CM-Callsign", "Invalid Color! Only black, white, red, yellow, pink, and blue are supported."}
                })
            end
        end
    else
        if Config.QBNotify == true then
            QBCore.Functions.Notify('You are not allowed to use this command!', 'error', 7000)
        else
            TriggerEvent('chat:addMessage', {
                color = {255, 0, 0},
                multiline = true,
                args = {"System", "You are not allowed to use this command!"}
            })
        end
    end
end)
