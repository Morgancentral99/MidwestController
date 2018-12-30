local seasons = {0 = "WINTER", 1 = "SPRING", 2 = "SUMMER", 3 = "FALL"}

local whatSeasonIsItNow = "WINTER";
local whatSeasonIsItNowID = 0;
local daysPerSeason = 1;--17 is half
--Is Warm Enables Rain, thunder Disables, Blizzard, Snowlight, xmas
 isWarm = false;
--isCold Enables Blizzard, SnowLight, xmas Disables Rain, Thunder
 isCold = true;
 day = 0;

AddEventHandler("sv_NewDay", function(DayNum)
  day = DayNum;
  if whatSeasonIsItNow == "SPRING" then
    if day == 17 then
      isCold = false;
      isWarm = true;
      TriggerEvent(sv_changeTemp, "0");
    end
  end
  if whatSeasonIsItNow == "FALL" then
    if day == 17 then
      isCold = true;
      isWarm = false;
      TriggerEvent(sv_changeTemp, "1");
    end
  end

  if(day == daysPerSeason) then {
    if(whatSeasonIsItNowID == 0) then {
      whatSeasonIsItNow = "SPRING";
      whatSeasonIsItNowID = 1;
    }
    if(whatSeasonIsItNowID == 1) then {
      whatSeasonIsItNow = "SUMMER";
      whatSeasonIsItNowID = 2;
    }
    if(whatSeasonIsItNowID == 2) then {
      whatSeasonIsItNow = "FALL";
      whatSeasonIsItNowID = 3;
    }
    if(whatSeasonIsItNowID == 3) then {
      whatSeasonIsItNow = "WINTER";
      whatSeasonIsItNowID = 0;
    }
    print("Season " .. whatSeasonIsItNow .. " and the day is: " .. day .. "!")
    MySQL.Async.execute("UPDATE `weatherseasons` SET `Season`=@Season, `DayNum`=@Day WHERE ID = 0;", {['@Season'] = whatSeasonIsItNow, ['@Day'] = day});
  }

end)

function returnWeatherTypesAllowed()
  if isWarm == true
  return {0 = "EXTRASUNNY",1 = "CLEAR", 2 = "NEUTRAL", 3 = "SMOG", 4 = "FOGGY", 5 = "OVERCAST", 6 = "CLEARING", 7 = "RAIN", 8 = "THUNDER"}
  end
  if isCold == true
  return {0 = "EXTRASUNNY",1 = "CLEAR", 2 = "NEUTRAL", 3 = "SMOG", 4 = "FOGGY", 5 = "OVERCAST", 6 = "CLEARING", 7 = "SNOWLIGHT", 8 = "BLIZZARD"}
  end
end



--Available types: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween
