# TeamSpeak
gaymadz.fr

# garages v2

garages is a FiveM Module to store or recover your vehicle.

Inspired by vehsop module

## Changelog
You can find our changelog [here](CHANGELOG.md)

## Requirements
- [Essentialmode](https://github.com/FiveM-Scripts/essentialmode)
- [es_freeroam](https://github.com/FiveM-Scripts/es_freeroam)

## Installation
WARNING, this is only if you use vehshop in es_freeroam, if not if you use the standalone version i will not bring help if something shitty happen


1. Download
2. Extract the folder and rename it to garages
3. Add sql.sql to your database.
4. Place the folder in your resources/[folder]
5. Replace vehshop.lua and vehshop_s.lua that are in "resources\[essential]\es_freeroam\stores" whith new ones.
4. Add - garages to your AutoStartResources in citmp-server.yml
5. Open **server.lua** and change your database settings.
6. Restart your server


## Issues
- The vehicle spawn even if there is already a vehicle in the area. <-- Fixed
- The Store does not detect a vehicle in the area and therefore does not store the vehicle in the garage. <-- Fixed

## ToDo
- Fix issus above if there are not already fixed obviously.
- Alert Cops if a player try to store a vehicule that is not the owner.
- Add function that you can store multiple vehicle.
- Add multiple location
