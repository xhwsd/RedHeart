--   ###############
--  # GUI Related #
-- #  Functions  #
--###############

function Heart_ProfileDropDownMenuButton_OnClick()
	local profile = this:GetText()
	   Heart_Load_Profile(profile)
           Heart_ProfileDropDownMenuUpdate(profile)
	   C_Print("Profile \"" .. profile .. "\" loaded.")
end

function Heart_ProfileDropDownMenuInitialize()
	local info
	if (not Heart_SavedProfiles) then
		Heart_SavedProfiles = {}
	end
	local profiles = 0
	for profile,data in Heart_SavedProfiles do
		profiles = profiles + 1
	end
	if (profiles == 0) then
		info = {
			["text"] = "None",
			["func"] = nil
		}
		UIDropDownMenu_AddButton(info)
	end
	for profile,data in Heart_SavedProfiles do
		info = {
			["text"] = profile,
			["func"] = Heart_ProfileDropDownMenuButton_OnClick
		}
		UIDropDownMenu_AddButton(info)
	end

	Heart_ProfileDropDownMenuUpdate(Heart_current_profile)
end

function Heart_ProfileDropDownMenuUpdate(profile)
	Heart_current_profile = profile
        UIDropDownMenu_SetSelectedName(Heart_GUIProfileDropDownMenu, profile)
end

function Heart_ClassDropDownMenuButton_OnClick()
	local class = this:GetText()
	Heart_ClassDropDownMenuUpdate(class)
end

function Heart_ClassDropDownMenuInitialize()
	if (not Heart_Spells) then
		Heart_UpdateSpells()
	end

	local info
	if (not Heart_Config["classes"]) then
		Heart_Config["classes"] = {}
	end

	local classes = 0
	for class, data in Heart_Config["classes"] do
		classes = classes + 1
	end
	if (classes == 0) then
		Heart_Config["classes"]["standard"] = {}
	end



	local show
        for class, data in Heart_Config["classes"] do
		info = {
			["text"] = class,
			["func"] = Heart_ClassDropDownMenuButton_OnClick
		}
		UIDropDownMenu_AddButton(info)
		if (not show) then
                   show = class
		end
	end
	Heart_ClassDropDownMenuUpdate(Heart_current_class or show)
end

function Heart_ClassDropDownMenuUpdate(class)
        Heart_current_class = class
	local counter = 1
	UIDropDownMenu_SetSelectedName(Heart_GUIClassDropDownMenu, class)
	counter = 1
	local sorted = {}
	for percent, data in Heart_Config["classes"][class] do
			sorted[counter] = percent
			counter = counter + 1
	end
	table.sort(sorted, function(a, b) return a > b end)
	local taken = {}
	for percent, data in Heart_Config["classes"][class] do
	        local spell = data["Spell"]
	        local attachment = data["Attachment"]
	        local maxrank = table.getn(Heart_Spells[spell])
		if (Heart_Spells ) then
			local slot = 1
			for a = 1, counter do
				if (sorted[a] == percent and not taken[a]) then
					slot = a
					taken[a] = 1
					a = counter
				end
			end
			getglobal("Heart_GUIClass" .. slot):Hide()
			getglobal("Heart_GUIClass" .. slot .. "SpellTexture"):SetTexture(Heart_Spells[spell]["Texture"])
			if data["Attachment"] then
			getglobal("Heart_GUIClass" .. slot .. "SpellAttachmentTexture"):SetTexture(Heart_Spells[attachment]["Texture"])
			else
                        getglobal("Heart_GUIClass" .. slot .. "SpellAttachmentTexture"):SetTexture()
			end
			getglobal("Heart_GUIClass" .. slot .. "SpellText"):SetText(spell)
			getglobal("Heart_GUIClass" .. slot .. "SpellPercent"):SetText(percent.."%")
			getglobal("Heart_GUIClass" .. slot):Show()
			getglobal("Heart_GUIClass" .. slot .. "RankSlider"):SetMinMaxValues(1, maxrank)
			getglobal("Heart_GUIClass" .. slot .. "RankSlider"):SetValue(data["Rank"])
			getglobal("Heart_GUIClass" .. slot .. "RankSliderHigh"):SetText(data["Rank"])
			getglobal("Heart_GUIClass" .. slot .. "ScaleCheckBox"):SetChecked(data["Scale"])
		end
	end
	for counter = counter, 7 do
		getglobal("Heart_GUIClass" .. counter):Hide()
	end
