require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "GTA5", "GTA5", "password")

RegisterServerEvent('garages:CheckForSpawnVeh')
RegisterServerEvent('garages:CheckForVeh')
RegisterServerEvent('garages:SetVehOut')
RegisterServerEvent('garages:SetVehIn')


AddEventHandler('garages:CheckForSpawnVeh', function()
  --print(source)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate', 'vehicle_state'}, "identifier")
    if(result)then
      for k,v in ipairs(result)do
        --print(v.personalvehicle)
        vehicle = v.vehicle_model
        plate = v.vehicle_plate
        state = v.vehicle_state
      local vehicle = vehicle
      local plate = plate
      local state = state
      end
    end
    TriggerClientEvent('garages:SpawnVehicle', source, vehicle, plate, state)
  end)
end)

AddEventHandler('garages:CheckForVeh', function()
  --print(source)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate'}, "identifier")
    if(result)then
      for k,v in ipairs(result)do
        vehicle = v.vehicle_model
        plate = v.vehicle_plate
      local vehicle = vehicle
      local plate = plate
      end
    end
    TriggerClientEvent('garages:StoreVehicle', source, vehicle, plate)
  end)
end)


AddEventHandler('garages:SetVehOut', function(vehicle)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local vehicle = vehicle
    local state = "out"

    MySQL:executeQuery("UPDATE user_vehicle SET vehicle_state='@state' WHERE identifier = '@username' AND vehicle_model = '@vehicle'",
      {['@username'] = player, ['@vehicle'] = vehicle, ['@state'] = state})
  end)
end)

AddEventHandler('garages:SetVehIn', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local plate = plate
    local state = "In"

    MySQL:executeQuery("UPDATE user_vehicle SET vehicle_state='@state' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
  end)
end)
