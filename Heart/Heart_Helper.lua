--   ##################
--  # Healing Helper #
-- #   Functions    #
--##################

function Heart_HealMostWounded(spell, rank)
	-- heal the most wounded
	if (Heart_casting_spell) then
		if (Heart_Config["safe_cancel"] == 0 or Heart_GetOverheal() > Heart_Config["max_overheal"]) then
			SpellStopCasting()
		end
		return 1
	end
	if (not Heart_Spells) then
		Heart_UpdateSpells()
	end
	if (not ((rank and Heart_Spells[spell]) or (not rank and Heart_Config["classes"][spell]))) then
		-- unable to find spell or class
		return
	end
	if (rank and GetSpellCooldown(Heart_Spells[spell][rank]["ID"], BOOKTYPE_SPELL) ~= 0) then
		-- cooldown on the spell
		return
	elseif (not rank) then
		local allcooldown = 1
		for thisclass, data in Heart_Config["classes"][spell] do
			if (GetSpellCooldown(Heart_Spells[data["Spell"]][1]["ID"], BOOKTYPE_SPELL) == 0) then
				allcooldown = nil
			end
		end
		if (allcooldown) then
			-- cooldown on all the spells in the class
			return
		end
	end
	Heart_most_wounded_id = 1
	Heart_most_wounded = (Heart_most_wounded or {})
	C_UpdatePlayerData()
	
	local players = GetNumRaidMembers()
	local por = "raid"
	if (players == 0) then
		players = GetNumPartyMembers()
		por = "party"
		Heart_SetMostWoundedData("player")
		Heart_SetMostWoundedData("pet")
	end
	for a = 1, players do
		Heart_SetMostWoundedData(por .. a)
		Heart_SetMostWoundedData(por .. "pet" .. a)
	end

	-- erase old entries
	for id = Heart_most_wounded_id, table.getn(Heart_most_wounded) do
		Heart_most_wounded[id] = nil
	end

	-- sort the list
	table.sort(Heart_most_wounded, Heart_SortMostWoundedAlgorithm)

	-- and try to heal people in the right order
	for id = 1, table.getn(Heart_most_wounded) do
		if (not Heart_target_last_target and UnitExists("target") and UnitIsFriend("player", "target")) then
			Heart_target_last_target = 1
			ClearTarget()
		end
		local unit = Heart_most_wounded[id]["Unit"]
		if (not rank) then
			-- we were given a class instead of a spell
			if (Heart_HealUsingClass(unit, spell, Heart_most_wounded[id]["Heal"])) then
				if (Heart_target_last_target) then
					TargetLastTarget()
					Heart_target_last_target = nil
				end
				return 1
			end
		elseif ((not Heart_only_instant_spells or Heart_Spells[spell][rank]["CastTime"] == 0) and Heart_Heal(unit, spell, rank, Heart_most_wounded[id]["Heal"])) then
			-- we seem to be healing (at least client didn't detect errors)
			if (Heart_target_last_target) then
				TargetLastTarget()
				Heart_target_last_target = nil
			end
			Heart_only_instant_spells = nil
			return 1
		end
	end
	if (Heart_target_last_target) then
		TargetLastTarget()
		Heart_target_last_target = nil
	end
	Heart_only_instant_spells = nil
	return
end

function Heart_SortMostWoundedAlgorithm(a, b)
	-- sort algorithm for the list
	return (a["PriorityValue"] > b["PriorityValue"])
end

function Heart_SortAwaitingRez(a, b)
	-- sort algorithm for the list
	return (a["priority"] > b["priority"])
end

function Heart_SetMostWoundedData(unit)
	if ((Heart_soft_lock_player and Heart_soft_lock_player == unit) or not Heart_CanHeal(unit) or (string.find(unit, "pet") and UnitIsCharmed(unit) and Heart_Config["heal_charmed"] == 0)) then
		return
	end
	local healvalue = Heart_GetHealValue(unit)
	if (healvalue < UnitHealthMax(unit) * (1.0 - Heart_Config["min_heal_threshold"])) then
		return
	end
	local priority = Heart_GetPriority(unit)
	if (priority <= 0 or healvalue <= 0) then
		return
	end
	local priorityvalue
	if (Heart_Config["heal_strategy"] == 2) then
		-- heal least percent life left
		priorityvalue = priority * (healvalue / UnitHealthMax(unit))
	elseif (Heart_Config["heal_strategy"] == 3) then
		-- heal most hitpoints missing
		priorityvalue = priority * healvalue
	else
		-- heal least hitpoints left (default)
		local divideby = (UnitHealthMax(unit) - healvalue)
		if (divideby < 1) then
			divideby = 1
		end
		priorityvalue = priority * (666 / divideby)
	end
	Heart_most_wounded[Heart_most_wounded_id] = (Heart_most_wounded[Heart_most_wounded_id] or {})
	Heart_most_wounded[Heart_most_wounded_id]["Heal"] = healvalue
	Heart_most_wounded[Heart_most_wounded_id]["PriorityValue"] = priorityvalue
	Heart_most_wounded[Heart_most_wounded_id]["Unit"] = unit
	Heart_most_wounded_id = Heart_most_wounded_id + 1
end

function Heart_ScaleSpell(unit, spell, rank, heal)
	-- scale down a spell to restore ~100%
	if (Heart_Config["scale_spells"] == 0 or not unit or not spell or not rank or Heart_dont_scale[spell] or (Heart_dont_scale_hots[spell] and Heart_Config["scale_hots"]==0)) then
                return rank
	end
	if heal<0 then
		heal= heal*0.3
	end
	heal = heal * Heart_Config["heal_power"]
	
	while (rank > 1 and heal < Heart_GetSpellHealing(unit, spell, rank - 1)) do
		rank = rank - 1
	end
	return rank
end

function Heart_GetPriority(unit)
	-- get this units priority
	local priority = 1
	if (GetNumRaidMembers() >0 and (not Heart_RaidUnitIsChecked(unit))) then
		-- we're in a raid and this unit is not checked for healing
		-- set priority to the "unchecked priority"
		priority = priority * Heart_Config["unchecked_priority"]
		-- we still want to apply the other priorities
	end
	if (UnitIsUnit("player", unit)) then
		-- me!
		priority = priority * Heart_Config["player_priority"]
	elseif (UnitInParty(unit) and not string.find(unit, "pet")) then
		-- someone in my party
		priority = priority * Heart_Config["party_priority"]
	elseif (UnitInRaid(unit)) then
		-- someone in my raid
		priority = priority * Heart_Config["raid_priority"]
	else
		-- a pet(?)
		priority = priority * Heart_Config["pet_priority"]
	end
	if (not UnitIsUnit("player", unit)) then
		if (Heart_Config["shapeshifted_druids"] == 1 and UnitClass(unit) == C_Druid) then
			if (UnitPowerType(unit) == 0) then
				-- caster form
				priority = priority * Heart_Config["class_priority"][C_Druid];
			elseif (UnitPowerType(unit) == 1) then
				-- bear form
				priority = priority * Heart_Config["class_priority"][C_Warrior];
			else
				-- hopefully cat form
				priority = priority * Heart_Config["class_priority"][C_Rogue];
			end
		else
			priority = priority * Heart_Config["class_priority"][UnitClass(unit)];
		end
	end
	if (priority <= 0) then
		return 0
	end
	if (Heart_IsMT(unit)) then
	   priority = priority + Heart_Config["MT_priority"]
        end
	for buff, prioritychange in Heart_Config["buff_affect_priority"] do
		if (C_UnitGotBuff(unit, buff)) then
			priority = priority - prioritychange
		end
	end
	for debuff, prioritychange in Heart_Config["debuff_affect_priority"] do
		if (C_UnitGotDebuff(unit, debuff)) then
			priority = priority + prioritychange
		end
	end
	return priority
end

function Heart_GetSpellHealing(unit, spell, rank)
	-- figure out how much this spell will heal
	if (not Heart_Spells) then
		Heart_UpdateSpells()
	end
	local healbonus = Heart_GetHealBonus(unit, spell, rank)
	if (spell == C_Regrowth) then
		healbonus = healbonus / 2
	end
	if (spell == C_Swiftmend) then
		local data = C_UnitGotBuff(unit, C_Rejuvenation)
		if (data) then
			local start, stop
			Heart_temp_table = (Heart_temp_table or {})
			Heart_temp_table2 = (Heart_temp_table2 or {})
			start, stop, Heart_temp_table[1], Heart_temp_table[2] = string.find(data["Text"], Heart_hot_search)
			for index, value in Heart_hot_text do
				Heart_temp_table2 = (Heart_temp_table2 or {})
				Heart_temp_table2[value] = Heart_temp_table[index] / 1.0
			end
			local heal = Heart_temp_table2["Heal"] * 5 + healbonus * 12 / Heart_bonus_instant_divide
			return heal, heal, heal, 0
		end
		data = C_UnitGotBuff(unit, C_Regrowth)
		-- if no reju then it eats regrowth if it's on the player
		if (data) then
			local start, stop
			Heart_temp_table = (Heart_temp_table or {})
			Heart_temp_table2 = (Heart_temp_table2 or {})
			start, stop, Heart_temp_table[1], Heart_temp_table[2] = string.find(data["Text"], Heart_hot_search)

			for index, value in Heart_hot_text do
				Heart_temp_table2 = (Heart_temp_table2 or {})
				Heart_temp_table2[value] = Heart_temp_table[index] / 1.0
			end
			local heal = Heart_temp_table2["Heal"] * 6 + healbonus * 15 / Heart_bonus_instant_divide
			return heal, heal, heal, 0
		end
	end
	local heal = (Heart_Spells[spell][rank]["Heal"] or 0)
	local healmin = (Heart_Spells[spell][rank]["HealMin"] or 0)
	local healmax = (Heart_Spells[spell][rank]["HealMax"] or 0)
	local hot = (Heart_Spells[spell][rank]["HealingOverTime"] or 0)
	local realcasttime = (Heart_Spells[spell][rank]["RealCastTime"] or 0)
	if (realcasttime > Heart_bonus_divide) then
		realcasttime = Heart_bonus_divide
	end
	local bonus = healbonus * realcasttime / Heart_bonus_divide
	if (C_player_in_battle) then
		heal = heal + healmin
	else
		heal = heal + healmax
	end
	heal = heal + bonus
	healmin = healmin + bonus
	healmax = healmax + bonus


	local hot_multiply = Heart_Config["hot_multiply"]
	if (C_player_in_combat) then
		hot_multiply = Heart_Config["hot_multiply_battle"]
	end
	hot = hot * hot_multiply
	if (hot > 0) then
		local duration = (Heart_hot_duration[spell] or 0)
		if (duration > Heart_bonus_instant_divide) then
			duration = Heart_bonus_instant_divide
		end
		hot = hot + healbonus * Heart_hot_duration[spell] / Heart_bonus_instant_divide
	end
	heal = heal + hot
	if (C_my_class == C_Paladin and (spell == C_Flash_of_light or spell == C_Holy_light) and C_UnitGotBuff("player", C_Divine_favor)) then
		-- 100% crit chance
		heal = heal * Heart_critical_bonus
		healmin = healmin * Heart_critical_bonus
		healmax = healmax * Heart_critical_bonus
	end
	if (C_UnitGotBuff("player", C_Power_infusion)) then
		heal = heal * 1.2
		healmin = healmin * 1.2
		healmax = healmax * 1.2
		hot = hot * 1.2
	end
	--casttime debuff
	if (C_player_in_combat) then
		if C_UnitName(unit)~=nil and C_UnitName(unit)==Heart_Tank["Name"] then
			heal=heal-Heart_Spells[spell][rank]["CastTime"]*Heart_Config["MTCastTime_Debuff"]
		else 
			heal=heal-Heart_Spells[spell][rank]["CastTime"]*Heart_Config["CastTime_Debuff"]
		end
	end
	
	return heal, healmin, healmax, hot
end

function Heart_GetOverheal()
	-- how much are goig to overheal?
	local healingtarget = Heart_i_am_healing
	if (not healingtarget or not Heart_healing[healingtarget] or not Heart_healing[healingtarget][C_my_name]) then
		return 0
	end
	local unit = C_GetUnitID(healingtarget)
	if (not unit) then
		-- uhm, this is weird
		return 0
	end
	local uhm = UnitHealthMax(unit)
	local uh = UnitHealth(unit)
	if (uhm == 100) then
		-- probably percent instead of hp
		uhm = uhm * UnitLevel(unit) * Heart_class_hp_per_level[UnitClass(unit)] / 100
		uh = uh * UnitLevel(unit) * Heart_class_hp_per_level[UnitClass(unit)] / 100
	end
	-- and how much hot the player will receive from hots and other healers when tankhealing
	if (not Heart_healing[healingtarget][C_my_name]["TankHealing"]) then
		if (uh / uhm > Heart_Config["hot_heal_threshold"]) then
			uh = uh + Heart_GetHealingOverTime(unit)
		end
		uh = uh + Heart_GetOtherHealing(unit, Heart_healing[healingtarget][C_my_name]["TimeLeft"])
	end
	-- then see how much i heal
	local heal = Heart_healing[healingtarget][C_my_name]["Heal"]
	if (heal == 0) then
		-- to prevent infinite
		heal = 1
	end
	local overheal = (uh + heal - uhm) / heal
	if (overheal > 1) then
		-- due to hots & others healing it's possible to get more than 100% overhealing :o
		overheal = 1
	elseif (overheal < 0) then
		-- underhealing is not interesting :)
		overheal = 0
	end
	return overheal