end

function Heart_MouseDropDownMenuButton_OnClick(arg1)
	local start, stop, button = string.find(arg1:GetName(), "^Heart_GUI(.+)DropDownMenu$")
	button = string.lower(button)
	local id = this:GetID()
	local class = this:GetText()
	local slider = getglobal(string.gsub(arg1:GetName(), "DropDownMenu$", "") .. "RankSlider")
	if (not Heart_Config["mouse"]) then
		Heart_Config["mouse"] = {}
	end
	if (class == "none") then
		Heart_Config["mouse"][button] = nil
		slider:Hide()
	else
		Heart_Config["mouse"][button] = {
			["SpellOrClass"] = class,
			["Rank"] = 1
		}
		if (Heart_Spells[class]) then
			slider.variable = "Heart_Config[\"mouse\"][" .. button .. "][\"Rank\"]"
			slider:SetMinMaxValues(1, table.getn(Heart_Spells[class]))
			slider:SetValue(table.getn(Heart_Spells[class]))
			slider:Show()
		else
			slider:Hide()
		end
	end
	UIDropDownMenu_SetSelectedID(arg1, id)
end

function Heart_MouseDropDownMenuInitialize()
	if (not Heart_Spells) then
		Heart_UpdateSpells()
	end
	local dropdownmenu = getglobal(this:GetParent():GetName())
	local info
	info = {
		["text"] = "none",
		["func"] = Heart_MouseDropDownMenuButton_OnClick,
		["arg1"] = dropdownmenu
	}
	UIDropDownMenu_AddButton(info)
	if (not Heart_Config["classes"]) then
		Heart_Config["classes"] = {}
	end
	local classes = 0
	for class, data in Heart_Config["classes"] do
		classes = classes + 1
	end
	if (classes == 0) then
		Heart_Config["classes"]["standard"] = {}
	end
	for class, data in Heart_Config["classes"] do
		info = {
			["text"] = class,
			["func"] = Heart_MouseDropDownMenuButton_OnClick,
			["arg1"] = dropdownmenu
		}
		UIDropDownMenu_AddButton(info)
	end
	for spell, data in Heart_Spells do
		if (Heart_player_heal_spells[spell]) then
			info = {
				["text"] = spell,
				["func"] = Heart_MouseDropDownMenuButton_OnClick,
				["arg1"] = dropdownmenu
			}
			UIDropDownMenu_AddButton(info)
		end
	end
	local me = getglobal(string.gsub(this:GetName(), "Button$", ""))
	local start, stop, button = string.find(dropdownmenu:GetName(), "^Heart_GUI(.+)$")
	button = string.gsub(button, "DropDownMenu$", "")
	local slider = getglobal("Heart_GUI" .. button .. "RankSlider")
	button = string.lower(button)
	if (Heart_Config["mouse"][button] and Heart_Config["mouse"][button]["SpellOrClass"]) then
		UIDropDownMenu_SetSelectedName(me, Heart_Config["mouse"][button]["SpellOrClass"])
		if (Heart_Spells[Heart_Config["mouse"][button]["SpellOrClass"]]) then
			slider.variable = "Heart_Config[\"mouse\"][" .. button .. "][\"Rank\"]"
			slider:SetMinMaxValues(1, table.getn(Heart_Spells[Heart_Config["mouse"][button]["SpellOrClass"]]))
			slider:SetValue(Heart_Config["mouse"][button]["Rank"])
			slider:Show()
		else
			slider:Hide()
		end
	else
		UIDropDownMenu_SetSelectedID(me, 1)
		slider:Hide()
	end
end
      
function Heart_SpellSelect_OnClick(spell)
         local counter = 0
         for percent,data in Heart_Config["classes"][Heart_current_class] do
             counter = counter + 1 
         end
         if ( counter < 7 ) then
            Heart_SpellSelectPopUpFrameSpellText:SetText(spell)
            Heart_SpellSelectPopUpFrame:Show()
         end
end

