function flame_shift(players)
	for _,player_entity in ipairs(players) do
		local damagemodels = EntityGetComponent(player_entity, "DamageModelComponent")
		if(damagemodels ~= nil) then
			for i,damagemodel in ipairs(damagemodels) do
				if(tonumber(ComponentGetValue(damagemodel, "is_on_fire")) ~= 0) then
					GameSetPostFxParameter( "brightness_contrast_gamma", 0.3, 1.6, 1.9, 1 )
					GameSetPostFxParameter( "color_grading", 0.6, 0.75, 0.7, 0.3 )
				else
					GameUnsetPostFxParameter( "brightness_contrast_gamma" )
					GameUnsetPostFxParameter( "color_grading" )
				end
			end
		end
	end
end