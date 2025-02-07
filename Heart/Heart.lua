
last_update=0;

Heart_Tank = {
           ["Unit"] = nil,
           ["Name"] = nil
}
Heart_i_am_healing = {}
Heart_awaiting_rez = {}

Heart_bonus_divide = 3.5
Heart_bonus_instant_divide = 15
Heart_buff_affect_healing_search = {}
Heart_buff_unable_to_heal = {
	[C_Divine_intervention] = 1,
	[C_Phase_shift] = 1
}
Heart_class_hp_per_level = {
	[C_Druid] = 60,
	[C_Hunter] = 65,
	[C_Mage] = 50,
	[C_Paladin] = 70,
	[C_Priest] = 50,
	[C_Rogue] = 65,
	[C_Shaman] = 70,
	[C_Warlock] = 65,
	[C_Warrior] = 90
}
Heart_critical_bonus = 1.5
Heart_debuff_affect_healing_search = {}
Heart_debuff_unable_to_heal = {
	[C_Banish] = 1,
	[C_Deep_slumber] = 1
}
Heart_dont_scale_hots = {
	[C_Rejuvenation] = 1,
	[C_Renew] =1
}
Heart_dont_scale = {
	[C_Holy_nova] = 1,
	[C_Power_word_shield] = 1,
	[C_Prayer_of_healing] = 1,
	[C_Tranquility] = 1,
        [C_Resurrection] = 1,
	[C_Redemption] = 1,
	[C_Rebirth] = 1,
	[C_Ancestral_Spirit] = 1
}
Heart_error_moving = {
	[SPELL_FAILED_MOVING] = 1
}
Heart_rez_spells = {
        [C_Resurrection] = 1,
	[C_Redemption] = 1,
	[C_Rebirth] = 1,
	[C_Ancestral_Spirit] = 1
}
Heart_attachment_spells = {
        [C_Natures_swiftness] = 1,
        [C_Blessing_of_protection] = 1,
        [C_Power_word_shield] = 1,
	[C_Divine_protection] = 1,
	[C_Divine_shield] = 1
}
Heart_attachment_global_cooldown = {
        [C_Blessing_of_protection] = 1,
        [C_Power_word_shield] = 1,
	[C_Divine_protection] = 1,
	[C_Divine_shield] = 1
}
Heart_attachment_has_target = {
        [C_Blessing_of_protection] = 1,
        [C_Power_word_shield] = 1
}
Heart_error_unable = {
        SPELL_FAILED_AFFECTING_COMBAT,
	SPELL_FAILED_CASTER_DEAD,
	SPELL_FAILED_CONFUSED,
	SPELL_FAILED_FLEEING,
	SPELL_FAILED_NOT_IN_CONTROL,
	SPELL_FAILED_NOT_MOUNTED,
	SPELL_FAILED_NOT_STANDING,
	SPELL_FAILED_OUT_OF_RANGE,
	SPELL_FAILED_PACIFIED,
	SPELL_FAILED_POSSESSED,
	string.gsub(SPELL_FAILED_REAGENTS, "%%s",""),
	SPELL_FAILED_SILENCED,
	SPELL_FAILED_SPELL_IN_PROGRESS,
	SPELL_FAILED_STUNNED,
	SPELL_FAILED_TARGETS_DEAD,
	SPELL_FAILED_TARGET_NOT_DEAD
}
Heart_heal_spells_search = {}
Heart_hot_duration = {
	[C_Crystal_restore] = 15,
	[C_First_aid] = 8,
	[C_Greater_heal] = 15,
	[C_Lightwell] = 10,
	[C_Regrowth] = 21,
	[C_Rejuvenation] = 12,
	[C_Renew] = 15
}
Heart_my_buff_affect_healing_search = {}
Heart_spell_level = {
	[C_Blessing_of_protection] = {0, 14, 28},
	[C_Power_word_shield] = {-4, 2, 8, 14, 20, 26, 32, 38, 44, 50},
	[C_Regrowth] = {2, 8, 14, 20, 26, 32, 38, 44, 50},
	[C_Rejuvenation] = {-6, 0, 6, 12, 18, 24, 30, 36, 42, 48, 50},
	[C_Renew] = {-2, 4, 10, 16, 22, 28, 34, 40, 46, 50}
}
Heart_low_level_spell_bonus_penalty = {
	[C_Heal] = {0.0375*16+0.25},
	[C_Healing_touch] = {0.0375*1+0.25, 0.0375*8+0.25, 0.0375*14+0.25},
	[C_Healing_wave] = {0.0375*1+0.25, 0.0375*6+0.25, 0.0375*12+0.25, 0.0375*18+0.25},
	[C_Holy_light] = {0.0375*1+0.25, 0.0375*6+0.25, 0.0375*14+0.25},
	[C_Lesser_heal] = {0.0375*1+0.25, 0.0375*4+0.25, 0.0375*10+0.25},
	[C_Regrowth] = {0.0375*12+0.25, 0.0375*18+0.25},
	[C_Rejuvenation] = {0.0375*4+0.25, 0.0375*10+0.25, 0.0375*16+0.25},
	[C_Renew] = {0.0375*8+0.25, 0.0375*14+0.25}
}
Heart_supported_classes = {
	[C_Druid] = 1,
	[C_Paladin] = 1,
	[C_Priest] = 1,
	[C_Shaman] = 1
}
Heart_blessing_of_light_text = {
        C_Holy_light,
        C_Flash_of_light
}
Heart_buff_affect_healing_text = {
	[C_Amplify_magic] = {"DamageUp", "HealUp"},
	[C_Dampen_magic] = {"DamageDown", "HealDown"}
}
Heart_debuff_affect_healing_text = {
        [C_Gehennas_curse] = {"HealDown", "Duration"},
        [C_Curse_ot_deadwood] = {"HealDown", "Duration"}
}
Heart_my_buff_affect_healing_text = {
	[C_Unstable_power] = {"DamageUp", "HealUp"},
	[C_HotA] = {"HealUp", "Duration"}
}
Heart_heal_spells_text = {
	[C_Blessing_of_protection] = {"Duration", "Delay"},
	[C_Chain_heal] = {"HealMin", "HealMax", "EffectLoss", "Targets"},
	[C_Divine_protection] = {"Duration"},
	[C_Divine_shield] = {"Duration", "AttackSpeedLoss"},
	[C_Flash_heal] = {"HealMin", "HealMax"},
	[C_Flash_of_light] = {"HealMin", "HealMax"},
	[C_Greater_heal] = {"HealMin", "HealMax"},
	[C_Heal] = {"HealMin", "HealMax"},
	[C_Healing_touch] = {"HealMin", "HealMax"},
	[C_Healing_wave] = {"HealMin", "HealMax"},
	[C_Holy_light] = {"HealMin", "HealMax"},
	[C_Holy_nova] = {"DamageMin", "DamageMax", "DamageRange", "HealRange", "HealMin", "HealMax"},
	[C_Holy_shock] = {"DamageMin", "DamageMax", "HealMin", "HealMax"},
	[C_Lesser_heal] = {"HealMin", "HealMax"},
	[C_Lesser_healing_wave] = {"HealMin", "HealMax"},
	[C_Power_word_shield] = {"Absorb", "Duration", "Delay"},
	[C_Prayer_of_healing] = {"HealMin", "HealMax"},
	[C_Regrowth] = {"HealMin", "HealMax", "HealingOverTime", "Duration"},
	[C_Rejuvenation] = {"HealingOverTime", "Duration"},
	[C_Renew] = {"HealingOverTime", "Duration"},
	[C_Swiftmend] = {"RejuvenationTime", "RegrowthTime"},
	[C_Tranquility] = {"Heal", "Interval", "ChannelTime"},
	[C_Resurrection] = {"Heal", "ManaRestored"},
	[C_Redemption] = {"Heal", "ManaRestored"},
	[C_Rebirth] = {"Heal", "ManaRestored"},
	[C_Ancestral_Spirit] = {"Heal", "ManaRestored"},
	[C_Natures_swiftness] = {"text"}
}

