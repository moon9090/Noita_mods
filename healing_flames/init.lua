dofile_once( "mods/healing_flames/files/flame_shift.lua" )

local shifted = ModSettingGet("Healing Flames.visual_shift")

if(shifted == true) then
	function OnWorldPreUpdate()
		local players = EntityGetWithTag("player_unit")
		if(players ~= nil) then
			flame_shift(players)
		end
	end
end

function OnPlayerSpawned(player_entity)

	local key = "HEALING_FLAMES_TRYING_TO_MODIFY_PLAYER_DATA_ONLY_ONCE"
	local is_initialized = GlobalsGetValue( key ) 
	if( is_initialized == "yes" ) then
		print("HEALING_FLAMES_TRYING_TO_MODIFY_PLAYER_DATA_ONLY_ONCE! exit!")
		return
	end
	GlobalsSetValue( key, "yes" )
	
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

ModTextFileSetContent("data/entities/misc/effect_protection_fire.xml", "mods/healing_flames/files/effect_protection_fire.xml")
ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/healing_flames/files/perk_list_appends.lua")