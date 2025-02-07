--  #########
-- # Hooks #
--#########

function Heart_CastSpellByName(inputspell, onSelf)
	local _, tempSpell, rank,spell;
	--Trim off any trailing semicolons and/or white space
	_, _, spell = strfind(inputspell, "^(.*);?%s*$");
	--Trim off any trailing ()
	while ( string.sub( spell, -2 ) == "()" ) do
		spell = string.sub( spell, 1, -3 );
	end
	--Get rid of any leading white space
	_, _, spell = strfind(spell, "^%s*(.*)$");
	-- Find the rank
	_, _, tempSpell, rank = strfind(spell, "(.*)%("..RANK.." (%d)%)$");
	if GetLocale() == "zhCN" then
		--Chinese version wow BUG, it use LEVEL instead of RANK
		_, _, tempSpell, rank = strfind(spell, "(.*)%("..LEVEL.." (%d)%)$");
	else
		_, _, tempSpell, rank = strfind(spell, "(.*)%("..RANK.." (%d)%)$");
	end
	if (tempSpell and rank) then
		spell = tempSpell;
		rank = tonumber(rank);
	else
		rank = 0;
	end	

	if (Heart_Spells[spell] and Heart_Spells[spell][rank]) then
              Heart_spell_awaiting_target_Spell = spell
              Heart_spell_awaiting_target_Rank = rank
	      if onSelf then
		      Heart_spell_awaiting_target_Target= "player"
	      end
		
        end
end

function Heart_CastSpell(id, book)
	local spell, rank = GetSpellName(id, book);
	if (Heart_Spells[spell] and Heart_Spells[spell][rank]) then
              Heart_spell_awaiting_target_Spell = spell
              Heart_spell_awaiting_target_Rank = rank
        end
end

function Heart_UseAction(slot, checkCursor, onSelf)
	-- our own "UseAction" method
	if (Heart_Config["hook_useaction"] == 0 or CursorHasItem() or CursorHasMoney() or CursorHasSpell() or not Heart_Config) then
		-- placing something on the action bar?
		return true
	end
	if (GetActionText(slot)) then
		-- this slot does not seem to be a spell, no hooking
		return true
	end
	local spell, rank = Heart_GetActionSpell(slot)
	if (not Heart_Spells) then
		Heart_UpdateSpells()
	end
	if (Heart_Config["ninja_useaction"] == 1) then
           if (Heart_Config["hook_shields"] == 0 and (spell == C_Power_word_shield or spell == C_Blessing_of_protection)) then
		-- popular demand to not hook the priest shield... oh well, suckers :p
		return true
	   end
	   if (Heart_rez_spells[spell] and Heart_Config["useaction_rez"] == 1) then
                return Heart_RezButton_OnClick()
           elseif (Heart_rez_spells[spell] and (Heart_Config["useaction_rez"] == 0)) then
		return true
	   end
	   -- let's see if it's a healing spell in this slot
	   if (not Heart_player_heal_spells[spell]) then
		-- it isn't, just run the original UseAction
		return true
	   end
	   -- in case we're using the custom "holy shock"
           if (spell == C_Holy_shock and UnitExists("target") and not UnitIsFriend("player", "target")) then
		return true
	   end
	   -- okay, so apparently we did click on a healing spell. time for magic
	   if (not Heart_ActionHeal(spell, rank)) then
		return true
	   else 
		return false
	   end
		
        else
           if (Heart_Spells[spell] and Heart_Spells[spell][rank]) then
              Heart_spell_awaiting_target_Spell = spell
              Heart_spell_awaiting_target_Rank = rank
	      if onSelf then
		      Heart_spell_awaiting_target_Target= "player"
	      end
           end
           return true
        end
	
end