function Heart_TankButton_OnClick(arg1)
           if arg1 == "LeftButton" then
	        local aka = nil
	        if (UnitExists("target") and UnitIsFriend("player", "target")) then
                   aka = C_AKA("target")
                end
		if (aka) then
		   if ( aka ~= "target" or UnitIsUnit("player", aka)) then
			Heart_Tank = {
				["Unit"] = aka,
				["Name"] = C_UnitName(aka)
			}
			C_Print("Will only heal (" ..aka.."): ".. Heart_Tank["Name"])
                   else
                        C_Print("Tank Units must be in your Raid or Party: " .. C_UnitName(aka) .. " is not")
                        if (Heart_Tank and Heart_Tank["Name"]) then
                               C_Print("Current tank remains (" ..Heart_Tank["Unit"].."): ".. Heart_Tank["Name"])
                        else
                               C_Print("No dedicated healing")
                        end
                   end
		else
			if (Heart_Tank and Heart_Tank["Name"]) then
				C_Print("Will no longer only heal " .. Heart_Tank["Name"])
                         else
				C_Print("No dedicated healing")
			end
			Heart_Tank = {
				["Unit"] = nil,
				["Name"] = nil
			}
                end
           elseif arg1 == "RightButton" then
	        if (Heart_Tank and Heart_Tank["Name"]) then
                      C_Print("Will no longer only heal " .. Heart_Tank["Name"])
	        else
                      C_Print("No dedicated healing")
	        end
	        Heart_Tank = {
                      ["Unit"] = nil,
                      ["Name"] = nil
                      }
	   end
end

function Heart_RezButton_OnClick()
      if Heart_Config["rez_spell"] then
           local channel = Heart_Config["rez_message_channel"]
           if UnitExists("target") and Heart_CanRez("target") then
               local target = C_AKA("target")
               Heart_Heal(target, Heart_Config["rez_spell"], Heart_Config["rez_rank"])
               local msg = string.gsub(Heart_Config["rez_message"], '$t', C_UnitName(target))
               if (channel ~="NONE") then
                  if channel == "RAID" and (GetNumRaidMembers() <= 0) then
                     channel = "PARTY"
                  end
                  SendChatMessage(msg, channel)
                  return
               end
           else
               for player, data in Heart_awaiting_rez do
                   if (data["is_dead"] and (not data["waiting_time"]) and (not Heart_GetOtherRezing(player))) then
                      local msg = string.gsub(Heart_Config["rez_message"], '$t', C_UnitName(player))
                      if Heart_Heal(player, Heart_Config["rez_spell"], Heart_Config["rez_rank"]) then
                         if (channel ~="NONE") then
                            if channel == "RAID" and (GetNumRaidMembers() <= 0) then
                               channel = "PARTY"
                            end
                               SendChatMessage(msg, channel)
                         end
                         Heart_awaiting_rez[player]["status"] = "start"
                         Heart_awaiting_rez[player]["cast"] = nil
                         return
                      end
                   end
               end
               CastSpell(Heart_Spells[Heart_Config["rez_spell"]][Heart_Config["rez_rank"]]["ID"], BOOKTYPE_SPELL)
           end
      end
end

function Heart_ClassClick_OnClick(arg1)
           local class = this:GetText()
           if arg1 == "LeftButton" then
              Heart_ActionHeal(class)
           elseif arg1 == "RightButton" then
                  Heart_HealMostWounded(class)
           end
end

function Heart_SetRaidChecked()
	-- set which groups/units should be checked in the gui
	Heart_temp_table = (Heart_temp_table or {})
	for group = 1, 8 do
		Heart_temp_table[group] = 1
	end
	for raidindex = 1, GetNumRaidMembers() do
		local name, rank, group, level, class, filename = GetRaidRosterInfo(raidindex)
		local slot = Heart_temp_table[group]
		Heart_raid_cache[name] = slot
		Heart_temp_table[group] = Heart_temp_table[group] + 1
		if (Heart_GUIRaid:IsVisible()) then
			getglobal("Heart_GUIRaidGroup" .. group .. "Slot" .. slot .. "CheckButton"):SetChecked(Heart_Config["raid"][group][slot])
			getglobal("Heart_GUIRaidGroup" .. group .. "Slot" .. slot .. "Name"):SetText(name)
			getglobal("Heart_GUIRaidGroup" .. group .. "Slot" .. slot .. "Name"):SetTextColor(RAID_CLASS_COLORS[filename].r, RAID_CLASS_COLORS[filename].g, RAID_CLASS_COLORS[filename].b)
		end
	end
	-- empty the remaining slots
	if (Heart_GUIRaid:IsVisible()) then
		for group = 1, 8 do
			for slot = Heart_temp_table[group], 5 do
				getglobal("Heart_GUIRaidGroup" .. group .. "Slot" .. slot .. "CheckButton"):SetChecked(Heart_Config["raid"][group][slot])
				getglobal("Heart_GUIRaidGroup" .. group .. "Slot" .. slot .. "Name"):SetText(EMPTY)
				getglobal("Heart_GUIRaidGroup" .. group .. "Slot" .. slot .. "Name"):SetTextColor(0.3, 0.3, 0.3)
			end
		end
	end
