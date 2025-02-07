if getglobal("Ace") and (getglobal("oRA_MainTankFrames"))then
   oRa_Clicks = AceAddon:new({
   name          = "oRa_Clicks",
   category      = "Class"
})

function oRa_Clicks:Initialize()
end

function oRa_Clicks:Enable()
end

function oRA_MainTankFramesCustomClick(arg1, unit)
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                if (arg1 == "LeftButton") then
                   TargetUnit(unit.."target")
                elseif (arg1 == "RightButton") then
                       TargetUnit(unit)
                end
            end
end

oRa_Clicks:RegisterForLoad()
end