rh_fools_classes_set={
	[C_Druid]={
		[35] = {
			["Scale"] = 0,
			["Spell"] = C_Regrowth,
			["Rank"] = 9,
		},
		[80] = {
			["Scale"] = 1,
			["Spell"] = C_Rejuvenation,
			["Rank"] = 10,
		},
		[75] = {
			["Scale"] = 0,
			["Spell"] = C_Healing_touch,
			["Rank"] = 10,
		}
		},
	[C_Priest]={
			[30] = {
				["Scale"] = 0,
				["Spell"] = C_Flash_heal,
				["Rank"] = 7,
			},
			[20] = {
				["Scale"] = 1,
				["Spell"] = C_Power_word_shield,
				["Rank"] = 10,
			},
			[90] = {
				["Scale"] = 1,
				["Spell"] = C_Renew,
				["Rank"] = 9,
			},
			[80] = {
				["Scale"] = 0,
				["Spell"] = C_Heal,
				["Rank"] = 4,
			},
			[50] = {
				["Scale"] = 0,
				["Spell"] = C_Greater_heal,
				["Rank"] = 5,
			},
		},
	[C_Paladin]={
			[90] = {
				["Scale"] = 0,
				["Spell"] = C_Flash_of_light,
				["Rank"] = 6,
			},
			[70] = {
				["Scale"] = 0,
				["Spell"] = C_Holy_light,
				["Rank"] = 8,
			}
		},
	[C_Shaman]={
			[80] = {
				["Scale"] = 0,
				["Spell"] = C_Lesser_healing_wave,
				["Rank"] = 6,
			},
			[60] = {
				["Scale"] = 0,
				["Spell"] = C_Healing_wave,
				["Rank"] = 9,
			}
		}
		
}


Heart_set_bonus_active_text = "Set:"
Heart_set_bonus_inactive_text = "%(%d%) Set:"

        for index, value in Heart_blessing_of_light_text do
	    Heart_blessing_of_light_search = (Heart_blessing_of_light_search or "[^%d]+") .. "(%d+%.?%d*)[^%d]+"
        end

        for buff, data in Heart_buff_affect_healing_text do
	    for index, value in data do
		Heart_buff_affect_healing_search[buff] = (Heart_buff_affect_healing_search[buff] or "[^%d]+") .. "(%d+%.?%d*)[^%d]+"
	    end
        end

        for debuff, data in Heart_debuff_affect_healing_text do
	    for index, value in data do
		Heart_debuff_affect_healing_search[debuff] = (Heart_debuff_affect_healing_search[debuff] or "[^%d]+") .. "(%d+%.?%d*)[^%d]+"
	    end
        end

        for spell, data in Heart_heal_spells_text do
	    for index, value in data do
		Heart_heal_spells_search[spell] = (Heart_heal_spells_search[spell] or "[^%d]+") .. "(%d+%.?%d*)[^%d]+"
	    end
        end

        for index, value in Heart_hot_text do
	    Heart_hot_search = (Heart_hot_search or "[^%d]+") .. "(%d+%.?%d*)[^%d]+"
        end

        for buff, data in Heart_my_buff_affect_healing_text do
	    for index, value in data do
		Heart_my_buff_affect_healing_search[buff] = (Heart_my_buff_affect_healing_search[buff] or "[^%d]+") .. "(%d+%.?%d*)[^%d]+"
	    end
        end



--      ##################
--     # Info Gathering #
--    #        &       #
--   # Initialization #
--  #        &       #
-- # Core Functions #
--##################

