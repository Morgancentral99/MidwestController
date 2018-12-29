--RegisterNetEvent(ID:NAME)
--TriggerServerEvent(ID:NAME)
--Wait Citizen.Wait(msec)

-- Weather Stuff
CurrentWeather = 'CLEAR'
WindSpeed = 0.0
Citizen.CreateThread(function()
  while true do
    if lastWeather ~= CurrentWeather then
    --  lastWeather = CurrentWeather(CurrentWeather, 15.0)
      SetWeatherTypeOverTime(CurrentWeather, 60.00)
      Citizen.Wait(15000)
    end
       ClearOverrideWeather()

    end
    --ClearWeatherTypePersist() -- Ensure no persistant weather

end)


local lastWeather = CurrentWeather
RegisterNetEvent('Midwest:RequestUpdate')
RegisterNetEvent('Midwest:RequestWeatherUpdate')
AddEventHandler('Midwest:RequestWeatherUpdate', function(NewWeather, WindSpeed)
  CurrentWeather = NewWeather
  SetWind(0.0)
  WindSpeed = WindSpeed
  SetWindDirection(1.0)
  SetWindSpeed(WindSpeed)
end)

AddEventHandler('Midwest:RequestUpdate', function()
  NewWeather = TriggerServerEvent('Midwest:RequestWeather')
  CurrentWeather = NewWeather
end)