end

function Heart_GetHealValue(unit)
	-- figure out how much healing this unit should get
	local hpmissing = UnitHealthMax(unit) - UnitHealth(unit)
	if (UnitHealthMax(unit) == 100) then
		-- looks like we don't know this players hp
		hpmissing = hpmissing * UnitLevel(unit) * Heart_class_hp_per_level[UnitClass(unit)] / 100
	end
	local hot = Heart_GetHealingOverTime(unit)
	local other = Heart_GetOtherHealing(unit)
	return hpmissing - other - hot
end

function Heart_GetHealingOverTime(unit)
	-- check how much hot this player will receive
	local hot = 0
	Heart_temp_table = (Heart_temp_table or {})
	Heart_temp_table2 = (Heart_temp_table2 or {})
	for buff, duration in Heart_hot_duration do
		local data = C_UnitGotBuff(unit, buff)
		if (data and data["Text"]) then
			local start, stop
			start, stop, Heart_temp_table[1], Heart_temp_table[2] = string.find(data["Text"], Heart_hot_search)
			if (start) then
				Heart_temp_table2["Heal"] = nil
				Heart_temp_table2["Interval"] = nil
				for index, value in Heart_hot_text do
					Heart_temp_table2[value] = (Heart_temp_table2[value] or 0) + Heart_temp_table[index]
				end
				if (Heart_temp_table2["Heal"] and Heart_temp_table2["Interval"]) then
					local timeleft = duration - data["Time"]
					if (timeleft > 0) then
						hot = hot + (timeleft * Heart_temp_table2["Heal"] / Heart_temp_table2["Interval"])
					end
				end
			end
		end
	end
	local hot_multiply = Heart_Config["hot_multiply"]
	if (C_player_in_battle) then
		hot_multiply = Heart_Config["hot_multiply_battle"]
	end
	hot = hot * hot_multiply
	return hot