function Heart_SetupSettings()
        Heart_UpdateSpells()
	-- setup some user defined settings
	C_update_player_data_time = (C_update_player_data_time or 2.5)

	Heart_Config = (Heart_Config or {})
	Heart_SavedProfiles = (Heart_SavedProfiles or {})
	
	if ((not Heart_Config["version"]) or (Heart_Config["version"] < 0.14001)) then
		-- new version, fix settings that has changed
		Heart_Config["debuff_affect_priority"] = nil
		Heart_Config["hook_useaction"] = nil
		Heart_Config["buff_affect_priority"]=nil
		Heart_Config["classes"]=nil
		C_Print("redHeart detect your old version of Heart. Will clean your classes sets for bug fixing. Sorry for the trouble.");
	end
	Heart_Config["version"] = 0.142
	Heart_Config["MTCastTime_Debuff"]=(Heart_Config["MTCastTime_Debuff"] or 0)
	Heart_Config["CastTime_Debuff"]=(Heart_Config["CastTime_Debuff"] or 0)
	Heart_Config["autocancel"] = (Heart_Config["autocancel"] or 1)
	Heart_Config["mm"] = (Heart_Config["mm"] or {})
	if (not Heart_Config["buff_affect_priority"]) then
		Heart_Config["buff_affect_priority"] = {
	[C_Blessing_of_protection] =  0.2,
	[C_Power_word_shield] =  0.4  }
	end
		
	Heart_Config["autocancel_time"] = (Heart_Config["autocancel_time"] or 0.25)
	if (not Heart_Config["class_priority"]) then
		Heart_Config["class_priority"] = {
			[C_Druid] = 0.5,
			[C_Hunter] = 0.4,
			[C_Mage] = 0.8,
			[C_Paladin] = 0.5,
			[C_Priest] = 0.7,
			[C_Rogue] = 0.7,
			[C_Shaman] = 0.6,
			[C_Warlock] = 0.6,
			[C_Warrior] = 1.0
		}
	end
	if (not Heart_Config["rez_priority"]) then
		Heart_Config["rez_priority"] = {
			[C_Druid] = 0.7,
			[C_Hunter] = 0.5,
			[C_Mage] = 0.6,
			[C_Paladin] = 0.5,
			[C_Priest] = 0.8,
			[C_Rogue] = 0.5,
			[C_Shaman] = 0.6,
			[C_Warlock] = 0.5,
			[C_Warrior] = 1.0
		}
	end
	if not Heart_Config["classes"] then
		Heart_Config["classes"]={}
		if rh_fools_classes_set[C_my_class] then
			Heart_Config["classes"]["standard"]=rh_fools_classes_set[C_my_class]
		end
	end

	if (not Heart_Config["debuff_affect_priority"]) then
		Heart_Config["debuff_affect_priority"] = {
			[C_Recently_bandaged] = 0.15,
			[C_Weakened_soul] = 0.15,
			[C_Mortal_strike] = 0.3
		}
	end
	if (not Heart_Config["rez_spell"]) then
                for spell, data in Heart_Spells do
                    if Heart_rez_spells[spell] then
                       Heart_Config["rez_spell"] = spell
                    end
                end
        end
        local rezspell = Heart_Config["rez_spell"]
        if rezspell then
                   Heart_Config["rez_rank"] = (Heart_Config["rez_rank"] or table.getn(Heart_Spells[rezspell]))
        end
        Heart_Config["MT_priority"] = (Heart_Config["MT_priority"] or 0.5)
        Heart_Config["rez_message"] = (Heart_Config["rez_message"] or "Come to the light $t")
        Heart_Config["enable_mouse"] = (Heart_Config["enable_mouse"] or 0)
        Heart_Config["rez_message_channel"] = (Heart_Config["rez_message_channel"] or "SAY")
        if (not Heart_supported_classes[C_my_class]) then
            local layout = {
                  icon = "Interface\\Icons\\INV_Misc_Organ_01",
                  drag = "CIRCLE",
                  left = function() if Heart_GUI:IsShown() then Heart_GUI:Hide() else Heart_GUI:Show() end end,
                  right = function() if Heart_Config["show_healing_me"] == 1 then Heart_Config["show_healing_me"] = 0 else Heart_Config["show_healing_me"] = 1 end end,
                  tooltip = Heart_GUI_help["MM2"]["Description"],
                  enabled = 0
            }
            MyMinimapButton:Create("Heart",Heart_Config["mm"],layout)
        else
            local layout = {
                  icon = "Interface\\Icons\\INV_Misc_Organ_01",
                  drag = "CIRCLE",
                  left = function() if Heart_GUI:IsShown() then Heart_GUI:Hide() else Heart_GUI:Show() end end,
                  right = function() if Heart_ClickFrame:IsShown() then Heart_ClickFrame:Hide() Heart_Config["hide_gui"] = 1 else Heart_ClickFrame:Show() Heart_Config["hide_gui"] = 0 end end,
                  tooltip = Heart_GUI_help["MM"]["Description"],
                  enabled = 0
            }
            MyMinimapButton:Create("Heart",Heart_Config["mm"],layout)
        end
        Heart_Config["hide_mm"] = (Heart_Config["hide_mm"] or 0)
        if Heart_Config["hide_mm"] == 0 then
           MyMinimapButton:SetEnable("Heart",1)
        end
        Heart_Config["hide_gui"] = (Heart_Config["hide_gui"] or 0)
        if Heart_Config["hide_gui"] == 0 then
           if (Heart_supported_classes[C_my_class]) then
              Heart_ClickFrame:Show()
              Heart_UpdateClassButtons()
           else
              Heart_ClickFrame:Hide()
           end
        end
        Heart_Config["always_tank_target"] = (Heart_Config["always_tank_target"] or 0)
        Heart_Config["rez_party_only"] = (Heart_Config["rez_party_only"] or 0)
	Heart_Config["heal_enough_modifier"] = (Heart_Config["heal_enough_modifier"] or 4)
	Heart_Config["heal_none_modifier"] = (Heart_Config["heal_none_modifier"] or 1)
	Heart_Config["heal_max_modifier"] = (Heart_Config["heal_max_modifier"] or 5)
	Heart_Config["heal_power"] = (Heart_Config["heal_power"] or 1.0)
	Heart_Config["heal_self_modifier"] = (Heart_Config["heal_self_modifier"] or 3)
	Heart_Config["heal_charmed"] = (Heart_Config["heal_charmed"] or 1)
	Heart_Config["heal_strategy"] = (Heart_Config["heal_strategy"] or 1)
	Heart_Config["heal_targettarget_modifier"] = (Heart_Config["heal_targettarget_modifier"] or 1)
	Heart_Config["hook_shields"] = (Heart_Config["hook_shields"] or 1)
	Heart_Config["hook_useaction"] = (Heart_Config["hook_useaction"] or 1)
	Heart_Config["ninja_useaction"] = (Heart_Config["ninja_useaction"] or 1)
	Heart_Config["hot_heal_threshold"] = (Heart_Config["hot_heal_threshold"] or 0.4)
	Heart_Config["hot_multiply"] = (Heart_Config["hot_multiply"] or 1.0)
	Heart_Config["hot_multiply_battle"] = (Heart_Config["hot_multiply_battle"] or 0.5)
	Heart_Config["max_overheal"] = (Heart_Config["max_overheal"] or 0.2)
	Heart_Config["min_heal_threshold"] = (Heart_Config["min_heal_threshold"] or 0.95)
	Heart_Config["mouse"] = (Heart_Config["mouse"] or {})
	Heart_Config["party_priority"] = (Heart_Config["party_priority"] or 0.8)
	Heart_Config["pet_priority"] = (Heart_Config["pet_priority"] or 0.2)
	Heart_Config["player_priority"] = (Heart_Config["player_priority"] or 1.0)
	Heart_Config["raid"] = (Heart_Config["raid"] or {})
	for group = 1, 8 do
		Heart_Config["raid"][group] = (Heart_Config["raid"][group] or {})
		for slot = 1, 5 do
			Heart_Config["raid"][group][slot] = (Heart_Config["raid"][group][slot] or 1)
		end
	end
	if (C_my_class == C_Druid or C_my_class == C_Paladin or C_my_class == C_Priest or C_my_class == C_Shaman) then
		Heart_Config["show_healing_all"] = (Heart_Config["show_healing_all"] or 1);
		Heart_Config["show_healing_me"] = (Heart_Config["show_healing_me"] or 0);
	else
		Heart_Config["show_healing_all"] = (Heart_Config["show_healing_all"] or 0);
		Heart_Config["show_healing_me"] = (Heart_Config["show_healing_me"] or 1);
	end
	Heart_Config["shapeshifted_druids"] = (Heart_Config["shapeshifted_druids"] or 1);
	Heart_Config["raid_priority"] = (Heart_Config["raid_priority"] or 0.5)
	Heart_Config["safe_cancel"] = (Heart_Config["safe_cancel"] or 1)
	Heart_Config["scale_spells"] = (Heart_Config["scale_spells"] or 1)
	Heart_Config["scale_hots"] = (Heart_Config["scale_hots"] or 0)
	Heart_Config["unchecked_priority"] = (Heart_Config["unchecked_priority"] or 0.3)
	Heart_Config["useaction_heal_most_wounded"] = (Heart_Config["useaction_heal_most_wounded"] or 1)
        Heart_Config["useaction_rez"] = (Heart_Config["useaction_rez"] or 1)
	Heart_Config["CastBar_Scale"] = (Heart_Config["CastBar_Scale"] or 1)
	Heart_Config["HealBars_Scale"] = (Heart_Config["HealBars_Scale"] or 1)
	Heart_Config["Buttons_Scale"] = (Heart_Config["Buttons_Scale"] or 1)
	Heart_UpdateClassButtons()