function Heart_SpellTargetUnit(unit,fromheart)

        if ((Heart_spell_awaiting_target_Spell) and (not fromheart)) then
           Heart_error_message = nil
	   Heart_check_for_client_error = nil
   
           local spell = Heart_spell_awaiting_target_Spell
           local rank = Heart_spell_awaiting_target_Rank
	   if (Heart_error_message) then
		-- ok, so we got an error, figure out what we should do about it
		for error,msg in Heart_error_unable do
                    if (string.find(Heart_error_message, msg)) then
                       clean_spell_awaiting_target()
		       
		       return 
                    end
		end
	   end
	   if (Heart_check_for_client_error) then
		-- client detected an error (are we sitting?)
               clean_spell_awaiting_target()
		return 
	   end
	   local name = C_UnitName(unit)
	   if (string.find(unit, "pet")) then
		-- pet
		if (unit == "pet") then
			name = C_UnitName("player") .. "-" .. name
		else
			name = C_UnitName(string.gsub(unit, "pet", "")) .. "-" .. name
		end
	   end
	   local casttime = Heart_Spells[spell][rank]["CastTime"]
	   if C_UnitGotBuff("player", C_Natures_swiftness) then casttime = 0 end
	   local heal, healmin, healmax, hot = Heart_GetSpellHealing(unit, spell, rank)
	   local cancelheal = heal
	   if (healvalue and healvalue < heal) then
		cancelheal = healvalue
	   end

	   Heart_healing[name] = (Heart_healing[name] or {})
	   if (Heart_healing[name][C_my_name] and Heart_healing[name][C_my_name]["Bar"]) then
		local bar = getglobal("Heart_GUIHealBars" .. Heart_healing[name][C_my_name]["Bar"])
		bar:SetMinMaxValues(666, 1337)
		bar:Hide()
	   end

	   Heart_healing = {
                [name] = {
                     [C_my_name] = {
		                 ["CancelHeal"] = cancelheal,
		                 ["CastTime"] = casttime,
		                 ["Heal"] = (healmin + healmax) / 2,
		                 ["HealingOverTime"] = hot,
		                 ["Rank"] = rank,
		                 ["Spell"] = spell,
		                 ["Status"] = "Active",
		                 ["TankHealing"] = (not healvalue),
		                 ["TimeLeft"] = casttime
		     }
		}
	   }
	   Heart_i_am_healing = name

	   Heart_GUIHealCurrentSpellText:SetText(spell .. " " .. rank .. " - " .. math.floor((healmin + healmax) / 2) .. " / " .. math.floor(hot))
	   Heart_GUIHealCurrentSpell:SetMinMaxValues(0, casttime)
	   Heart_GUIHealCurrentTarget:SetMinMaxValues(0, UnitHealthMax(unit))
	   Heart_GUIHealCurrentAfter:SetMinMaxValues(0, UnitHealthMax(unit))
	   Heart_GUIHealCurrentOverheal:SetMinMaxValues(0, 1)
	   Heart_GUIHealCurrent:SetAlpha(1.0)
	   Heart_GUIHealCurrent:Show()
	   Heart_UpdateHealCurrent()
           SendAddonMessage("Heart", "Update, " .. name .. ", " .. spell .. ", " .. (healmin + healmax) / 2 .. ", " .. hot .. ", " .. casttime .. ", " .. casttime, "RAID")
   end 
         clean_spell_awaiting_target()
end