end

function Heart_GetOtherHealing(unit, maxtimeleft)
	-- fetch how much other healers are healing this unit
	local healing = 0
	local name = C_UnitName(unit)
	if (string.find(unit, "pet")) then
		-- pet
		if (unit == "pet") then
			name = C_UnitName("player") .. "-" .. name
		else
			name = C_UnitName(string.gsub(unit, "pet", "")) .. "-" .. name
		end
	end
	maxtimeleft = (maxtimeleft or 666)
	local hot_multiply = Heart_Config["hot_multiply"]
	if (C_player_in_battle) then
		hot_multiply = Heart_Config["hot_multiply_battle"]
	end
	if (Heart_healing[name]) then
		for healer, data in Heart_healing[name] do
			if (healer ~= C_my_name and Heart_healing[name][healer]["Status"] == "Active" and Heart_healing[name][healer]["TimeLeft"] < maxtimeleft) then
				healing = healing + Heart_healing[name][healer]["Heal"]
				healing = healing + Heart_healing[name][healer]["HealingOverTime"] * hot_multiply
			end
		end
	end
	return healing
end

function Heart_GetOtherRezing(player)
        local name = C_UnitName(player)
        if (Heart_healing[name]) then
           for rezer, data in Heart_healing[name] do
               if (Heart_rez_spells[Heart_healing[name][rezer]["Spell"]] and Heart_healing[name][rezer]["Status"] == "Active") then
                  return 1
               end
           end
	elseif (CT_RA_Ressers) then
           for rezer, data in CT_RA_Ressers do
               if data == name then
                  return 1
               end
           end
        elseif oRA_Resurrection then
	   for rezer, data in oRA_Resurrection.ressers do
               if data == name then
                  return 1
               end
           end
        end
        return