end
        -- update stored settings
function Heart_UpdateSettings()
	Heart_UpdateScale()
        
	if (not this or not this.variable) then
		return
	end
	local variable = this.variable
	local start, stop, pre = string.find(variable, "^([%w%s:_%-]+)")
	if (not pre) then
		return
	end
	local value
	if (string.find(this:GetName(), "^Heart_GUI.*Slider$")) then
		-- a slider
		value = math.floor(this:GetValue() * 100 + 0.5) / 100
		if (this:GetName() == "Heart_GUIAutocancelTimeSlider") then
			getglobal(this:GetName() .. "High"):SetText(value * 1000 .. " ms")
		elseif (this:GetName() == "Heart_GUIUpdatePlayerDataTimeSlider") then
			value = value / 10
			getglobal(this:GetName() .. "High"):SetText(value .. " ms")
		elseif (this:GetName() == "Heart_GUIHealStrategySlider") then
			getglobal(this:GetName() .. "High"):SetText(Heart_GUI_heal_strategies[value])
		elseif (string.find(this:GetName(), "Heart_GUIHeal.+ModifierSlider")) then
			getglobal(this:GetName() .. "High"):SetText(Heart_GUI_keys[value])
		elseif (string.find(this:GetName(), "RankSlider")) then
			getglobal(this:GetName() .. "High"):SetText(value)
		elseif (string.find(this:GetName(), "Value")) then
			getglobal(this:GetName() .. "High"):SetText(value)
		else
			getglobal(this:GetName() .. "High"):SetText(value * 100 .. "%")
		end
	elseif (string.find(this:GetName(), "^Heart_GUI.*CheckButton$")) then
		-- a checkbutton
		if (this:GetChecked()) then
			value = 1
		else
			value = 0
		end
	else
		return
	end
	-- this one is kinda cool, but at the same time quite a hack =)
	local args = {}
	for index in string.gfind(variable, "%[\"?([^%[%]\"]+)\"?%]") do
		if ((string.find(index, "Heart_") or string.find(index, "C_")) and getglobal(index)) then
			-- we want to index the value of this variable, not the text itself
			index = getglobal(index)
		end
		table.insert(args, index)
	end
	if (table.getn(args) == 0) then
		if (pre == "C_update_player_data_time") then
			C_update_player_data_time = value
		end
	elseif (table.getn(args) == 1) then
		getglobal(pre)[args[1]] = value
	elseif (table.getn(args) == 2) then
		getglobal(pre)[args[1]][args[2]] = value
	elseif (table.getn(args) == 3) then
		getglobal(pre)[args[1]][args[2]][args[3]] = value
	elseif (table.getn(args) == 4) then
		getglobal(pre)[args[1]][args[2]][args[3]][args[4]] = value
	elseif (table.getn(args) == 5) then
		getglobal(pre)[args[1]][args[2]][args[3]][args[4]][args[5]] = value
	end
end

function Heart_Save_Profile(profile)
	-- save current settings to a profile
	   Heart_SavedProfiles[profile] = {}
	   for key, value in Heart_Config do
		if (type(value) == "table") then
			Heart_SavedProfiles[profile][key] = {}
			for key2, value2 in value do
				if (type(value2) == "table") then
					Heart_SavedProfiles[profile][key][key2] = {}
					for key3, value3 in value2 do
						if (type(value3) == "table") then
						else
							Heart_SavedProfiles[profile][key][key2][key3] = value3
						end
					end
				else
					Heart_SavedProfiles[profile][key][key2] = value2
				end
			end
		else
			Heart_SavedProfiles[profile][key] = value
		end
	   end
end

function Heart_Load_Profile(profile)
	-- load settings from profile
           local classes = {}
	   for class, data in Heart_Config["classes"] do
		classes[class] = {}
		for spell, settings in data do
			classes[class][spell] = {}
			for key, value in settings do
				classes[class][spell][key] = value
			end
		end
	   end
	   Heart_Config = Heart_SavedProfiles[profile]
	   Heart_Config["classes"] = classes
	   if (Heart_GUI:IsVisible()) then
		Heart_GUI:Hide()
		Heart_GUI:Show()
		if (Heart_GUIRaid:IsVisible()) then
			Heart_SetRaidChecked()
		end
	   end
end

