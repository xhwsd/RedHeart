function Nurfed_Clicks_OnLoad()
         this:RegisterEvent("VARIABLES_LOADED")
end

function Nurfed_Clicks_OnEvent()
         if (event == "VARIABLES_LOADED") then
         oldNurfed_Unit_OnClick = Nurfed_Unit_OnClick;
         Nurfed_Unit_OnClick = Nurfed_Clicks;
         end
end

function Nurfed_Clicks(arg1)
         local unit = this.unit
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                oldNurfed_Unit_OnClick(arg1);
            end
end