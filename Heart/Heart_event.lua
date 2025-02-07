--  #######################################
-- # OnLoad OnEvent OnUpdate and Command #
--#######################################
function Heart_OnLoad()
        Heart_healing = {}
        Heart_item_heal_bonus_cache = {}
        Heart_raid_cache = {}
        

        C_my_class = UnitClass("player")
	C_my_name = C_UnitName("player")

	this:RegisterEvent("PLAYER_LOGIN")
	this:RegisterEvent("VARIABLES_LOADED")

	SLASH_Heart1 = "/heart"
	SlashCmdList["Heart"] = function(msg)
		Heart_Command(msg)
	end

end

function Heart_OnEvent()
	if (event == "CHAT_MSG_ADDON" and arg1 and arg2 and arg3 and arg4 and (arg1 == "Heart" or arg1 == "Genesis" or arg1 == "Panza" or arg1 == "Healer")) then
		Heart_Receive(arg4, arg2)
	elseif (event == "LEARNED_SPELL_IN_TAB") then
		Heart_UpdateSpells()
	elseif (event == "PLAYER_ENTERING_WORLD") then
		-- we zoned somewhere, clearly we left battle
		C_player_in_combat = nil
		-- and clearly we're not casting a spell
		Heart_casting_spell = nil
	elseif (event == "PLAYER_LOGIN") then
                Heart_UpdateSpells()
		Heart_SetupSettings()
	        this:RegisterEvent("CHAT_MSG_ADDON")
		if (not Heart_supported_classes[C_my_class]) then
			-- we're not a healer, let's mess with the "OnUpdate" method
			Heart_OnUpdate = function(elapsed)
			               Heart_UpdateHealing(elapsed)
			end
			-- and then return, don't need to register/hook anymore
			return
		else
		--Use Sea Hooks in 0.14
		        Sea.util.hook("UseAction","Heart_UseAction","replace")
			Sea.util.hook("CastSpellByName","Heart_CastSpellByName","before")
 			Sea.util.hook("CastSpell","Heart_CastSpell","before")
                        Sea.util.hook("SpellTargetUnit", "Heart_SpellTargetUnit", "before")

                        local WorldFrameMouseDown = WorldFrame:GetScript("OnMouseDown")
                        if WorldFrameMouseDown then
                           WorldFrame:SetScript("OnMouseDown", function() Heart_MouseDown(); WorldFrameMouseDown(); end )
                        else
                           WorldFrame:SetScript("OnMouseDown", function() Heart_MouseDown(); end )
                        end

                        Sea.util.hook("SpellStopCasting","Heart_SpellStopCasting","before")
                        
                        Sea.util.hook("SpellStopTargeting","Heart_SpellStopTargeting","before")

                        Sea.util.hook("PlayerFrame_OnClick","Heart_PlayerFrame_OnClick","replace")

                        Sea.util.hook("TargetFrame_OnClick","Heart_TargetFrame_OnClick","replace")

                        Sea.util.hook("PartyMemberFrame_OnClick", "Heart_PartyMemberFrame_OnClick","replace")
  
                        
                        Sea.util.hook("RaidPulloutButton_OnClick","Heart_RaidPulloutButton_OnClick","replace")
		        
                        
                        Sea.util.hook("TargetFrame_Update", "Heart_TargetFrame_Update", "replace")

                        this:RegisterEvent("LEARNED_SPELL_IN_TAB")
		        this:RegisterEvent("PLAYER_ENTERING_WORLD")
		        this:RegisterEvent("PLAYER_LEAVING_WORLD")
		        this:RegisterEvent("PLAYER_REGEN_DISABLED")
		        this:RegisterEvent("PLAYER_REGEN_ENABLED")
		        this:RegisterEvent("RAID_ROSTER_UPDATE")
		        this:RegisterEvent("SPELLCAST_DELAYED")
		        this:RegisterEvent("SPELLCAST_FAILED")
		        this:RegisterEvent("SPELLCAST_INTERRUPTED")
		        this:RegisterEvent("SPELLCAST_START")
		        this:RegisterEvent("SPELLCAST_STOP")
		        this:RegisterEvent("UI_ERROR_MESSAGE")
		        this:RegisterEvent("UNIT_INVENTORY_CHANGED")
		end

	elseif (event == "PLAYER_REGEN_DISABLED") then
		-- regen disabled, means we're in combat
		C_player_in_combat = 1
	elseif (event == "PLAYER_REGEN_ENABLED") then
		-- regen enabled, means we left combat
		C_player_in_combat = nil
	elseif (event == "RAID_ROSTER_UPDATE") then
		Heart_SetRaidChecked()
	elseif (event == "SPELLCAST_DELAYED" and Heart_i_am_healing and arg1) then
		-- our current spellcasting got delayed somehow
		local healingtarget = Heart_i_am_healing
		if (not Heart_healing[healingtarget] or not Heart_healing[healingtarget][C_my_name] or Heart_healing[healingtarget][C_my_name]["Complete"]) then
			return
		end
		Heart_healing[healingtarget][C_my_name]["TimeLeft"] = Heart_healing[healingtarget][C_my_name]["TimeLeft"] + arg1 / 1000
                SendAddonMessage("Heart", "Update, " .. healingtarget .. ", " .. Heart_healing[healingtarget][C_my_name]["Spell"] .. ", " .. Heart_healing[healingtarget][C_my_name]["Heal"] .. ", " .. Heart_healing[healingtarget][C_my_name]["HealingOverTime"] .. ", " .. Heart_healing[healingtarget][C_my_name]["CastTime"] .. ", " .. Heart_healing[healingtarget][C_my_name]["TimeLeft"], "RAID")
	elseif (event == "SPELLCAST_FAILED" or event == "SPELLCAST_INTERRUPTED" or event == "SPELLCAST_STOP") then
		-- our spellcasting failed, was interrupted or stopped
		local wascasting = Heart_casting_spell
		Heart_casting_spell = nil
		Heart_check_for_client_error = 1
		local healingtarget = Heart_i_am_healing
		if (not healingtarget or not Heart_healing[healingtarget] or not Heart_healing[healingtarget][C_my_name]) then
			return
		end
		if (event == "SPELLCAST_FAILED") then
			Heart_healing[healingtarget][C_my_name]["Status"] = "Failed"
			if ((Heart_awaiting_rez[C_GetUnitID(healingtarget)])) then
                           Heart_awaiting_rez[C_GetUnitID(healingtarget)]["status"] = "int"
		        end
		elseif (event == "SPELLCAST_INTERRUPTED") then
			if ((Heart_awaiting_rez[C_GetUnitID(healingtarget)])) then
                           Heart_awaiting_rez[C_GetUnitID(healingtarget)]["status"] = "int"
		        end
			Heart_healing[healingtarget][C_my_name]["Status"] = "Interrupted"
		elseif (not wascasting) then
			-- we got a "stop" signal before the "start" signal?
			-- don't do anything, return
			return
		elseif (event == "SPELLCAST_STOP") then
		        if ((Heart_awaiting_rez[C_GetUnitID(healingtarget)]) and (Heart_awaiting_rez[C_GetUnitID(healingtarget)]["status"] == "start")) then
		           Heart_awaiting_rez[C_GetUnitID(healingtarget)]["cast"] = 0.5
		           Heart_awaiting_rez[C_GetUnitID(healingtarget)]["status"] = "stop"
                        end
			Heart_healing[healingtarget][C_my_name]["Status"] = "Stop"
		end
		-- an attempt to improve "heal most wounded" "ban" the last healed player for a short duration
		-- could use the "UNIT_HEALTH" event to monitor this, but that event fires ALL the time. waste of cpu
		-- 300ms ban should be more than 'nuff, if the players hp is so critically low then there's most likely
		-- 10 other healers trying to heal that player anyways.
		Heart_soft_lock_player = C_GetUnitID(healingtarget)
		Heart_soft_lock_time = 0.3

		Heart_healing[healingtarget][C_my_name]["Complete"] = 1
		Heart_healing[healingtarget][C_my_name]["TimeLeft"] = -1
		SendAddonMessage("Heart", Heart_healing[healingtarget][C_my_name]["Status"] .. ", " .. healingtarget .. ", " .. Heart_healing[healingtarget][C_my_name]["Spell"] .. ", " .. Heart_healing[healingtarget][C_my_name]["Heal"] .. ", " .. Heart_healing[healingtarget][C_my_name]["HealingOverTime"] .. ", " .. Heart_healing[healingtarget][C_my_name]["CastTime"] .. ", " .. Heart_healing[healingtarget][C_my_name]["TimeLeft"], "RAID")
	elseif (event == "SPELLCAST_START" and arg2) then
		-- we just started casting a spell
		Heart_casting_spell = 1
		local healingtarget = Heart_i_am_healing
		if Heart_spell_awaiting_target_Spell then
			if  Heart_spell_awaiting_target_Target then
			Heart_SpellTargetUnit(Heart_spell_awaiting_target_Target,false);
			elseif UnitExists("target") then
			Heart_SpellTargetUnit("target",false);
			elseif UnitExists("mouseover") then
			Heart_SpellTargetUnit("mouseover",false);
			else
			clean_spell_awaiting_target()
			end
		end

		if (not healingtarget or not Heart_healing[healingtarget] or not Heart_healing[healingtarget][C_my_name] or Heart_healing[healingtarget][C_my_name]["Complete"]) then
			return
		end
		arg2 = arg2 / 1000
		if (arg2 == Heart_healing[healingtarget][C_my_name]["CastTime"]) then
			
			-- casttime is correct, no need to tell everyone
			return
		end
		Heart_healing[healingtarget][C_my_name]["TimeLeft"] = Heart_healing[healingtarget][C_my_name]["TimeLeft"] + arg2 - Heart_healing[healingtarget][C_my_name]["CastTime"]
		Heart_healing[healingtarget][C_my_name]["CastTime"] = arg2

		SendAddonMessage("Heart", "Update, " .. healingtarget .. ", " .. Heart_healing[healingtarget][C_my_name]["Spell"] .. ", " .. Heart_healing[healingtarget][C_my_name]["Heal"] .. ", " .. Heart_healing[healingtarget][C_my_name]["HealingOverTime"] .. ", " .. Heart_healing[healingtarget][C_my_name]["CastTime"] .. ", " .. Heart_healing[healingtarget][C_my_name]["TimeLeft"], "RAID")
	elseif (event == "UI_ERROR_MESSAGE") then
		Heart_error_message = arg1
	elseif (event == "UNIT_INVENTORY_CHANGED" and arg1 and arg1 == "player") then
		-- it's possible the player changed equipment
		-- recalculate +healing
		Heart_UpdateItemHealBonus()
	elseif (event == "VARIABLES_LOADED") then
	end
