--Send to Client in FiveM (TriggerEvent('ID:NAME', args))

RegisterNetEvent('Midwest:RequestWeatherNow');
RegisterNetEvent('Midwest:RequestNextWeatherChange')


--Vars that get sent to all clients
local WeatherNow = "CLEAR";

print("logging")
SeasonNow = "SUMMER"
DayNow = 0
MySQL.ready(function()
  MySQL.Async.fetchAll('SELECT `Season`, `ID`, `WeatherCurrently`, `DayNum` FROM weatherseasons', {}, function(result)

  SeasonNow = result[1].Season;
  DayNow = result[1].DayNum;
  print(SeasonNow)
  print(DayNow)
  end)
end)
--Syncs

AddEventHandler('sv_updateWeather', function (CurrentWeather)
  WeatherNow = CurrentWeather;
  --TriggerEvent('sv_SyncAllToClients', WeatherNow);
end)

AddEventHandler('sv_SyncAllToClients', function (Weather)

  --TriggerClientEvent('Midwest:SyncWeather', -1, Weather);
end)
