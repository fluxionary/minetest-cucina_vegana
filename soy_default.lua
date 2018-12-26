--[[
	**********************************************
	***             Soy default                ***
	**********************************************
]]--

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local dname = S("Soy")
local pname = "soy"
local step = 8

farming.register_plant("cucina_vegana:".. pname, {
	description = S(dname .. " Beans"),
	inventory_image = "cucina_vegana_".. pname .. "_seed.png",
	steps = step,
	minlight = 12,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4, attached_node = 1},
})
	
-- Register for Mapgen
minetest.register_node("cucina_vegana:wild_".. pname, {
	description = S("Wild " .. dname),
	paramtype = "light",
	walkable = false,
	drop = { 
			items = { 
					{items = {"cucina_vegana:seed_".. pname .. " 3"}},
					{items = {"cucina_vegana:".. pname}},
				}
			},
	drawtype = "plantlike",
	paramtype2 = "facedir",
	tiles = {"cucina_vegana_".. pname .. "_".. step .. ".png"},
	sunlight_propagates = true,
	groups = {chopspy=2, oddly_breakable_by_hand=3, flammable=2, plant=1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.35, 0.5}, -- side f
			},
	},
})


minetest.register_alias("soy:wild_".. pname, "cucina_vegana:wild_".. pname)
minetest.register_alias("soy:".. pname, "cucina_vegana:".. pname)
minetest.register_alias("soy:seed_".. pname, "cucina_vegana:seed_".. pname)

if (minetest.get_modpath("farming_nextgen")) then
    farmingNG.register_seed("cucina_vegana:seed_".. pname, "cucina_vegana:".. pname .. "_1")
    farmingNG.register_harvest("cucina_vegana:".. pname .. "_" .. step)
end