end

function Heart_GetHealBonus(unit, spell, rank)
	-- check how much extra healing we'll get thanks to buffs on our target
	local healbonus = 0
	Heart_temp_table = (Heart_temp_table or {})
	Heart_temp_table2 = (Heart_temp_table2 or {})
	Heart_temp_table2[spell] = 0
	Heart_temp_table2["HealUp"] = 0
	Heart_temp_table2["HealDown"] = 0
	if (spell == C_Flash_of_light or spell == C_Holy_light) then
		local data = C_UnitGotBuff(unit, C_Blessing_of_light)
		data = (data or C_UnitGotBuff(unit, C_Greater_blessing_of_light))
		if (data and data["Text"]) then
			local start, stop
			start, stop, Heart_temp_table[1], Heart_temp_table[2] = string.find(data["Text"], Heart_blessing_of_light_search)
			if (start) then
				for index, value in Heart_blessing_of_light_text do
					Heart_temp_table2[value] = (Heart_temp_table2[value] or 0) * (Heart_bonus_divide / Heart_Spells[spell][rank]["CastTime"]) + Heart_temp_table[index]
				end
			end
		end
	end
	for buff, search in Heart_buff_affect_healing_search do
		local data = C_UnitGotBuff(unit, buff)
		if (data and data["Text"]) then
			local start, stop
			start, stop, Heart_temp_table[1], Heart_temp_table[2] = string.find(data["Text"], search)
			if (start) then
				for index, value in Heart_buff_affect_healing_text[buff] do
					Heart_temp_table2[value] = (Heart_temp_table2[value] or 0) + (Heart_temp_table[index] or 0)
				end
			end
		end
	end
	for debuff, search in Heart_debuff_affect_healing_search do
		local data = C_UnitGotDebuff(unit, debuff)
		if (data and data["Text"]) then
			local start, stop
			start, stop, Heart_temp_table[1], Heart_temp_table[2] = string.find(data["Text"], search)
			if (start) then
				for index, value in Heart_debuff_affect_healing_text[debuff] do
					Heart_temp_table2[value] = (Heart_temp_table2[value] or 0) + (Heart_temp_table[index] or 0)
				end
			end
		end
	end
	for buff, search in Heart_my_buff_affect_healing_search do
		local data = C_UnitGotBuff("player", buff)
		if (data and data["Text"]) then
			local start, stop
			start, stop, Heart_temp_table[1], Heart_temp_table[2] = string.find(data["Text"], search)
			if (start) then
				for index, value in Heart_my_buff_affect_healing_text[buff] do
					Heart_temp_table2[value] = (Heart_temp_table2[value] or 0) + (Heart_temp_table[index] or 0)
				end
			end
		end
	end
	healbonus = healbonus + (Heart_temp_table2[spell] or 0)
	healbonus = healbonus + (Heart_temp_table2["HealUp"] or 0)
	healbonus = healbonus - (Heart_temp_table2["HealDown"] or 0)
	-- and the bonus from the equipment
	if (not Heart_item_heal_bonus) then
		Heart_UpdateItemHealBonus()
	end
	healbonus = healbonus + Heart_item_heal_bonus
	-- if we're a priest & got "spiritual guidance"
	if (C_my_class == C_Priest) then
		local crap1, crap2, crap3, crap4, crank, mrank = GetTalentInfo(2, 14)
		local base, cur = UnitStat("player", 5)
		healbonus = healbonus + crank * 0.05 * cur
	end
	if (Heart_low_level_spell_bonus_penalty[spell] and Heart_low_level_spell_bonus_penalty[spell][rank]) then
		-- low level spell, gets a bonus penalty
		healbonus = healbonus * Heart_low_level_spell_bonus_penalty[spell][rank]
	end
	return healbonus