function Heart_UpdateSpells()
	-- grab or update the spells we know
	Heart_party_heal_spells = {
		[C_Chain_heal] = 0,
		[C_Holy_nova] = 0,
		[C_Prayer_of_healing] = 0,
		[C_Tranquility] = 0
	}
	Heart_player_heal_spells = {
		[C_Blessing_of_protection] = 0,
		[C_Flash_heal] = 0,
		[C_Flash_of_light] = 0,
		[C_Greater_heal] = 0,
		[C_Heal] = 0,
		[C_Healing_touch] = 0,
		[C_Healing_wave] = 0,
		[C_Holy_light] = 0,
		[C_Holy_shock] = 0,
		[C_Lesser_heal] = 0,
		[C_Lesser_healing_wave] = 0,
		[C_Power_word_shield] = 0,
		[C_Regrowth] = 0,
		[C_Rejuvenation] = 0,
		[C_Renew] = 0,
		[C_Swiftmend] = 0,
		[C_Resurrection] = 0,
		[C_Redemption] = 0,
		[C_Rebirth] = 0,
		[C_Ancestral_Spirit] = 0,
	}
	if (C_my_class == C_Shaman) then
		Heart_player_heal_spells[C_Rebirth] = nil
	end  --fix Chinese translation problem
	Heart_Spells = {}
	local spellid = 1
	local spellname = GetSpellName(spellid, BOOKTYPE_SPELL)
	while (spellname) do
		if (Heart_heal_spells_text[spellname]) then
			local start, stop
			if (not Heart_Spells[spellname]) then
				Heart_Spells[spellname] = {}
				rank = 1
			else
				rank = table.getn(Heart_Spells[spellname]) + 1
			end
			if (Heart_party_heal_spells[spellname]) then
				Heart_party_heal_spell = spellname
			end
			Heart_Spells[spellname][rank] = (Heart_Spells[spellname][rank] or {})
			Heart_Spells[spellname][rank]["ID"] = spellid
			local mana, range, casttime, text = C_GetSpellData(spellid, BOOKTYPE_SPELL)
			Heart_Spells[spellname][rank]["Mana"] = mana
			Heart_Spells[spellname][rank]["CastTime"] = casttime
			local realcasttime = casttime
			if (C_my_class == C_Druid and spellname == C_Healing_touch) then
				local crap1, crap2, crap3, crap4, crank, mrank = GetTalentInfo(3, 3)
				realcasttime = realcasttime + crank * 0.1
			elseif (C_my_class == C_Priest and (spellname == C_Heal or spellname == C_Greater_heal)) then
				local crap1, crap2, crap3, crap4, crank, mrank = GetTalentInfo(2, 5)
				realcasttime = realcasttime + crank * 0.1
			elseif (C_my_class == C_Shaman and spellname == C_Healing_wave) then
				local crap1, crap2, crap3, crap4, crank, mrank = GetTalentInfo(3, 1)
				realcasttime = realcasttime + crank * 0.1
			end
			Heart_Spells[spellname][rank]["RealCastTime"] = realcasttime
			Heart_Spells[spellname][rank]["Range"] = range
			Heart_Spells[spellname]["Texture"] = GetSpellTexture(spellid, BOOKTYPE_SPELL)
			local a = {}
			start, stop, cooldown, a[1], a[2], a[3], a[4], a[5], a[6] = string.find(text, Heart_heal_spells_search[spellname] .. "(%d+%.?%d*)[^%d]+")
			if (not start) then
				start, stop, a[1], a[2], a[3], a[4], a[5], a[6] = string.find(text, Heart_heal_spells_search[spellname])
			end
			if (start) then
				for index, value in Heart_heal_spells_text[spellname] do
					Heart_Spells[spellname][rank][value] = a[index] / 1.0
				end
			end
			if (Heart_player_heal_spells[spellname]) then
				Heart_player_heal_spells[spellname] = 1
			end
		end
		spellid = spellid + 1
		spellname = GetSpellName(spellid, BOOKTYPE_SPELL)
	end
	Heart_party_heal_spells = nil
	for spell, value in Heart_player_heal_spells do
		if (value == 0) then
			Heart_player_heal_spells[spell] = nil
		end
	end
	Heart_SavedSpells = Heart_Spells
end

function Heart_RaidUnitIsChecked(unit)
	-- return 1 if we're in a raid and the given unit is checked for healing
	if (GetNumRaidMembers() <= 0) then
		return 1
	end
	if (not string.find(unit, "raid")) then
		return 1
	end
	if (string.find(unit, "pet")) then
		return 1
	end
	local slot = Heart_raid_cache[C_UnitName(unit)]
	if (not slot) then
		return 1
	end
	local start, stop, index = string.find(unit, "[^%d]*(%d+)[^%d]*")
	if (not index) then
		return 1
	end
	index = index / 1
	local name, rank, group = GetRaidRosterInfo(index)
	if (not group) then
		return 1
	end
	if (name ~= C_UnitName(unit)) then
		C_Print("Error: out of sync, \"" .. name .. "\" found, \"" .. C_UnitName(unit) .. "\" expected")
		return 1
	end
	if (Heart_Config["raid"][group][slot] == 1) then
		return 1
	end
end

function Heart_UnitID(person)
	-- check if person is in our party/raid
	if (not person or person == "") then
		return
	end
	if (person == C_UnitName("player")) then
		return "player"
	end
	for a = 1, GetNumRaidMembers() do
		if (UnitExists("raid" .. a) and person == C_UnitName("raid" .. a)) then
			return "raid" .. a
		elseif (UnitExists("raidpet" .. a) and person == C_UnitName("raidpet" .. a)) then
			return "raidpet" .. a
		end
	end
	for a = 1, GetNumPartyMembers() do
		if (UnitExists("party" .. a) and person == C_UnitName("party" .. a)) then
			return "party" .. a
		elseif (UnitExists("partypet" .. a) and person == C_UnitName("partypet" .. a)) then
			return "partypet" .. a
		end
	end
	return
end

function Heart_IsMT(unit)
    for key,value in pairs(CT_RA_MainTanks or (oRA_MainTank and oRA_MainTank.MainTankTable or nil) or {}) do
        if value == C_UnitName(unit) then
           return true 
        end
    end
    return
end

function Heart_GetActionSpell(slot)
	C_TooltipTextLeft1:SetText()
	C_TooltipTextRight1:SetText()
	C_Tooltip:SetAction(slot)
	local start, stop, name, rank
	name = C_TooltipTextLeft1:GetText()
	rank = C_TooltipTextRight1:GetText()
	start, stop, rank = string.find((rank or ""), "(%d+)")
	rank = (rank or 1) / 1.0
	return (name or ""), rank
end

function Heart_Receive(author, message)
	if (author == C_my_name or not C_GetUnitID(author)) then
		-- either me or this player ain't in my party/raid
		return
	end
	local start, stop, what, who, spell, heal, hot, casttime, timeleft = string.find(message, "^(.+), (.+), (.+), (%d+%.?%d*), (%d+%.?%d*), (%d+%.?%d*), (%d+%.?%d*)")
	if (not start) then
		-- don't understand this player :\
		return
	end
	if (not C_GetUnitID(who)) then
		-- no clue who this person is
		return
	end
	Heart_healing[who] = (Heart_healing[who] or {})
	if (what == "Update") then
		-- general update:
		-- + someone started healing
		-- + someone updated their casting time
		-- + someone got delayed
		-- we just update the data
		heal = heal / 1.0
		hot = hot / 1.0
		casttime = casttime / 1.0
		timeleft = timeleft / 1.0
		if (Heart_healing[who][author] and Heart_healing[who][author]["Bar"]) then
			local bar = getglobal("Heart_GUIHealBars" .. Heart_healing[who][author]["Bar"])
			bar:SetMinMaxValues(666, 1337)
			bar:Hide()
		end
		Heart_healing[who][author] = {
			["CastTime"] = casttime,
			["Heal"] = heal,
			["HealingOverTime"] = hot,
			["Name"] = name,
			["Spell"] = spell,
			["Status"] = "Active",
			["TimeLeft"] = timeleft
		}
	else
                if (Heart_healing[who][author] and Heart_healing[who][author]["Status"] == "Active") then
			if (Heart_healing[who][author]["Spell"] == Heart_rez_spells[spell] and what == "Stop") then
                           if Heart_awaiting_rez[who] then
                              Heart_awaiting_rez[who]["wait_time"] = 120;
                           end
                        end
                        Heart_healing[who][author]["Status"] = what
			Heart_healing[who][author]["TimeLeft"] = -1
		end
	end
