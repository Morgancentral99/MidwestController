--Register Net Events
RegisterNetEvent('Midwest:SyncWeather')
--Event Handlers
AddEventHandler('Midwest:SyncWeather', function(WeatherNow, WindSpeed)
SetWeatherTypeNow(WeatherNow)
SetWind(0.0)
SetWindDirection(1.0)
end)
