require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "GTA5", "GTA5", "pass")

RegisterServerEvent('garages:CheckForVeh')
AddEventHandler('garages:CheckForVeh', function(vehicle)
  --local joueur = "1"
  --print("Player ID " ..source)
	--TriggerEvent('es:getPlayerFromId', source, function(user)

  --print(source)
  --print(user)

  local player = source
  local executed_query = MySQL:executeQuery("SELECT personalvehicle FROM users WHERE id = '@username'",{['@username'] = source})
  local result = MySQL:getResults(executed_query, {'personalvehicle'})

        if(result)then
    for k,v in ipairs(result)do
      print(v.personalvehicle)
      vehicle = v.personalvehicle
    end
    end
  local vehicle = vehicle
  TriggerClientEvent('garages:SpawnVehicle', source, vehicle)

end)

RegisterServerEvent('garages:GetForVeh')
AddEventHandler('garages:GetForVeh', function(vehicle)

end)
