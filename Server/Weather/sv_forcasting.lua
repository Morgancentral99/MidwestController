weatherAllowed = {0 = "EXTRASUNNY"}
--Get Random Number 0 to 1
--vars
--Is Warm Enables Rain, thunder Disables, Blizzard, Snowlight, xmas
 isWarm = false;
--isCold Enables Blizzard, SnowLight, xmas Disables Rain, Thunder
 isCold = true;
Citizen.CreateThread(function()
  weatherAllowed = SeasonsController.returnWeatherTypesAllowed();
end)







--WeatherData









TodayPrimaryWeather = "SUNNY";
TodaySeconaryWeather = "RAIN";
TodaySeconaryWeatherChance = 50;
TodayThirdWeather = "NONE";
isBlizzardToday = false;
-- events

AddEventHandler('sv_forcastNewDay', function()

--New Day
  TodayPrimaryWeather = WeatherData.TomorrowsForcastPrimary;
  TodaySeconaryWeather = WeatherData.TomorrowsForcastSecondary;
  TodaySeconaryWeatherChance = WeatherData.TomorrowsForcastSecondaryChance;
  isBlizzardToday = WeatherData.TomorrowisBlizzard;
  local random = math.random(700);
  if(random <= 50 && random >= 150) then {
    TodayThirdWeather = "FOG"
  end else
    TodayThirdWeather = "NONE"
  end
  if(TodayThirdWeather == "NONE") then

  end
-- New Tomorrow
WeatherData.TomorrowsForcastPrimary = WeatherData.ThirdDayForcastPrimary;
WeatherData.TomorrowsForcastSecondary = WeatherData.ThirdDayForcastSecondary;
WeatherData.TomorrowsForcastSecondaryChance = WeatherData.ThirdDayForcastSecondaryChance;
WeatherData.TomorrowisBlizzard = WeatherData.ThirdDayisBlizzard;
-- ThirdDayWeather
local WeatherRandom = math.random(2000);

if(WeatherRandom <= 300 && WeatherRandom >= 400) then
--Overcast
end

--Sunny
if(WeatherRandom <= 0 && WeatherRandom >= 300) then
--Sunny
end
if(WeatherRandom <= 600 && WeatherRandom >= 1000) then
-- Sunny
end
if(WeatherRandom <= 1500 && WeatherRandom >= 1800) then
--Sunny
end

--Secondary
if(WeatherRandom <= 770 && WeatherRandom >= 850) then
  chance = GetRandomChance(100) / 10;
--Rain
--Snowlight
end

if(WeatherRandom <= 1000 && WeatherRandom >= 1300) then
 --Thunderstorm
end

if(WeatherRandom <= 1300 && WeatherRandom >= 1350) then
--BLIZZARD IF ENABLED
end


end)

AddEventHandler('sv_changeTemp', function(in)
  if (in == 0) then {
    isWarm = true;
    isCold = false;
  }
  if(in == 1) then {
    isCold = true;
    isWarm = false;
  }
end)



--Functions

  function TodaysForcast ()
    -- body...
  end

  function TomorrowsForcast()
    -- body...
  end
  function ThreeDaysFromNow (args)
    -- body...
  end

  function GetRandomChance(i)
    local random = math.random(i)
    return random
  end

--old just leave for now




function DayForcast()
  Server.WeatherForNextDay = "CLEAR"
  Server.WeatherForTodayPercent = 0.0132
  TriggerClientEvent('chatMessage', -1, "Forcast For Tomorrow: ".. WeatherForNextDay)
end


local space = {
    {"CLEAR", 80},
    {"OVERCAST", 10},
    {"RAIN", 5},
    {"THUNDER", 5},
}

function chooseWithChance(args)
     local argCount = #args
     local sumOfChances = 0

     for i = 1, argCount do
         sumOfChances = sumOfChances + args[i]
     end

     local randomDouble = math.random(sumOfChances)

     while (sumOfChances > randomDouble) do
         sumOfChances = sumOfChances - args[argCount]
         argCount = argCount - 1
     end

     return (argCount)
 end

function drawRand()
    local probabilities = {}

    for key,value in pairs(space) do
       probabilites.Add(value)
    end

    return space[chooseWithChance(probabilites)]
end
