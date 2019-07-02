--[[
	**********************************************
	***             Cucina Vegana              ***
    ***                                        ***
    ***  Cucina Vegana is a Mod for Minetest   ***
    ***  and supports farming or farming_redo  ***
    ***  by TenPlus.                           ***
    ***                                        ***
    ***  License: LGPL 3.0 by A.C.M.           ***
    ***                                        ***
	**********************************************
]]--

cucina_vegana = {}
local plants = {}
cucina_vegana.version = "2.2"
cucina_vegana.farming_default = true
cucina_vegana.plant_settings = {}
cucina_vegana.plant_settings.bonemeal_list = {}

local modpath = minetest.get_modpath(minetest.get_current_modname())
local modname = minetest.get_current_modname()

dofile(modpath .. "/settingtypes.lua")

-- looking if farming_redo is activ?
if(farming.mod == "redo") then
	cucina_vegana.farming_default = false
    minetest.log("info", "[MOD] " .. modname .. ": farming_redo mode activated.")

else
    minetest.log("info", "[MOD] " .. modname .. ": default farming mode activated.")

end -- if(farming.mod

cucina_vegana.plant_settings.bonemeal = false         -- Support for bonemeal disabled
if(minetest.get_modpath("bonemeal")) then
    cucina_vegana.plant_settings.bonemeal = true
    
end -- if(minetest.get_modpath("bonemeal"


plants = {

			["asparagus"] = cucina_vegana.plant_settings.asparagus,
			["chives"] = cucina_vegana.plant_settings.chives,
			["flax"] = cucina_vegana.plant_settings.flax,
			["kohlrabi"] = cucina_vegana.plant_settings.kohlrabi,
			["lettuce"] = cucina_vegana.plant_settings.lettuce,
			["parsley"] = cucina_vegana.plant_settings.parsley,
            ["peanut"] = cucina_vegana.plant_settings.peanut,
            ["rosemary"] = cucina_vegana.plant_settings.rosemary,
			["rice"] = cucina_vegana.plant_settings.rice,
			["soy"] = cucina_vegana.plant_settings.soy,
			["sunflower"] = cucina_vegana.plant_settings.sunflower,
			
		}
		


for pname, value in pairs(plants) do
	
	if(value) then
        -- Load all flowers in default-mode
		if (cucina_vegana.farming_default) then
			dofile(modpath .. "/" .. pname .. "_default.lua")
			dofile(modpath .. "/".. pname .. ".lua")
			
		else
        -- Load all flowers in redo-mode
			dofile(modpath .. "/" .. pname .. "_redo.lua")
			dofile(modpath .. "/".. pname .. ".lua")
			
		end -- if(cucina_vegana...)

	end -- if(value)
	
	print("[MOD] " .. modname .. " Module: " .. pname .. " loaded.")
    minetest.log("info", "[MOD] " .. modname .. " Module: " .. pname .. " loaded.")
    
end -- for

-- Insert Recipes
dofile(modpath .. "/overrides.lua")
dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/items.lua")
dofile(modpath .. "/fuels.lua")
dofile(modpath .. "/recipes.lua")
dofile(modpath .. "/recipes_cook.lua")
dofile(modpath .. "/recipes_support.lua")
dofile(modpath .. "/recipes_5xx.lua") -- New recipes with MT 5.0
dofile(modpath .. "/register_mods.lua")

if(cucina_vegana.plant_settings.bonemeal) then
    bonemeal:add_crop(cucina_vegana.plant_settings.bonemeal_list)
    
end -- if(cucina_vegana.plant_settings.bonemeal

if (cucina_vegana.farming_default) then
	print("[MOD] " .. modname .. " Version " .. cucina_vegana.version .. " in default-mode loaded.")
    minetest.log("info", "[MOD] " .. modname .. " Version " .. cucina_vegana.version .. " in default-mode loaded.")
    
else
	print("[MOD] " .. modname .. " Version " .. cucina_vegana.version .. " in redo-mode loaded.")
	minetest.log("info", "[MOD] " .. modname .. " Version " .. cucina_vegana.version .. " in redo-mode loaded.")
    
end