end

--    ###################
--   #     Mouse       #
--  #       &         #
-- # Keybind Healing #
--###################

function Heart_MouseHeal(unit, button)
        if (Heart_Config["enable_mouse"] == 0) then
                return
	elseif (not Heart_IsHealModifierKeyDown("heal_enough_modifier") and not Heart_IsHealModifierKeyDown("heal_max_modifier")) or (Heart_IsHealModifierKeyDown("heal_none_modifier")) then
		-- we haven't ordered a heal
		return
        elseif (Heart_casting_spell) then
		if (Heart_Config["safe_cancel"] == 0 or Heart_GetOverheal() > Heart_Config["max_overheal"]) then
			SpellStopCasting()
			return
		end
        end
        if (CursorHasItem() or CursorHasMoney() or SpellIsTargeting()) then
               if (CursorHasItem() or CursorHasMoney()) then
                  DropItemOnUnit(unit)
                  return
               end
               return
        end
	button = string.lower(button)
	if (not button or not unit or not Heart_Config["mouse"][button]) then
		return
	end
	local spell = Heart_Config["mouse"][button]["SpellOrClass"]
	if (not Heart_Spells) then
		Heart_UpdateSpells()
	end
	local healvalue
	if (Heart_IsHealModifierKeyDown("heal_enough_modifier") and not Heart_IsHealModifierKeyDown("heal_max_modifier")) then
		-- not tankhealing, set healvalue
		healvalue = Heart_GetHealValue(unit)
		if (healvalue < UnitHealthMax(unit) * (1.0 - Heart_Config["min_heal_threshold"])) then
			return 1
		end
	end
	if (Heart_Spells[spell]) then
		-- a simple spell
		local rank = Heart_Config["mouse"][button]["Rank"]
		Heart_Heal(unit, spell, rank, healvalue)
	else
		-- a class
		Heart_HealUsingClass(unit, spell, healvalue)
	end
	return 1
end

function Heart_KeyClicks(button)
	if (not button) then
		return
	end
	local unit
        local frame = GetMouseFocus():GetName()
        if (string.find(frame, "PlayerFrame", 1, true) or string.find(frame, "Perl_Player") or string.find(frame, "oUF_Player"))then
		unit = "player"
	elseif (string.find(frame, "TargetFrame",1, true) or (string.find(frame, "oUF_Target"))) then
		unit = C_AKA("target")
	elseif (string.find(frame, "Perl_Target")) then
                if (string.find(GetMouseFocus():GetParent():GetParent():GetName(), "Perl_Target_Frame",1 ,true)) then
                       unit = C_AKA("target")
                elseif (string.find(GetMouseFocus():GetParent():GetParent():GetName(), "Perl_Target_Target_Frame",1 ,true)) then
		       unit = C_AKA("targettarget")
                elseif (string.find(GetMouseFocus():GetParent():GetParent():GetName(), "Perl_Target_Target_Target_Frame",1 ,true)) then
		       unit = C_AKA("targettargettarget")
		end
	elseif (string.find(frame, "Sparty")) then
	       unit = string.sub(GetMouseFocus():GetName(), 2)
	elseif (string.find(frame, "Starget")) then
	       unit = string.sub(GetMouseFocus():GetName(), 2)
	elseif (string.find(frame, "Splayer"))then
	       unit = string.sub(GetMouseFocus():GetName(), 2)
        elseif (string.find(frame, "Perl_party")) then
                local name = GetMouseFocus():GetName()
                id = string.sub(name, 11, 11)
                unit = "party"..id
        elseif (string.find(frame, "Perl_Party")) then
                local name = GetMouseFocus():GetName()
                id = string.sub(name, 23, 23)
                unit = "party"..id
        elseif (string.find(frame, "Nurfed_") or string.find(frame, "DUF_") or string.find(frame, "MGp") or string.find(frame, "MGt") or string.find(frame, "MGr") or string.find(frame, "oUF_Party") or string.find(frame, "oUF_TargetsTarget")) then
                if (getglobal(frame).unit) then
                    unit = getglobal(frame).unit
                end
        elseif (string.find(frame, "RaidPullout(%d?)Button")) then
		unit = (GetMouseFocus().unit or GetMouseFocus():GetParent().unit)
	elseif(string.find(frame, "CT_RA_EmergencyFrameFrame(%d?)ClickFrame")) then
                unit = getglobal(frame).unitid
	elseif(string.find(frame, "SqueakyBar(%d?)")) then
                local frametext = frame.."_Text"
                local text= getglobal(frametext):GetText()
                local nameend = string.find(text, ":")
                local name = string.sub(text, 1,(nameend-1))
                if name == C_UnitName("player") then
                        unit = "player"
                elseif GetNumRaidMembers()>0  then
                       for i = 1, GetNumRaidMemebers() do
                           if name == C_UnitName("raid"..i) then
                           unit = "raid"..i
                           break
                           end
                       end
                elseif GetNumPartyMembers()>0 then
                       for i = 1, GetNumPartyMemebers() do
                           if name == C_UnitName("party"..i) then
                           unit = "party"..i
                           break
                           end
                       end
                end
        elseif(string.find(frame, "Perl_Raid")) then
                local id = GetMouseFocus():GetID()
                if id == 0 then id = GetMouseFocus():GetParent():GetParent():GetID() end
                unit = "raid"..id
        elseif(string.find(frame, "CT_RAMember")) then
                local id = GetMouseFocus():GetParent():GetParent():GetID()
                unit = "raid"..id
        elseif(string.find(frame, "CT_RAMTGroupMember")) then
                if(string.find(frame, "MTTT")) then
                unit = (GetMouseFocus()).id
                else
                    local name = GetMouseFocus():GetParent():GetParent():GetName()
                    local id = tonumber(string.sub(name, 19, 20))
                  for k, v in CT_RA_MainTanks do
                    if k == id then
		       for i = 1, GetNumRaidMembers(), 1 do
				if ( C_UnitName("raid" .. i) == CT_RA_MainTanks[k] ) then
					unit = "raid" .. i
					break
				end
	              end
                    end
                  end
                end
        elseif(string.find(frame, "CT_AssistFrame")) then
                unit = "targettarget"
        elseif(UnitExists("mouseover")) then
		unit = C_AKA("mouseover")
	end
	Heart_MouseHeal(unit, button)
