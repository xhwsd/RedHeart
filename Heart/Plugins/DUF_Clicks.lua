function DUF_UnitClick(arg1)
         local unit = this.unit;
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               -- we don't want anything else to happen (eg. target player, show menu, etc)
               return;
            else
                return oldDUF_UnitFrame_OnClick(arg1);
            end
end

function DUF_ElementClick(arg1)
         local unit = this.unit;
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                return oldDUF_Element_OnClick(arg1);
            end
end

function DUF_Clicks_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
end
function DUF_Clicks_OnEvent()
         if (event == "VARIABLES_LOADED") then
            if (IsAddOnLoaded("DiscordUnitFrames")) then
            oldDUF_UnitFrame_OnClick = DUF_UnitFrame_OnClick;
            DUF_UnitFrame_OnClick = DUF_UnitClick;
            oldDUF_Element_OnClick = DUF_Element_OnClick;
            DUF_Element_OnClick = DUF_ElementClick;
            end
         end
end

