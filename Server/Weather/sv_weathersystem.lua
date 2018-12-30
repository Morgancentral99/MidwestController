FullDayOfGTA = 60;
--2800
--Events

--Timers
local WhenWillItStart = 0;
local TimeNow = 0;
local TimeLeftForWeather = 0;
Day = 0


Citizen.CreateThread(function()
print("Started Timer");
  while true do
    Citizen.Wait(1000)
    if(TimeLeftForWeather == 0) then
    WeatherNow = nextWeatherCycle;

  end

    TimeNow = TimeNow + 1;

    print(TimeNow);
    if(TimeNow == FullDayOfGTA) then
      print("A new day has dawned");
    --  TriggerEvent(sv_NewDay, Day);
      TriggerEvent('sv_forcastNewDay')
      Day = Day + 1;
      TimeNow = 0;
    end
end
end)
print("NA");
