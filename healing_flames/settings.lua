dofile("data/scripts/lib/mod_settings.lua")


local mod_id = "Healing Flames"
mod_settings_version = 1
mod_settings = {
		
	{
        id = "multiplier_of_healing_flames",
        ui_name = "Multiplier of the healing flames",
        value_default = 5,
        value_min = 0.1,
        value_max = 10,
        value_display_formatting = " $0 x flame = heal",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    }
    
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end