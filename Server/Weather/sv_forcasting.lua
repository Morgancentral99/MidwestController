
--Get Random Number 0 to 1
--vars
--Is Warm Enables Rain, thunder Disables, Blizzard, Snowlight, xmas
 isWarm = false;
--isCold Enables Blizzard, SnowLight, xmas Disables Rain, Thunder
 isCold = true;


 TodaysForcastPrimary = "SUNNY";
 TodaysForcastSeconary = "RAIN";
 TodaysForcastSeconaryChance = 50;
 TodayisBlizzard = false;

 TomorrowsForcastPrimary = "SUNNY";
 TomorrowsForcastSecondary = "SUNNY";
 TomorrowsForcastSecondaryChance = 50;
 TomorrowisBlizzard = false;

 ThirdDayForcastPrimary = "Overcast";
 ThirdDayForcastSecondary = "Rain";
 ThirdDayForcastSecondaryChance = 50;
 ThirdDayisBlizzard = false;



--WeatherData









TodayPrimaryWeather = "SUNNY";
TodaySeconaryWeather = "RAIN";
TodaySeconaryWeatherChance = 50;
TodayThirdWeather = "NONE";
isBlizzardToday = false;
-- events

AddEventHandler('sv_forcastNewDay', function()

--New Day
print(TodayPrimaryWeather)
print(TodaySeconaryWeather)
print(TodaySeconaryWeatherChance)
  TodayPrimaryWeather = TomorrowsForcastPrimary;
  TodaySeconaryWeather = TomorrowsForcastSecondary;
  TodaySeconaryWeatherChance = TomorrowsForcastSecondaryChance;
  isBlizzardToday = TomorrowisBlizzard;
  local random = math.random(700);
  print(random)
  if(random >= 50 and random >= 150) then
    TodayThirdWeather = "FOG"


  else
    TodayThirdWeather = "NONE"
  end
  if(TodayThirdWeather == "NONE") then

  end

-- New Tomorrow
TomorrowsForcastPrimary = ThirdDayForcastPrimary;
TomorrowsForcastSecondary = ThirdDayForcastSecondary;
TomorrowsForcastSecondaryChance = ThirdDayForcastSecondaryChance;
TomorrowisBlizzard = ThirdDayisBlizzard;
-- ThirdDayWeather
local WeatherRandom = math.random(2000);

if(WeatherRandom > 300 and WeatherRandom < 400) then
  ThirdDayForcastPrimary = "OVERCAST";
  print("Overcast300-400")
--Overcast
end

--Sunny
if(WeatherRandom > 0 and WeatherRandom < 300) then
  ThirdDayForcastPrimary = "SUNNY";
  print("SUNNY0-300")
--Sunny
end
if(WeatherRandom > 600 and WeatherRandom < 1000) then
  ThirdDayForcastPrimary = "SUNNY";
  print("SUNNY600-1000")
-- Sunny
end
if(WeatherRandom > 1500 and WeatherRandom < 1800) then
  ThirdDayForcastPrimary = "SUNNY";
  print("SUNNY1500-1800")
--Sunny
end

--Secondary
  chance = GetRandomChance(100);
if(WeatherRandom > 770 and WeatherRandom < 850) then

  if isWarm == true then
    ThirdDayForcastSecondary = "RAIN";
    print("Rain770-850")
    ThirdDayForcastSecondaryChance = chance;
  end
  if isCold == true then
    print("Snow770-850")
    ThirdDayForcastSecondary = "SNOW";
    ThirdDayForcastSecondaryChance = chance;
  end
--Rain
--Snowlight


elseif (WeatherRandom > 1000 and WeatherRandom < 1300) then
  if isWarm == true then
    print("Thunderstorm1000-1300")
    ThirdDayForcastSecondary = "THUNDERSTORM";
    ThirdDayForcastSecondaryChance = chance;
  end
 --Thunderstorm


elseif (WeatherRandom > 1300 and WeatherRandom < 1350) then
  if isCold == true then
    print("Blizzard1300-1350")
    ThirdDayisBlizzard = true;
    ThirdDayForcastPrimary = "OVERCAST";
    ThirdDayForcastSecondary = "BLIZZARD";
    ThirdDayForcastSecondaryChance = chance;
  end
--BLIZZARD IF ENABLED
 else
   print("SUNNYELSE")
  ThirdDayForcastSecondary = "SUNNY";
end
print("Primary: " .. ThirdDayForcastPrimary ..  " Secondary: " .. ThirdDayForcastSecondary .. " Chance: " .. ThirdDayForcastSecondaryChance);
--
end)

AddEventHandler('sv_changeTemp', function(i)
  if (i == 0) then
    isWarm = true;
    isCold = false;

  else if(i == 1) then
    isCold = true;
    isWarm = false;
  end
end
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
