if getglobal("Ace") then
   AUF_Clicks = AceAddon:new({
   name          = "AUF_Clicks",
   category      = "Class"
})

function AUF_Clicks:Initialize()
end

function AUF_Clicks:Enable()
         if getglobal("AceUnitFrames") then
            self:Hook(AceUnitFrames, "OnClick", "AUF_Click")
            self.Msg("hooked AUF");
         end
end

function AUF_Clicks:AUF_Click(arg1)
         local unit = this.unit;
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                return self:CallHook(AceUnitFrames,"OnClick", arg1, unit);
            end
end

AUF_Clicks:RegisterForLoad()
end