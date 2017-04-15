require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "GTA5", "GTA5", "password")

RegisterServerEvent('garages:CheckForVeh')
AddEventHandler('garages:CheckForVeh', function()
  --print(source)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT personalvehicle FROM users WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'personalvehicle'}, "identifier")
    if(result)then
      for k,v in ipairs(result)do
        --print(v.personalvehicle)
        vehicle = v.personalvehicle
      local vehicle = vehicle
      end
    end
    TriggerClientEvent('garages:SpawnVehicle', source, vehicle)
  end)
end)

RegisterServerEvent('garages:GetForVeh')

AddEventHandler('garages:GetForVeh', function(vehicle)
  --to vérifier le si le véhicule a mettre dans le garage est celui qui est possédé
end)
