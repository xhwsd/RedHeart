if getglobal("Ace") and (getglobal("MiniGroup2"))then
               MG2_Clicks = AceAddon:new({
	       name          = "MG2_Clicks" ,
	       description   = "Heart MiniGroup extension"
})
function MG2_Clicks:Initialize()
end

function MG2_Clicks:Enable()
	if getglobal("MiniGroup2") then
		self:Hook(MiniGroup2,"MemberOnMouseDown","MG2MouseDown")
		self:Hook(MiniGroup2,"MemberOnClick","MG2Click")
		self:Hook(MiniGroup2,"MemberOnMouseUp","MG2MouseUp")
	end
end

local MG2ClickTime = 0
local MG2HoldTime = nil

function MG2_Clicks:MG2Check(arg1)
	if (not MG2HoldTime) then
		MG2HoldTime = GetTime() - MG2ClickTime
	end
	if (MG2HoldTime > 0.75) then
		if not (MiniGroup2.GetOpt("LockMGFrames")) then return nil end
	end

	if (MiniGroup2.GetOpt("CastPartyEnabled") == 0) then return nil end
	if (this:GetName() == "MGtarget" and MiniGroup2.GetOpt("CastPartyTargetEnabled") == 0) then return nil end
	local CastPartyOverrideMouse = { 
		[1] = "LeftButton",
		[2] = "RightButton",
		[3] = "MiddleButton",
		[4] = "CastPartySetting",
	}
	if (CastPartyOverrideMouse[MiniGroup2.GetOpt("CastPartyOverrideMouse")] == arg1) then
		local shift, ctrl, alt = 0, 0, 0
		if ( IsShiftKeyDown() )   then shift = 1 end
		if ( IsControlKeyDown() ) then ctrl  = 1 end
		if ( IsAltKeyDown() )     then alt   = 1 end

		if ( MiniGroup2.GetOpt("CastPartyOverrideShift") == shift
		and  MiniGroup2.GetOpt("CastPartyOverrideCtrl")  == ctrl
		and  MiniGroup2.GetOpt("CastPartyOverrideAlt")   == alt   ) then
			return nil
		end
	else
	end
	local unit = string.sub(this:GetName(),3)
	if (unit and UnitExists(unit)) then return unit end
	return nil
end

function MG2_Clicks:MG2MouseDown(arg1)
	MG2ClickTime = GetTime()
	MG2HoldTime = nil
	return self:CallHook(MiniGroup2, "MemberOnMouseDown", arg1)
end

function MG2_Clicks:MG2Click(arg1)
	local unit = self:MG2Check(arg1)
	if (unit) then
              if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
                 return;
              else
                  if arg1 == "LeftButton" then
                     return MiniGroup2:LeftClick()
                  elseif arg1 == "RightButton" then
                         return MiniGroup2:RightClick()
                  end
              end
	else
		return self:CallHook(MiniGroup2, "MemberOnClick", arg1)
	end
end

function MG2_Clicks:MG2MouseUp(arg1)
	local unit = self:MG2Check(arg1)
	if (unit) then
		if this.GroupStart then
			this.GroupStart:StopMovingOrSizing()
		end
		this:StopMovingOrSizing()
	else
		return self:CallHook(MiniGroup2, "MemberOnMouseUp", arg1)
	end
end

MG2_Clicks:RegisterForLoad()
end