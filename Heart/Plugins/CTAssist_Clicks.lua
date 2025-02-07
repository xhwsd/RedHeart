function CT_AssistFrame_Clicks(arg1)
            if (Heart_MouseHeal and (Heart_MouseHeal("targettarget", arg1))) then
               return;
            else
                return oldCT_AssistFrame_OnClick(arg1);
            end
end

function CT_Assist_Clicks_OnLoad()
	this:RegisterEvent('VARIABLES_LOADED');
end
function CT_Assist_Clicks_OnEvent()
         if (event == "VARIABLES_LOADED") then
            if getglobal("CT_AssistFrame") then
               oldCT_AssistFrame_OnClick = CT_AssistFrame_OnClick;
               CT_AssistFrame_OnClick = CT_AssistFrame_Clicks;
            end
         end      
end