if getglobal("Ace") and (getglobal("oUF"))then

oUF_Clicks = AceAddon:new({
        name          = "oUF_Clicks",
	description   = "Heart oUF extension"
})

function oUF_Clicks:Initialize()
end

function oUF_Clicks:Enable()
end

function oUFOnClick(b, u)
         local b,u = arg1, this.unit
         if (Heart_MouseHeal and (Heart_MouseHeal(u, b))) then
               return;
         else
			if ( b == "LeftButton" ) then
				if ( SpellIsTargeting() ) then
					SpellTargetUnit(u)
				elseif ( CursorHasItem() ) then
					if UnitIsUnit(u, "player") then
						AutoEquipCursorItem()
					elseif UnitIsFriend(u, "player") and UnitIsPlayer(u) then
						DropItemOnUnit("target")
					end
				else
					TargetUnit(u)
				end
			elseif b == "RightButton" then
				u = oUF:strcap(u)
				if string.find(u,"Party") then
					ToggleDropDownMenu(1, nil, getglobal("PartyMemberFrame"..this:GetID().."DropDown"), "cursor", 0, 0)
				else
					ToggleDropDownMenu(1, nil, getglobal(u.."FrameDropDown"), "cursor", 0, 0)
				end
			end
        end
end

oUF_Clicks:RegisterForLoad()
end