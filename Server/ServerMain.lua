--Send to Client in FiveM (TriggerEvent('ID:NAME', args))

RegisterNetEvent('Midwest:RequestWeatherNow');
RegisterNetEvent('Midwest:RequestNextWeatherChange')


--Vars that get sent to all clients
local WeatherNow = "CLEAR";






--Syncs

AddEventHandler('sv_updateWeather', function (CurrentWeather)
  WeatherNow = CurrentWeather;
  TriggerEvent('sv_SyncAllToClients', WeatherNow);
end)

AddEventHandler('sv_SyncAllToClients', function (Weather)

  TriggerClientEvent('Midwest:SyncWeather', -1, Weather);
end)