end

function Heart_Tank_Clicks(num, button)
         local id = tonumber(num)
         if (IsAddOnLoaded("CT_RaidAssist")) then
	         for k, v in CT_RA_MainTanks do
                     if k == id then
		        for i = 1, GetNumRaidMembers(), 1 do
				if ( C_UnitName("raid" ..i) == CT_RA_MainTanks[k] ) then
					local unit = "raid" .. i
					Heart_MouseHeal(unit, button)
				end
	                end
                      end
                end
          elseif (IsAddOnLoaded("oRA")) then
	         for k, v in oRA_MainTank.MainTankTable do
                     if k == id then
		        for i = 1, GetNumRaidMembers(), 1 do
				if ( C_UnitName("raid" ..i) == oRA_MainTank.MainTankTable[k] ) then
					local unit = "raid" .. i
					Heart_MouseHeal(unit, button)
				end
	                end
                      end
                end
          end
end

function Heart_Party_Clicks(unit, button)
         if UnitExists(unit) then
            Heart_MouseHeal(unit, button)
         end
end

--   ################
--  # Core Healing #
-- #   Functions  #
--################

function Heart_Heal(unit, spell, rank, healvalue, noscale)
        local selfcasting = GetCVar("autoSelfCast");
        SetCVar("autoSelfCast",0);
	-- heal the specified unit with the given spell & rank (scale down if necessary)
	if (not unit or not spell or not rank or not UnitExists(unit)) then
		SetCVar("autoSelfCast",selfcasting)
                return
	end
	if (Heart_casting_spell) then
		if (Heart_Config["safe_cancel"] == 0 or Heart_GetOverheal() > Heart_Config["max_overheal"]) then
			SpellStopCasting()
		end
		SetCVar("autoSelfCast",selfcasting)
		return 1
	end
	if (not Heart_Spells) then
		Heart_UpdateSpells()
	end
	if (not Heart_Spells[spell] or not Heart_Spells[spell][rank]) then
	        SetCVar("autoSelfCast",selfcasting)
		return
	end
	if (GetSpellCooldown(Heart_Spells[spell][rank]["ID"], BOOKTYPE_SPELL) > 0) then
		-- cooldown
		SetCVar("autoSelfCast",selfcasting)
		return
	end
	C_UpdatePlayerData()
	if ( (not(Heart_rez_spells[spell])) and (not Heart_CanHeal(unit)) ) then
	        SetCVar("autoSelfCast",selfcasting)
		return
	end
	if (Heart_rez_spells[spell]) and (not Heart_CanRez(unit))  then
	        SetCVar("autoSelfCast",selfcasting)
	        return
        end
	if (spell == C_Power_word_shield and (C_UnitGotDebuff(unit, C_Weakened_soul) or C_UnitGotBuff(unit, C_Ice_barrier) or C_UnitGotBuff(unit, C_Power_word_shield))) then
		-- casting shield on someone with weakened soul, can't allow that
		SetCVar("autoSelfCast",selfcasting)
		return
	end
	if ((spell == C_Divine_shield or spell == C_Divine_protection or spell == C_Blessing_of_protection) and C_UnitGotDebuff(unit, C_Forbearance)) then
		-- casting paladin shield on someone who got forbearance
		SetCVar("autoSelfCast",selfcasting)
		return
	end
	if ((spell ~= C_Greater_heal and  C_UnitGotBuff(unit, spell)) and ((UnitHealth(unit) / UnitHealthMax(unit) > Heart_Config["hot_heal_threshold"]) and (spell == C_Regrowth or spell == C_Renew or spell == C_Rejuvenation))) then
		-- casting rejuvenation/renew on someone who already got it, return
		-- will also return if we're not target healing and trying to cast regrowth on someone who got the regrowth buff
		SetCVar("autoSelfCast",selfcasting)
		return
	end
	if (spell == C_Swiftmend and not (C_UnitGotBuff(unit, C_Regrowth) or C_UnitGotBuff(unit, C_Rejuvenation))) then
		-- trying to cast swiftmend on someone who don't have regrowth/rejuvenation, return
		SetCVar("autoSelfCast",selfcasting)
		return
	end
	if ((C_my_class == C_Druid and C_UnitGotBuff("player", C_Clearcasting)) or (C_my_class == C_Priest and C_UnitGotBuff("player", C_Inner_focus))) then
		-- clearcasting/inner focus, use highest rank
		rank = table.getn(Heart_Spells[spell])
	else
		while (rank > 0 and Heart_Spells[spell][rank]["Mana"] > UnitMana("player")) do
			-- not enough mana, scale down
			rank = rank - 1
		end
	end
	while (Heart_spell_level[spell] and rank > 0 and UnitLevel(unit) < Heart_spell_level[spell][rank]) do
		-- unit is too low level, scale down
		rank = rank - 1
	end
	if (rank == 0) then
		-- not enough mana
		SetCVar("autoSelfCast",selfcasting)
		return
	end
	if (healvalue and not C_UnitGotBuff("player", C_Clearcasting) and (not (noscale and noscale == 1))) then
		-- scale down so we use the "correct" rank
		rank = Heart_ScaleSpell(unit, spell, rank, healvalue)
	end
	Heart_error_message = nil
	Heart_check_for_client_error = nil
	if (UnitExists("target") and (spell == C_Holy_shock or UnitIsFriend("player", "target")) and not UnitIsUnit(unit, "target")) then
		Heart_target_last_target = 1
		if (unit == "targettarget") then
			TargetUnit(unit)
		else
			ClearTarget()
		end
	end
	local checkname, checkrank = GetSpellName(Heart_Spells[spell][rank]["ID"], BOOKTYPE_SPELL)
	local start, stop, checkrank = string.find((checkrank or ""), "(%d+)")
	checkrank = (checkrank or 1) / 1.0
	if (checkname ~= spell or checkrank ~= rank) then
		Heart_UpdateSpells()
	end
	CastSpell(Heart_Spells[spell][rank]["ID"], BOOKTYPE_SPELL)
	if (SpellCanTargetUnit(unit)) then
		SpellTargetUnit(unit, true)
	end
	SetCVar("autoSelfCast",selfcasting)
	if (Heart_error_message) then
		-- ok, so we got an error, figure out what we should do about it
		if (Heart_error_moving[Heart_error_message]) then
			-- we're moving, only instant casts allowed
			Heart_only_instant_spells = 1
		end
		for error,msg in Heart_error_unable do
                if (string.find(Heart_error_message, msg)) then
		       return 1
		end
		end
	end
	if (Heart_check_for_client_error) then
		-- client detected an error (are we sitting?)
		if (Heart_target_last_target) then
			TargetLastTarget()
			Heart_target_last_target = nil
		end
		return
	end
	if (SpellIsTargeting()) then
		-- hmm, we really shouldn't be targeting anymore. another error?
		SpellStopTargeting()
		if (Heart_target_last_target) then
			TargetLastTarget()
			Heart_target_last_target = nil
		end
		return
	end
	if (Heart_target_last_target) then
		TargetLastTarget()
		Heart_target_last_target = nil
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
	return 1