end

function Heart_CanHeal(unit)
	-- see if we can heal this unit
	if (not UnitExists(unit) or UnitIsDeadOrGhost(unit) or not UnitIsFriend("player", unit) or not UnitIsVisible(unit)) then
		return
	else
	    for buff, one in Heart_buff_unable_to_heal do
		if (C_UnitGotBuff(unit, buff)) then
			return
		end
	    end
	    for debuff, one in Heart_debuff_unable_to_heal do
		if (C_UnitGotDebuff(unit, debuff)) then
			return
		end
	    end
	    return 1
        end
end

function Heart_CanRez(unit)
	-- see if we can heal this unit
	if (not UnitExists(unit) or not UnitIsDead(unit) or not UnitIsFriend("player", unit) or not UnitIsConnected(unit)) then
	        return
        else
	return 1
	end
end

function Heart_IsHealModifierKeyDown(modifier)
	if (not modifier or not Heart_Config[modifier]) then
		return
	end
	if (Heart_Config[modifier] == 1) then
		return
	elseif (Heart_Config[modifier] == 2) then
		return 1
	elseif (Heart_Config[modifier] == 3 and IsAltKeyDown()) then
		return 1
	elseif (Heart_Config[modifier] == 4 and IsControlKeyDown()) then
		return 1
	elseif (Heart_Config[modifier] == 5 and IsShiftKeyDown()) then
		return 1
	elseif (Heart_Config[modifier] == 6 and IsAltKeyDown() and IsControlKeyDown()) then
		return 1
	elseif (Heart_Config[modifier] == 7 and IsAltKeyDown() and IsShiftKeyDown()) then
		return 1
	elseif (Heart_Config[modifier] == 8 and IsControlKeyDown() and IsShiftKeyDown()) then
		return 1
	elseif (Heart_Config[modifier] == 9 and IsAltKeyDown() and IsControlKeyDown() and IsShiftKeyDown()) then
		return 1
	end
