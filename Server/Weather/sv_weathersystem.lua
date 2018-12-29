local TimeInDay = 0;

-- Winter, Spring, Summer, Fall Systems
--Register All Events IN Server Main

--Weather Varibles

local WeatherNow = "Clear";
local weatherTimeLeft = 0;

local nextWeatherCycle = "RAIN"
local whatTimeDoesItStart = 0;
local WhatTimeDoesItEnd = 0;
local doesItGoToNextDay = false;


local timeTillChange = 0;
local WeatherTypeNow = "CLEAR";
local season = "Winter";
local Day = 0;--35 days per seasons
local years = 0;
local FullDayOfGTA = 2800;

--Events


AddEventHandler('MidwestRequestWeatherNow', function()
return WeatherTypeNow;
end)

--Timers
local WhenWillItStart = 0;
local TimeNow = 0;
local TimeLeftForWeather = 0;
Citizen.CreateThread(function()
  while true do
    if(TimeLeftForWeather == 0) then
    WeatherNow = nextWeatherCycle;

  end
  if(whatTimeDoesItStart == TimeNow)

    TimeNow = TimeNow + 1;
    if(TimeNow == FullDayOfGTA) then
      print("A new day has dawned");
      TriggerEvent(sv_NewDay, Day);
      TriggerEvent(sv_forcastNewDay, ...)
      Day = Day + 1;
      timeNow = 0;
    end
  end
end)


--Functions

function GetRandomTimeBetweenTwoRanges (Low, High)
  return math.random(Low, High)
end




function getWeatherFromInt(WeatherInt)
  if WeatherInt == 0 then
    return "CLEAR"
  end
  if WeatherInt == 1 then
    return "EXTRASUNNY"
  end
  if WeatherInt == 2 then
    return "OVERCAST"
  end
  if WeatherInt == 3 then
    return "Rain"
  end
  if WeatherInt == 4 then
       return "CLEARING"
  end
  if WeatherInt == 5 then
    return "THUNDER"
  end
end
