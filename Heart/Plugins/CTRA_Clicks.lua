function CTRA_Clicks_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
end

function CT_RA_EmergencyClick()
            if (Heart_MouseHeal and (Heart_MouseHeal(this.unitid, arg1))) then
               return;
            else
                return oldCT_RA_EmergencyClick(arg1, this.unitid);
            end
end

function CT_RA_FrameClick(button, raidid)
            if (Heart_MouseHeal and (Heart_MouseHeal(raidid, button))) then
               return true
            else
                return
            end
end

function CTRA_Clicks_OnEvent()
         if (event == "VARIABLES_LOADED")then
		 CT_RA_CustomOnClickFunction = CT_RA_FrameClick
		 if (IsAddOnLoaded("CT_RaidAssist")) then
			 oldCT_RA_EmergencyClick = CT_RA_EmergencyFrameFrame1ClickFrame:GetScript("OnClick");
			 for i = 1, 5, 1 do
				 local eframe = getglobal("CT_RA_EmergencyFrameFrame"..i.."ClickFrame")
				 eframe:SetScript("OnClick", function() CT_RA_EmergencyClick() end);
			 end

               

		 end
		 if (IsAddOnLoaded("sRaidFrames")) then
			 sRaidFramesCustomOnClickFunction = CT_RA_FrameClick
		 end
		 if (IsAddOnLoaded("PerfectRaid")) then
			 PerfectRaidCustomClick = CT_RA_FrameClick
		 end
	 end
end