end

function Heart_UpdateItemHealBonus()
	Heart_item_heal_bonus = 0
	Heart_set_bonus_applied = {}
	for slot = 1, 19 do
		local item = GetInventoryItemLink("player", slot)
		if (item and Heart_item_heal_bonus_cache[item] and (slot == 16 or slot == 17)) then
			local a, b, c, d, e, f = GetWeaponEnchantInfo()
			if (slot == 16 and ((a and not Heart_main_hand_enchant) or (not a and Heart_main_hand_enchant))) then
				Heart_item_heal_bonus_cache[item] = nil
				Heart_main_hand_enchant = a
			end
			if (slot == 17 and ((d and not Heart_off_hand_enchant) or (not d and Heart_off_hand_enchant))) then
				Heart_item_heal_bonus_cache[item] = nil
				Heart_off_hand_enchant = d
			end
		end
		if (item and Heart_item_heal_bonus_cache[item]) then
			Heart_item_heal_bonus = Heart_item_heal_bonus + Heart_item_heal_bonus_cache[item]
		else
			C_ClearTooltip()
			if (C_Tooltip:SetInventoryItem("player", slot)) then
				for line = 1, C_Tooltip:NumLines() do
					local itemtext = getglobal("C_TooltipTextLeft" .. line):GetText()
					local r, g, b, a = getglobal("C_TooltipTextLeft" .. line):GetTextColor()
					if (itemtext and itemtext ~= "" and not Heart_set_bonus_applied[itemtext] and not string.find(itemtext, Heart_set_bonus_inactive_text)) then
						for index, healtext in Heart_item_heal_bonus_text do
							local start, stop, bonus = string.find(itemtext, healtext)
							Heart_item_heal_bonus = Heart_item_heal_bonus + (bonus or 0)
							Heart_item_heal_bonus_cache[item] = (Heart_item_heal_bonus_cache[item] or 0) + (bonus or 0)
						end
						if (string.find(itemtext, Heart_set_bonus_active_text)) then
							Heart_set_bonus_applied[itemtext] = 1
						end
					end
				end
			end
		end
	end
