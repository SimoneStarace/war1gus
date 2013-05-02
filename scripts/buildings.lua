--       _________ __                 __                               
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \ 
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/ 
--  ______________________                           ______________________
--                        T H E   W A R   B E G I N S
--         Stratagus - A free fantasy real time strategy game engine
--
--      constructions.lua - Define the constructions.
--
--      (c) Copyright 2001-2004 by Lutz Sammer and Jimmy Salmon
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 2 of the License, or
--      (at your option) any later version.
--  
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--  
--      You should have received a copy of the GNU General Public License
--      along with this program; if not, write to the Free Software
--      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
--      $Id$

UnitTypeFiles = {}

if (war1gus.tileset == nil) then
  war1gus.tileset = "forest"
end

local buildings = {
   {Names = {orc = "Farm", human = "Farm"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Supply = 5,
    Size = {96, 96},
    DrawLevel = 20},

   {Names = {orc = "Blacksmith", human = "Blacksmith"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Size = {96, 96},
    DrawLevel = 20},

   {Names = {orc = "Tower", human = "Tower"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Size = {96, 96},
    DrawLevel = 20},

   {Names = {orc = "Kennel"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Size = {128, 96},
    DrawLevel = 20},

   {Names = {human = "Stable"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Size = {128, 128},
    DrawLevel = 20},

   {Names = {orc = "Barracks", human = "Barracks"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Size = {128, 128},
    DrawLevel = 20},

   {Names = {orc = "Lumber mill", human = "Lumber mill"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Size = {128, 128},
    DrawLevel = 20},

   {Names = {orc = "Town hall", human = "Town hall"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    CanStore = {"wood", "gold"},
    Supply = 5,
    Size = {128, 128},
    DrawLevel = 20},

   {Names = {human = "Church", orc = "Temple"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 400,
    Size = {128, 128},
    DrawLevel = 20},

   {Names = {human = "Stormwind keep", orc = "Blackrock spire"},
    Costs = {"time", 100, "gold", 500, "wood", 250},
    HitPoints = 1200,
    Size = {160, 160},
    NotConstructable = true,
    Corpse = "unit-destroyed-3x3-place"}}

-- create buildings and their constructions from specs
for idx,building in ipairs(buildings) do
   for race,name in pairs(building.Names) do
      local size = building.Size
      local filename = string.lower(string.gsub(name, " ", "_"))
      local fullname = race .. "-" .. string.gsub(filename, "_", "-")
      local files = {
	 forest = ("tilesets/forest/" .. race ..
		      "/buildings/" .. filename .. "_construction.png"),
	 swamp = ("tilesets/swamp/" .. race ..
		     "/buildings/" .. filename .. "_construction.png") }

      if not building.NotConstructable then
	 DefineConstruction(
	    "construction-" .. fullname,
	    {Files = {
		File = files[war1gus.tileset],
		Size = size},
	     Constructions = {
		{Percent = 0,
		 File = "construction",
		 Frame = 0},
		{Percent = 33,
		 File = "construction",
		 Frame = 1},
		{Percent = 67,
		 File = "construction",
		 Frame = 2}}})
      end

      UnitTypeFiles["unit-" .. fullname] = {
	 forest = ("tilesets/forest/" .. race ..
		      "/buildings/" .. filename .. ".png"),
	 swamp = ("tilesets/swamp/" .. race ..
		     "/buildings/" .. filename .. ".png") }

      local unitType = {
	 Name = name,
	 Image = {"size", size},
	 Animations = "animations-building",
	 Icon = "icon-" .. fullname,
	 Costs = building.Costs,
	 RepairHp = 4,
	 RepairCosts = {"gold", 1, "wood", 1},
	 Construction = "construction-" .. fullname,
	 HitPoints = building.HitPoints,
	 DrawLevel = building.DrawLevel,
	 TileSize = { size[1] / 32 - 1, size[2] / 32 - 1 },
	 BoxSize = { size[1] - 1, size[2] - 1 },
	 SightRange = 1,
	 Armor =  20,
	 BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
	 Priority = 20,
	 AnnoyComputerFactor = 45,
	 Points = 100,
	 Supply = 0,
	 CanStore = {},
	 Corpse = "unit-destroyed-2x2-place",
	 ExplodeWhenKilled = "missile-explosion",
	 Type = "land",
	 Building = true,
	 VisibleUnderFog = true,
	 Sounds = {"selected", race .. " selected",
		   "help", race .. " help 2",
		   "dead", "building destroyed"}}

	 for k,v in pairs(building) do
	    if unitType[k] then
	       unitType[k] = v
	    end
	 end
	 DefineUnitType("unit-" .. fullname, unitType)

   end
end

UnitTypeFiles["unit-gold-mine"] = {
  forest = "tilesets/forest/neutral/buildings/gold_mine.png",
  swamp = "tilesets/swamp/neutral/buildings/gold_mine.png"
}

DefineUnitType("unit-gold-mine", { Name = "Gold Mine",
  Image = {"size", {128, 128}},
  Animations = "animations-building", Icon = "icon-gold-mine",
  NeutralMinimapColor = {255, 255, 0},
  Costs = {"time", 150},
  Construction = "construction-none",
--  Speed = 0,
  HitPoints = 25500,
  DrawLevel = 40,
  TileSize = {3, 3}, BoxSize = {95, 95},
  SightRange = 1,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Corpse = "unit-destroyed-3x3-place",
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true,
  GivesResource = "gold", CanHarvest = true,
  Sounds = {
    "selected", "gold-mine-selected",
    "acknowledge", "gold-mine-acknowledge",
    "ready", "gold-mine-ready",
    "help", "gold-mine-help",
    "dead", "building destroyed",
--    "attack", "gold-mine-attack"
}} )