end

function Heart_ShowTooltip()
	C_ClearTooltip()
	local title, description
	if ((this:GetName() == "Heart_GUIPaladinPriestPrioritySlider") or (this:GetName() == "Heart_GUIPaladinPriestPriorityRez")) then
		if (UnitFactionGroup("player") == C_Alliance) then
			title = Heart_GUI_help["PaladinPriority"]["Title"]
			description = Heart_GUI_help["PaladinPriority"]["Description"]
		else
			title = Heart_GUI_help["PriestPriority"]["Title"]
			description = Heart_GUI_help["PriestPriority"]["Description"]
		end
	elseif ((this:GetName() == "Heart_GUIPriestRoguePrioritySlider") or (this:GetName() == "Heart_GUIPriestRoguePriorityRez")) then
		if (UnitFactionGroup("player") == C_Alliance) then
			title = Heart_GUI_help["PriestPriority"]["Title"]
			description = Heart_GUI_help["PriestPriority"]["Description"]
		else
			title = Heart_GUI_help["RoguePriority"]["Title"]
			description = Heart_GUI_help["RoguePriority"]["Description"]
		end
	elseif ((this:GetName() == "Heart_GUIRogueShamanPrioritySlider")or (this:GetName() == "Heart_GUIRogueShamanPriorityRez")) then
		if (UnitFactionGroup("player") == C_Alliance) then
			title = Heart_GUI_help["RoguePriority"]["Title"]
			description = Heart_GUI_help["RoguePriority"]["Description"]
		else
			title = Heart_GUI_help["ShamanPriority"]["Title"]
			description = Heart_GUI_help["ShamanPriority"]["Description"]
		end
	elseif (this:GetName() == "Heart_GUIShowHealing") then
	        if (not Heart_supported_classes[C_my_class]) then
			title = Heart_GUI_help["ShowHealingMe"]["Title"]
			description = Heart_GUI_help["ShowHealingMe"]["Description"]
		else
			title = Heart_GUI_help["ShowHealingAll"]["Title"]
			description = Heart_GUI_help["ShowHealingAll"]["Description"]
		end
	elseif (string.find(this:GetName(), "Heart_GUISpellSelect%dSpell")) then
	                local spelltext = getglobal((this:GetName()).."Text"):GetText()
			title = spelltext
			if (Heart_attachment_spells[spelltext]) then
                            description = Heart_GUI_help["Heart_GUISpellSelect%dAttachment"]["Description"]
                        else
			    description = Heart_GUI_help["Heart_GUISpellSelect%dSpell"]["Description"]
                        end
	elseif (string.find(this:GetName(), "TankButton")) then
	               title = Heart_GUI_help["TankButton"]["Title"]..(Heart_Tank["Name"] or "None")
                       description = Heart_GUI_help["TankButton"]["Description"]
                       
	else
		local length = 0
		for element, data in Heart_GUI_help do
			if (string.find(this:GetName(), element) and string.len(element) > length) then
				title = data["Title"]
				description = data["Description"]
				length = string.len(element)
			end
		end
	end

	if (title and description) then
	        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
		GameTooltip:SetText(title, 0.9, 0.9, 0.9, 1.0, 1)
		GameTooltip:AddLine(description, nil, nil, nil, 1)
		GameTooltip:Show()
	end
end

