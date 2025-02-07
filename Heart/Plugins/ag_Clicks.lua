if IsAddOnLoaded("ag_UnitFrames") then

function aUF:Heart_Click(button)
            if (Heart_MouseHeal and (Heart_MouseHeal(self.unit, button))) then
               return;
            else
                return aUF.units[string.gsub(this:GetName(),"aUF","")]:OnClickOld(button)
            end
end

aUF.classes.aUFunit.prototype.OnClickOld = aUF.classes.aUFunit.prototype.OnClick
aUF.classes.aUFunit.prototype.OnClick = aUF.Heart_Click
C_Print("ag_UnitFrames hooked")

end
