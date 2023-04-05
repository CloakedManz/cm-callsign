
RegisterCommand('setcallsign', function(source, args, rawCommand)
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



--[[ W.I.P ------------------------

RegisterCommand('setcallsignblack', function(source, args, rawCommand)
    local src = source
    local Vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)
    
    local Color = 0
        
    SetVehicleDashboardColour(Vehicle, Color)
    
end)

RegisterCommand('setcallsignwhite', function(source, args, rawCommand)
    local src = source
    local Vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)
    
    local Color = 111

    SetVehicleInteriorColour(Vehicle, Color)

    print(GetVehicleInteriorColour(Vehicle))
    
end)

W.I.P --------------------------]]
