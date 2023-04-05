
if Config.ProjectSlothCars == true then

RegisterCommand('setcallsign', function(source, args, rawCommand)
    
    TriggerEvent('chat:addSuggestion', '/setcallsign', 'Change The Callsign Color On Your Emergency Vehicle', {
        { name="digit1", help="Callsign Digit 1" },
        { name="digit2", help="Callsign Digit 2" },
        { name="digit3", help="Callsign Digit 3" },
    })

local src = source
local Vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)

local Callsign1 = tonumber(args[1])
local Callsign2 = tonumber(args[2])
local Callsign3 = tonumber(args[3])

SetVehicleModKit(Vehicle, 0)
SetVehicleMod(Vehicle, 28, Callsign1, false)
SetVehicleMod(Vehicle, 29, Callsign2, false)
SetVehicleMod(Vehicle, 30, Callsign3, false)

    end)
end

if Config.CarLabs == true then

    if Config.QBCore ==true then
        RegisterCommand('setcallsign', function(source, args, rawCommand)
        local src = source
        local Vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)

        local dialog = exports['qb-input']:ShowInput({
            header = "Change Emergency Vehicle Callsign",
            submitText = "Change Callsign",
            inputs = {
                {
                    text = "Callsign Digit 1", 
                    name = "callsign1", 
                    type = "number", 
                    isRequired = true,
                },
                {
                    text = "Callsign Digit 2", 
                    name = "callsign2", 
                    type = "number", 
                    isRequired = true,
                },
                {
                    text = "Callsign Digit 3", 
                    name = "callsign3", 
                    type = "number", 
                    isRequired = true,
                },
            },
        })

        SetVehicleModKit(Vehicle, 0)
        SetVehicleMod(Vehicle, 42, dialog.callsign1, false)
        SetVehicleMod(Vehicle, 44, dialog.callsign2, false)
        SetVehicleMod(Vehicle, 45, dialog.callsign3, false)
    end)

    else

    RegisterCommand('setcallsign', function(source, args, rawCommand)
        
        TriggerEvent('chat:addSuggestion', '/setcallsign', 'Change The Callsign Color On Your Emergency Vehicle', {
            { name="digit1", help="Callsign Digit 1" },
            { name="digit2", help="Callsign Digit 2" },
            { name="digit3", help="Callsign Digit 3" },
        })
      
        local src = source
        local Vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)
        
        local Callsign1 = tonumber(args[1])
        local Callsign2 = tonumber(args[2])
        local Callsign3 = tonumber(args[3])
        
        SetVehicleModKit(Vehicle, 0)
        SetVehicleMod(Vehicle, 42, Callsign1, false)
        SetVehicleMod(Vehicle, 44, Callsign2, false)
        SetVehicleMod(Vehicle, 45, Callsign3, false)
        
    end)

    RegisterCommand('setcallsigncolor', function(source, args, rawCommand)
       
        TriggerEvent('chat:addSuggestion', '/setcallsigncolor', 'Change The Callsign Color On Your Emergency Vehicle', {
            { name="color", help="Callsign Color, must be black, white, red, yellow, blue, or pink!" }
        })

        local src = source
        local Vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)
        
        if tostring(args[1]) == "black" then

        local Color = 0
        SetVehicleDashboardColour(Vehicle, Color)

        elseif tostring(args[1]) == "white"then

        local Color = 111
        SetVehicleDashboardColour(Vehicle, Color)

        elseif tostring(args[1]) == "red" then
            
        local Color = 27
        SetVehicleDashboardColour(Vehicle, Color)

        elseif tostring(args[1]) == "yellow" then

        local Color = 88
        SetVehicleDashboardColour(Vehicle, Color)

        elseif tostring(args[1]) == "blue" then

        local Color = 64
        SetVehicleDashboardColour(Vehicle, Color)

        elseif tostring(args[1]) == "pink" then

        local Color = 136
        SetVehicleDashboardColour(Vehicle, Color)

        else

            if Config.QBCore == true then
                local QBCore = exports['qb-core']:GetCoreObject()
                QBCore.Functions.Notify('Invalid Color! Only black, white, red, yellow, pink and blue are supported.', 'error', 7000)
            else
                TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"CM-Callsign", "Invalid Color! Only black, white, red, yellow, pink and blue are supported."}
                })
            end

        end

    end)
end

end