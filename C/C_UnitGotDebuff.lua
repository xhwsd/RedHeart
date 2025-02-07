function C_UnitGotDebuff(unit, debuff)
	-- figure out if this player got this debuff
	local debufftexture = C_debuff_texture_map[debuff];
	if (not debufftexture) then
		return;
	end
	local name = C_UnitName(unit);
	if (string.find(unit, "pet")) then
		-- pet
		if (unit == "pet") then
			name = C_UnitName("player") .. "-" .. name;
		else
			name = C_UnitName(string.gsub(unit, "pet", "")) .. "-" .. name;
		end
	end
	if (not C_player_data[name] or not C_player_data[name]["Debuff"][debufftexture]) then
		return;
	end
	if (C_player_data[name]["Debuff"][debufftexture]["Tick"] == C_player_data[name]["CurrentTick"] and C_player_data[name]["Debuff"][debufftexture]["Name"] == debuff) then
		return C_player_data[name]["Debuff"][debufftexture];
	end
end