function Heart_UpdateHealCurrent(elapsed)
	local healingtarget = Heart_i_am_healing
	if (not healingtarget or not Heart_healing[healingtarget] or not Heart_healing[healingtarget][C_my_name]) then
		return
	end
	local unit = C_GetUnitID(healingtarget)
	elapsed = (elapsed or 0)
	local timeleft = Heart_healing[healingtarget][C_my_name]["TimeLeft"] - elapsed
	if (not unit) then
		-- we're healing target, but changed to another target
		-- we don't know how much hp the target currently got
		-- getting blueballed, so color everything likewise
		Heart_GUIHealCurrentSpell:SetValue(Heart_healing[healingtarget][C_my_name]["CastTime"] - timeleft)
		Heart_GUIHealCurrentSpellBarTexture:SetVertexColor(0.0, 0.0, 1.0, 0.5)
		Heart_GUIHealCurrentTargetBarTexture:SetVertexColor(0.0, 0.0, 1.0, 0.5)
		Heart_GUIHealCurrentAfterBarTexture:SetVertexColor(0.0, 0.0, 1.0, 0.5)
		Heart_GUIHealCurrentOverhealBarTexture:SetVertexColor(0.0, 0.0, 1.0, 0.5)
	elseif (unit) then
		Heart_GUIHealCurrentTargetText:SetText(healingtarget .. " (" .. math.floor(UnitHealth(unit) / UnitHealthMax(unit) * 1000) / 10 .. "%)")
		local afterhp = UnitHealth(unit) + Heart_healing[healingtarget][C_my_name]["Heal"] + Heart_healing[healingtarget][C_my_name]["HealingOverTime"]
		if (UnitHealthMax(unit) == 100) then
			-- apparently healing some unit we don't know the real health of (outside raid?). convert the hp restored to percent for this class
			afterhp = UnitHealth(unit) + (Heart_healing[healingtarget][C_my_name]["Heal"] + Heart_healing[healingtarget][C_my_name]["HealingOverTime"]) / (UnitLevel(unit) * Heart_class_hp_per_level[UnitClass(unit)] / 100)
		end
		if (afterhp > UnitHealthMax(unit)) then
			afterhp = UnitHealthMax(unit)
		end
		Heart_GUIHealCurrentSpell:SetMinMaxValues(0, Heart_healing[healingtarget][C_my_name]["CastTime"])
		Heart_GUIHealCurrentTarget:SetMinMaxValues(0, UnitHealthMax(unit))
		Heart_GUIHealCurrentAfter:SetMinMaxValues(0, UnitHealthMax(unit))
		Heart_GUIHealCurrentSpell:SetValue(Heart_healing[healingtarget][C_my_name]["CastTime"] - timeleft)
		Heart_GUIHealCurrentTarget:SetValue(UnitHealth(unit))
		if (not Heart_healing[healingtarget][C_my_name]["Complete"]) then
			-- we don't want to update these bars when the spell is finished (heal would be applied "twice")
			Heart_GUIHealCurrentAfterText:SetText("After heal (" .. math.floor(afterhp / UnitHealthMax(unit) * 1000) / 10 .. "%)")
			Heart_GUIHealCurrentAfter:SetValue(afterhp)
			local overheal = Heart_GetOverheal()
			Heart_GUIHealCurrentOverhealText:SetText("Overheal (" .. math.floor(overheal * 1000) / 10 .. "%)")
			Heart_GUIHealCurrentOverheal:SetValue(overheal)
			if (overheal > Heart_Config["max_overheal"]) then
				-- overhealing
				if (GetSpellCooldown(Heart_Spells[Heart_healing[healingtarget][C_my_name]["Spell"]][Heart_healing[healingtarget][C_my_name]["Rank"]]["ID"], BOOKTYPE_SPELL) ~= 0) then
					-- still cooldown, show yellow color
					Heart_GUIHealCurrentSpellBarTexture:SetVertexColor(1.0, 0.7, 0.0, 0.5)
					Heart_GUIHealCurrentTargetBarTexture:SetVertexColor(1.0, 0.7, 0.0, 0.5)
					Heart_GUIHealCurrentAfterBarTexture:SetVertexColor(1.0, 0.7, 0.0, 0.5)
					Heart_GUIHealCurrentOverhealBarTexture:SetVertexColor(1.0, 0.7, 0.0, 0.5)
				else
					-- no cooldown, show red color
					Heart_GUIHealCurrentSpellBarTexture:SetVertexColor(1.0, 0.0, 0.0, 0.5)
					Heart_GUIHealCurrentTargetBarTexture:SetVertexColor(1.0, 0.0, 0.0, 0.5)
					Heart_GUIHealCurrentAfterBarTexture:SetVertexColor(1.0, 0.0, 0.0, 0.5)
					Heart_GUIHealCurrentOverhealBarTexture:SetVertexColor(1.0, 0.0, 0.0, 0.5)
				end
			else
				Heart_GUIHealCurrentSpellBarTexture:SetVertexColor(0.0, 1.0, 0.0, 0.5)
				Heart_GUIHealCurrentTargetBarTexture:SetVertexColor(0.0, 1.0, 0.0, 0.5)
				Heart_GUIHealCurrentAfterBarTexture:SetVertexColor(0.0, 1.0, 0.0, 0.5)
				Heart_GUIHealCurrentOverhealBarTexture:SetVertexColor(0.0, 1.0, 0.0, 0.5)
			end
		end
	end
	if (not Heart_GUI:IsVisible()) then
		if (timeleft <= -3) then
			Heart_GUIHealCurrent:Hide()
		elseif (timeleft <= -2) then
			Heart_GUIHealCurrent:SetAlpha(3 + timeleft)
		end
	end