end

function Heart_HealUsingClass(unit, class, healvalue)
	if (not unit or not class or not Heart_Config["classes"][class]) then
		return
	end
	local percent = (UnitHealth(unit) / UnitHealthMax(unit)) * 100
	if (healvalue and (percent / 100) > Heart_Config["min_heal_threshold"]) then
		-- not target healing, and unit got more hp than min heal threshold
		return
	end
	local spell = 1
	local spellstried = {}
	local lastpercent
	local attachment
	while (spell) do
		spell = nil
		lastpercent = nil
		local curspell = nil
		local rank = nil
		local noscale = nil
		for curpercent, data in Heart_Config["classes"][class] do
                        curspell = data["Spell"]
			if (not spellstried[curspell] and (not spell or (curpercent >= percent and lastpercent < percent) or (lastpercent > percent and curpercent >= percent and curpercent < lastpercent))) then
				-- ^^ world record
				-- it "simply" figures out which spell to use
				if (not spell or (lastpercent and curpercent ~= lastpercent)) then
					spell = curspell
				end
				lastpercent = curpercent
				spell = curspell
				rank = data["Rank"]
				attachment = nil
	                        noscale = data["Scale"]
	                        if data["Attachment"] then
	                           attachment = data["Attachment"]
	                        end
			end
		end
		if (spell) then
			if (healvalue and lastpercent < percent) then
				-- the spell with the highest percent is lower than the players hp%
				return
			end
			if (not rank) then
				rank = table.getn(Heart_Spells[spell])
			end
			if (attachment and not (Heart_only_instant_spells)) then
			   local attachrank = table.getn(Heart_Spells[attachment])
			   if not(Heart_attachment_global_cooldown[attachment] and Heart_attachment_has_target[attachment]) then
			      if GetSpellCooldown(Heart_Spells[attachment][attachrank]["ID"], BOOKTYPE_SPELL) > 0 then
			      else
			          CastSpell(Heart_Spells[attachment][attachrank]["ID"], BOOKTYPE_SPELL)
			          SpellStopCasting()
			      end
                           else
                              if (Heart_Heal(unit, attachment, attachrank, healvalue)) then
                                           return 1
                              end
                           end   
			end
			if ((not Heart_only_instant_spells or Heart_Spells[spell][rank]["CastTime"] == 0) and Heart_Heal(unit, spell, rank, healvalue, noscale)) then
				-- seem to be healing
				Heart_only_instant_spells = nil
				return 1
			end
			spellstried[spell] = 1
		end
	end
	Heart_only_instant_spells = nil
	return
end
      
function Heart_ActionHeal(spell, rank)
	if (Heart_casting_spell) then
		if (Heart_Config["safe_cancel"] == 0 or Heart_GetOverheal() > Heart_Config["max_overheal"]) then
			SpellStopCasting()
		end
		return 1
      	end
	if (Heart_IsHealModifierKeyDown("heal_self_modifier") or Heart_IsHealModifierKeyDown("heal_targettarget_modifier") or (UnitExists("target") and UnitIsFriend("player", "target")) or (Heart_Tank and Heart_Tank["Name"]) or enemy_with_friendtarget()) then
                    -- seems like we want to heal this person
		    local unit = C_AKA("target")
		    local healvalue = nil
		    if (Heart_Tank and Heart_Tank["Name"]) and not((Heart_IsHealModifierKeyDown("heal_self_modifier")) or (Heart_IsHealModifierKeyDown("heal_targettarget_modifier") and UnitExists("target"))) then
		       if (Heart_Tank["Name"] ~= C_UnitName(Heart_Tank["Unit"])) then
			  local aka = C_UnitName(Heart_Tank["Name"])
			  if (aka) then
				-- somehow our tank got a new id
				Heart_Tank["Unit"] = aka
                                unit = aka
                          else
				-- our tank is gone :\
				C_Print(Heart_Tank["Name"] .. " is not in the party/raid. Tank mode is off.")
				Heart_Tank = {
				               ["Name"] = nil,
				               ["Unit"] = nil
                                }
			  end
		       end
		       unit = Heart_Tank["Unit"]
		    elseif (Heart_IsHealModifierKeyDown("heal_self_modifier")) then
			unit = "player"
		    elseif ((Heart_IsHealModifierKeyDown("heal_targettarget_modifier") and UnitExists("target")) or enemy_with_friendtarget()) then
			-- heal "targettarget"
					if (not UnitExists("targettarget") or not Heart_CanHeal("targettarget")) then
				-- unable to heal targettarget, make sure we don't heal "target"
				return 1
			end
			unit = C_AKA("targettarget")
		    end
		    if (not rank) then
                        if (Heart_IsHealModifierKeyDown("heal_max_modifier") or Heart_Config["always_tank_target"] == 1) then
                        else
                                healvalue = Heart_GetHealValue(unit)
                        end
			Heart_HealUsingClass(unit, spell, healvalue)
		    else
                        if (Heart_IsHealModifierKeyDown("heal_max_modifier") or Heart_Config["always_tank_target"] == 1) then
                        else
                                healvalue = Heart_GetHealValue(unit)
                        end
			Heart_Heal(unit, spell, rank, healvalue)
		    end
		return 1
	elseif (not UnitExists("target") or not UnitIsFriend("player", "target")) then
		-- hostile target or no target & healing spell: heal most wounded
		Heart_HealMostWounded(spell, rank)
		-- we should never call the original UseAction if we've hooked this spell
		return 1
	end
	return
end

function enemy_with_friendtarget()
	if UnitExists("target") and UnitIsEnemy("player","target") then
		if UnitExists("targettarget") then
			return UnitIsFriend("player","targettarget")
		end
	end
	return nil
end