end

function Heart_UpdateDead(elapsed)
           local players = GetNumRaidMembers()
           local por = "raid"
           if (GetNumRaidMembers() <= 0) or (Heart_Config["rez_party_only"] == 1) then
              players = GetNumPartyMembers()
              por = "party"
           end
           for a = 1, players do
                  if UnitIsDead(por .. a) then
                     Heart_awaiting_rez[por .. a] = (Heart_awaiting_rez[por .. a] or {})
                     Heart_awaiting_rez[por .. a]= {
                                            ["is_dead"] = 1,
                                            ["status"] = Heart_awaiting_rez[por .. a]["status"] or nil,
                                            ["waiting_time"] = Heart_awaiting_rez[por .. a]["waiting_time"] or nil,
                                            ["priority"] = tonumber(Heart_Config["rez_priority"][UnitClass(por .. a)]),
                                            ["cast"] = Heart_awaiting_rez[por .. a]["cast"] or nil
                     }
                  else
                     Heart_awaiting_rez[por .. a]= nil
                  end
           end
           if Heart_awaiting_rez then
              for player, data in Heart_awaiting_rez do
                  if (Heart_awaiting_rez[player]["is_dead"] and Heart_awaiting_rez[player]["waiting_time"]) and UnitIsDead(player) then
                     if not (Heart_awaiting_rez[player]["waiting_time"] <= 0) then
                        Heart_awaiting_rez[player]["waiting_time"] = Heart_awaiting_rez[player]["waiting_time"] - elapsed
                     else
                        Heart_awaiting_rez[player]["waiting_time"] = nil
                     end
                  elseif (Heart_awaiting_rez[player]["is_dead"] and not(UnitIsDead(player))) then
                     Heart_awaiting_rez[player]["is_dead"] = nil
                     Heart_awaiting_rez[player]["waiting_time"] = nil
                     Heart_awaiting_rez[player]["priority"] = 0
                  end
                  if (data["status"] and (data["cast"])) then
                  data["cast"] = data["cast"] - elapsed
                     if (data["cast"] <= 0) then
                        if (data["status"] == "stop") then
                           Heart_awaiting_rez[player]["waiting_time"] = 120
                           Heart_awaiting_rez[player]["status"] = nil
                           Heart_awaiting_rez[player]["cast"] = nil
                        else
                           Heart_awaiting_rez[player]["waiting_time"] = nil
                           Heart_awaiting_rez[player]["status"] = nil
                           Heart_awaiting_rez[player]["cast"] = nil
                        end
                     end
                  end
              end
           end
           table.sort(Heart_awaiting_rez, Heart_SortAwaitingRez)
end

function clean_spell_awaiting_target()
	Heart_spell_awaiting_target_Spell = nil
	Heart_spell_awaiting_target_Rank = nil
	Heart_spell_awaiting_target_Target= nil
end