end


function Heart_OnUpdate(elapsed)
	
	last_update=last_update+elapsed;
	if (last_update>0.02) then
	Heart_UpdateHealCurrent(last_update)
	Heart_UpdateHealing(last_update)
        Heart_UpdateDead(last_update)
	last_update=0;


        --if Heart_spell_awaiting_target_Spell then
          -- if not SpellIsTargeting() then
            --  Heart_spell_awaiting_target_Spell = nil
              --Heart_spell_awaiting_target_Rank = nil
           --end
        --end
end
	Heart_update_player_data_time = (Heart_update_player_data_time or 0) +elapsed 
	if (Heart_update_player_data_time > (C_update_player_data_interval or 0)) then
		C_UpdatePlayerData(Heart_update_player_data_time)
		Heart_update_player_data_time = 0
	end
	if (Heart_soft_lock_player and Heart_soft_lock_time) then
		Heart_soft_lock_time = Heart_soft_lock_time - elapsed
		if (Heart_soft_lock_time < 0) then
			Heart_soft_lock_time = nil
			Heart_soft_lock_player = nil
		end
	end
	

end

function Heart_Command(msg)
	if (not msg or msg == "") then
		-- show/hide gui
		if (Heart_GUI:IsShown()) then
			Heart_GUI:Hide()
		else
			Heart_GUI:Show()
		end
		return
	end
	
	msg = string.lower(msg)
	if (string.find(msg, "^save")) then
		-- save our settings
		local start, stop, profile = string.find(msg, "^save (.+)$")
		if (not profile) then
			C_Print("You'll have to specify the name of the profile you want to save your settings to.")
			return
		end
		Heart_Save_Profile(profile)
		C_Print("Settings saved as profile \"" .. profile .. "\".")
	elseif (string.find(msg, "^load")) then
		-- load our settings
		local start, stop, profile = string.find(msg, "^load (.+)$")
		if (not profile) then
			C_Print("You'll have to specify which profile to load settings from.")
			return
		end
		if (not Heart_SavedProfiles[profile]) then
			C_Print("Couldn't find profile \"" .. profile .. "\"", "|cffff0000")
			return
		end
		Heart_Load_Profile(profile)
		C_Print("Profile \"" .. profile .. "\" loaded.")
	elseif (string.find(msg, "^delete")) then
		-- delete a saved profile
		local start, stop, profile = string.find(msg, "^delete (.+)$")
		if (not profile) then
			C_Print("You'll have to specify which profile to delete.")
			return
		end
		if (not Heart_SavedProfiles[profile]) then
			C_Print("Couldn't find profile \"" .. profile .. "\"", "|cffff0000")
			return
		end
		Heart_SavedProfiles[profile] = nil
		C_Print("Profile \"" .. profile .. "\" deleted.")
		Heart_GUIProfileDropDownMenu:Hide()
		Heart_GUIProfileDropDownMenu:Show()
	elseif (msg == "list") then
		-- list our profiles
		C_Print("Saved profiles:")
		local found
		for profile, data in Heart_SavedProfiles do
			C_Print(profile)
			found = 1
		end
		if (not found) then
			C_Print("No saved profiles")
		end
	elseif (msg == "gui") then
	       if Heart_ClickFrame:IsVisible() then
	          Heart_ClickFrame:Hide()
	          Heart_Config["hide_gui"] = 1
               else
                   Heart_ClickFrame:Show()
	          Heart_Config["hide_gui"] = 0
               end
	elseif (msg == "opt") then
	       if Heart_GUI:IsVisible() then 
		  Heart_GUI:Hide() 
		else 
		  Heart_GUI:Show() 
		end 
	elseif (msg == "mm") then
	       if HeartMinimapButton:IsVisible() then
                  MyMinimapButton:SetEnable("Heart",0)
	          Heart_Config["hide_mm"] = 1
               else
                  MyMinimapButton:SetEnable("Heart",1)
	          Heart_Config["hide_mm"] = 0
               end
	elseif (msg == "tank") then
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
		return
	elseif (msg == "help") then
		-- show help
		C_Print("Usage:")
		C_Print("/heart save <profile>|cffffffff   - save current settings to <profile>")
		C_Print("/heart load <profile>|cffffffff   - load settings from <profile>")
		C_Print("/heart list|cffffffff             - list all saved profiles")
		C_Print("/heart delete <profile>|cffffffff - delete <profile>")
		C_Print("/heart gui|cffffffff              - hide/show gui elements")
		C_Print("/heart mm|cffffffff               - hide/show MiniMap Button")
		C_Print("/heart opt|cffffffff              - hide/show Option Panel")
	else
		-- possibly healing using a class
		Heart_ActionHeal(msg, nil)
	end
end

