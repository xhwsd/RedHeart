function EzR_Click()
	local unit = this.unit or this:GetParent().unit;
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                oldER_RaidPulloutButton_OnClick();
            end
end

function EzR_MT_Click()
         local unit = this.unit or this:GetParent().unit;
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                oldER_MainTankButton_OnClick();
            end
end

function EzR_Clicks_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
end

function EzR_Clicks_OnEvent()
         if (event == "VARIABLES_LOADED") then
            if (IsAddOnLoaded("EasyRaid")) then
               oldER_RaidPulloutButton_OnClick = ER_RaidPulloutButton_OnClick;
               ER_RaidPulloutButton_OnClick = EzR_Click;
               oldER_MainTankButton_OnClick = ER_MainTankButton_OnClick;
               ER_MainTankButton_OnClick = EzR_MT_Click;
             end
          end     
end