function Heart_MouseDown()
   if arg1 == "LeftButton" then
       local unit
       
       if Heart_spell_awaiting_target_Spell and UnitExists("mouseover") then
           unit = C_AKA("mouseover")
       end

       if Heart_spell_awaiting_target_Spell and unit then
           Heart_error_message = nil
	   Heart_check_for_client_error = nil
           local spell = Heart_spell_awaiting_target_Spell
           local rank = Heart_spell_awaiting_target_Rank

	   if (Heart_error_message) then
		-- ok, so we got an error, figure out what we should do about it
		for error,msg in Heart_error_unable do
                    if (string.find(Heart_error_message, msg)) then
                       clean_spell_awaiting_target();
		       return Heart_original_WorldFrameMouseDown()
                    end
		end
	   end

	   if (Heart_check_for_client_error) then
		-- client detected an error (are we sitting?)
                clean_spell_awaiting_target()
		return Heart_original_WorldFrameMouseDown()
	   end

	   local name = C_UnitName(unit)

	   if (string.find(unit, "pet")) then
		-- pet
		if (unit == "pet") then
			name = C_UnitName("player") .. "-" .. name
		else
			name = C_UnitName(string.gsub(unit, "pet", "")) .. "-" .. name
		end
	   end

	   local casttime = Heart_Spells[spell][rank]["CastTime"]

	   if C_UnitGotBuff("player", C_Natures_swiftness) then 
              casttime = 0 
           end

	   local heal, healmin, healmax, hot = Heart_GetSpellHealing(unit, spell, rank)
	   local cancelheal = heal

	   if (healvalue and healvalue < heal) then
		 cancelheal = healvalue
	   end

	   Heart_healing[name] = (Heart_healing[name] or {})

	   if (Heart_healing[name][C_my_name] and Heart_healing[name][C_my_name]["Bar"]) then
		local bar = getglobal("Heart_GUIHealBars" .. Heart_healing[name][C_my_name]["Bar"])
		bar:SetMinMaxValues(666, 1337)
		bar:Hide()
	   end

	   Heart_healing = {
                [name] = {
                     [C_my_name] = {
		                 ["CancelHeal"] = cancelheal,
		                 ["CastTime"] = casttime,
		                 ["Heal"] = (healmin + healmax) / 2,
		                 ["HealingOverTime"] = hot,
		                 ["Rank"] = rank,
		                 ["Spell"] = spell,
		                 ["Status"] = "Active",
		                 ["TankHealing"] = (not healvalue),
		                 ["TimeLeft"] = casttime
		     }
		}
	   }
	   Heart_i_am_healing = name
	   Heart_GUIHealCurrentSpellText:SetText(spell .. " " .. rank .. " - " .. math.floor((healmin + healmax) / 2) .. " / " .. math.floor(hot))
	   Heart_GUIHealCurrentSpell:SetMinMaxValues(0, casttime)
	   Heart_GUIHealCurrentTarget:SetMinMaxValues(0, UnitHealthMax(unit))
	   Heart_GUIHealCurrentAfter:SetMinMaxValues(0, UnitHealthMax(unit))
	   Heart_GUIHealCurrentOverheal:SetMinMaxValues(0, 1)
	   Heart_GUIHealCurrent:SetAlpha(1.0)
	   Heart_GUIHealCurrent:Show()
	   Heart_UpdateHealCurrent()
           SendAddonMessage("Heart", "Update, " .. name .. ", " .. spell .. ", " .. (healmin + healmax) / 2 .. ", " .. hot .. ", " .. casttime .. ", " .. casttime, "RAID")
        end
      clean_spell_awaiting_target();
   end
end

function Heart_SpellStopCasting()
         if Heart_spell_awaiting_target_Spell then
           clean_spell_awaiting_target();
         end
end

function Heart_SpellStopTargeting()
         if Heart_spell_awaiting_target_Spell then
            clean_spell_awaiting_target();
         end
end

function Heart_TargetFrame_Update()
	if (not Heart_target_last_target) then
		return true
	end
end

function Heart_PartyMemberFrame_OnClick(partyFrame)
	partyFrame = (partyFrame or this)
	local unit = "party" .. partyFrame:GetID()
	if (not Heart_MouseHeal(unit, arg1)) then
		return true
	end
end

function Heart_PlayerFrame_OnClick()
	if (not Heart_MouseHeal("player", arg1)) then
		return true
	end
end

function Heart_RaidPulloutButton_OnClick()
	local unit = (this.unit or this:GetParent().unit)
	if (not Heart_MouseHeal(unit, arg1)) then
		return true
	end
end

function Heart_TargetFrame_OnClick()
	if (not Heart_MouseHeal(C_AKA("target"), arg1)) then
		return true
	end
end