end

function Heart_UpdateHealing(elapsed)
	-- update the data about everyone's healing
	for who, data in Heart_healing do
		for author, moredata in Heart_healing[who] do
			Heart_healing[who][author]["TimeLeft"] = moredata["TimeLeft"] - elapsed;
			local bar;
			if (Heart_healing[who][author]["Bar"]) then
				bar = getglobal("Heart_GUIHealBars" .. moredata["Bar"]);
			end
			if (Heart_healing[who][author]["TimeLeft"] <= -3) then
				if (Heart_i_am_healing == who) then
					Heart_i_am_healing = nil;
				end
				Heart_healing[who][author] = nil;
			end
			if ((GetNumPartyMembers() >= 0 or GetNumRaidMembers() >= 0) and (Heart_Config["show_healing_all"] == 1 or (Heart_Config["show_healing_me"] == 1 and who == C_my_name) or not Heart_healing[who][author])) then
				if (Heart_healing[who][author] and bar) then
					bar:SetMinMaxValues(0, moredata["CastTime"]);
					bar:SetValue(moredata["CastTime"] - Heart_healing[who][author]["TimeLeft"]);
					if (moredata["Status"] == "Failed" or moredata["Status"] == "Interrupted") then
						getglobal(bar:GetName() .. "BarTexture"):SetVertexColor(1.0, 0.0, 0.0, 0.5);
					elseif (moredata["Status"] == "Stop") then
						getglobal(bar:GetName() .. "BarTexture"):SetVertexColor(0.0, 1.0, 0.0, 0.5);
					end
					if (Heart_healing[who][author]["TimeLeft"] <= -2 and not Heart_GUI:IsVisible()) then
						bar:SetAlpha(3 + Heart_healing[who][author]["TimeLeft"]);
					end
				elseif (Heart_healing[who][author] and Heart_healing[who][author]["CastTime"] >= 0) then
					for a = 1, 15 do
						bar = getglobal("Heart_GUIHealBars" .. a);
						if (bar:GetMinMaxValues() == 666 or (bar.author and bar.author == author)) then
							if (bar.who and bar.author and not (bar.who == who and bar.author == author) and Heart_healing[bar.who]) then
								-- to prevent another healing to fade out or new healing
								Heart_healing[bar.who][bar.author] = nil;
							end
							Heart_healing[who][author]["Bar"] = a;
							bar:SetMinMaxValues(0, moredata["CastTime"]);
							bar:SetValue(moredata["CastTime"] - Heart_healing[who][author]["TimeLeft"]);
							getglobal(bar:GetName() .. "Text"):SetText(author .. "(" .. math.floor(moredata["Heal"]) .. ") -> " .. who);
							getglobal(bar:GetName() .. "BarTexture"):SetVertexColor(1.0, 0.7, 0.0, 0.5);
							bar.author = author;
							bar.who = who;
							bar:SetAlpha(1.0);
							bar:Show();
							a = 15;
						end
					end
				elseif (bar) then
					bar:SetMinMaxValues(666, 1337);
					bar:SetValue(666);
					getglobal(bar:GetName() .. "Text"):SetText("Heart heal bar");
					bar.author = nil;
					bar.who = nil;
					if (not Heart_GUI:IsVisible()) then
						bar:Hide();
					end
				end
			end
		end
	end
	Heart_UpdateTVHealing(elapsed);
end

