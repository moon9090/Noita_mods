function OnPlayerSpawned(player_entity)
	
	local damagemodels = EntityGetComponent( player_entity, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
		
			local mult = ModSettingGet("Healing Flames.multiplier_of_healing_flames")
			
			local fire = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "fire" ) )

			fire = fire * -mult

			ComponentObjectSetValue( damagemodel, "damage_multipliers", "fire", tostring(fire) )

		end
	end
	
end

ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/healing_flames/files/perk_list_appends.lua")