function Heart_UpdateClassButtons()
         for i = 1, 5 do
             getglobal("Heart_ClickFrameClass"..i):SetText("")
             getglobal("Heart_ClickFrameClass"..i):Hide()
         end
         getglobal("Heart_ClickFrame"):SetHeight(170)
         local x = 1
         for class, data in Heart_Config["classes"] do
                 if x <= 5 then
                    getglobal("Heart_ClickFrameClass"..x):SetText(class)
                    if (getglobal("Heart_ClickFrameClass"..x):IsShown()) and (getglobal("Heart_ClickFrameClass"..x):GetText() == nil)then
                    else
                        getglobal("Heart_ClickFrameClass"..x):Show()
                        getglobal("Heart_ClickFrame"):SetHeight((getglobal("Heart_ClickFrame"):GetHeight())+30)
                    end
                 x = x + 1
                 end
         end
end

function Heart_UpdateScale()
         Heart_GUIHealCurrent:SetScale(Heart_Config["HealBars_Scale"])
         for a = 1, 15 do
            getglobal("Heart_GUIHealBars"..a):SetScale(Heart_Config["CastBar_Scale"])
         end
         Heart_ClickFrame:SetScale(Heart_Config["Buttons_Scale"])
end

Heart_TargetView={
	Name=nil;
	UnitID=nil;
}

function Heart_SetTV()
	Heart_TargetView.UnitID=Heart_UnitID(UnitName("target"));
end

function Heart_UpdateTVHealing(elapsed)
	-- insert the datas that who=target

	if Heart_TargetView.UnitID==nil then 
		Heart_TargetViewBar0:Hide();
		return;
	end
	Heart_TargetViewBar0:Show();
	targetmaxhealth=UnitHealthMax(Heart_TargetView.UnitID);
	who=UnitName(Heart_TargetView.UnitID);
	sortlist={};
	db=Heart_healing[who];
	Heart_TargetViewBar0:SetMinMaxValues(0,targetmaxhealth);
	Heart_TargetViewBar0:SetValue(UnitHealth(Heart_TargetView.UnitID));
	Heart_TargetViewBar0Text:SetText(who);
	
	if db then
		for author, moredata in db do
			table.insert(sortlist,author);
		end
	end
	
	-- sort the list with TIMELEFT
	local f=function(a1,a2)
		if db[a1]["TimeLeft"]<=-3 then return false; end
		if db[a2]["TimeLeft"]<=-3 then return true; end
		if db[a1]["TimeLeft"]<db[a2]["TimeLeft"] then
			return true
		else 
			return false
		end
	end
	
	if table.getn(sortlist)>=2 then
		table.sort(sortlist,f)
	end
	for k=1,8 do
		bar=getglobal("Heart_TargetViewBar"..k);
		if sortlist[k] then
			bar:Show();
			barb=getglobal(bar:GetName() .. "BarB");
			bar_spark=getglobal(bar:GetName() .. "Spark");
			barb_width=db[sortlist[k]]["Heal"]/targetmaxhealth*bar:GetWidth();
			bar_text=getglobal(bar:GetName() .. "Text");
			if (db[sortlist[k]]["Status"] == "Failed" or db[sortlist[k]]["Status"] == "Interrupted") then
				barb:SetVertexColor(1.0, 0.0, 0.0, 0.7);
			elseif (db[sortlist[k]]["Status"] == "Stop") then
				barb:SetVertexColor(0.0, 1.0, 0.0, 0.7);
			else 
				barb:SetVertexColor(0.0, 1.0, 0.0, 0.7);
			end
			-- if the bar is to fade out
			if (db[sortlist[k]]["TimeLeft"] <= -1) then
				bar:SetAlpha(2 + db[sortlist[k]]["TimeLeft"]);
			end

			if (db[sortlist[k]]["TimeLeft"] <= 0) then
			
				bar_spark:Hide();
				if (db[sortlist[k]]["Status"] == "Failed" or db[sortlist[k]]["Status"] == "Interrupted") then
					bar:SetValue(0);
				else 
					bar:SetValue(1);
				end
			else
				bar:SetAlpha(1);
				bar_progress=1-db[sortlist[k]]["TimeLeft"]/3.5;
				bar_spark:Show();
				bar_spark:SetPoint("CENTER",bar,"LEFT",bar_progress*bar:GetWidth(),0);
				barb:SetWidth(barb_width);
				bar:SetValue(bar_progress);
				bar_text:SetText(sortlist[k].." "..math.floor(db[sortlist[k]]["TimeLeft"]*10)/10);
			end
		else
			bar:Hide();
		end

	end


end

