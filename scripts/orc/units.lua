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
--      units.lua - Define the used orc unit-types.
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

--=============================================================================
--	Define unit-types.
--
DefineUnitType("unit-grunt", { Name = "Grunt",
  Files = {"tileset-forest", "orc/units/grunt.png"},
  Size = {64, 64},
  Animations = "animations-footman", Icon = "icon-grunt",
  Costs = {"time", 60, "gold", 600},
  Speed = 10,
  HitPoints = 60,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 4, ComputerReactionRange = 6, PersonReactionRange = 4,
  Armor = 2, BasicDamage = 6, PiercingDamage = 3, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 60,
  Points = 50,
  Demand = 1,
  Corpse = {"unit-dead-body", 0},
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "orc selected",
    "acknowledge", "orc acknowledge",
    "ready", "orc ready",
    "help", "orc help 3",
    "dead", "orc dead",
    "attack", "grunt-attack"} } )

DefineUnitType("unit-peon", { Name = "Peon",
  Files = {"tileset-forest", "orc/units/peon.png"},
  Size = {64, 64},
  Animations = "animations-peasant", Icon = "icon-peon",
  Costs = {"time", 45, "gold", 400},
  Speed = 10,
  HitPoints = 30,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 4, ComputerReactionRange = 6, PersonReactionRange = 4,
  BasicDamage = 3, PiercingDamage = 2, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 50,
  Points = 30,
  Demand = 1,
  Corpse = {"unit-dead-body", 0},
  Type = "land",
  RightMouseAction = "harvest",
  RepairRange = 1,
  CanTargetLand = true,
  LandUnit = true,
  Coward = true,
  CanGatherResources = {
   {"file-when-loaded", "orc/units/peon_with_gold.png",
    "resource-id", "gold",
    "resource-capacity", 100,
    "wait-at-resource", 150,
    "wait-at-depot", 150},
   {"file-when-loaded", "orc/units/peon_with_wood.png",
    "resource-id", "wood",
    "resource-capacity", 100,
    "resource-step", 2,
    "wait-at-resource", 24,
    "wait-at-depot", 150,
    "lose-resources",
    "terrain-harvester"}},
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "orc selected",
    "acknowledge", "orc acknowledge",
    "ready", "orc ready",
--    "repair", "peon-attack",
    "harvest", "wood", "tree chopping",
    "help", "orc help 1",
    "dead", "orc dead",
    "attack", "peon-attack"} } )

DefineUnitType("unit-orc-catapult", { Name = "Orc Catapult",
  Files = {"tileset-forest", "orc/units/catapult.png"},
  Size = {64, 64},
  Animations = "animations-catapult", Icon = "icon-orc-catapult",
  Costs = {"time", 250, "gold", 900, "wood", 300},
  Speed = 5,
  HitPoints = 110,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {63, 63},
  SightRange = 9, ComputerReactionRange = 11, PersonReactionRange = 9,
  BasicDamage = 80, PiercingDamage = 0, Missile = "missile-catapult-rock",
  MinAttackRange = 2, MaxAttackRange = 8,
  Priority = 70,
  Points = 100,
  Demand = 1,
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  RightMouseAction = "attack",
  CanGroundAttack = true,
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "orc selected",
    "acknowledge", "orc acknowledge",
    "ready", "orc ready",
    "help", "orc help 3",
    "dead", "explosion",
    "attack", "orc-catapult-attack"} } )

DefineUnitType("unit-raider", { Name = "Raider",
  Files = {"tileset-forest", "orc/units/raider.png"},
  Size = {96, 96},
  Animations = "animations-knight", Icon = "icon-raider",
  Costs = {"time", 90, "gold", 800, "wood", 100},
  Speed = 13,
  HitPoints = 90,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {42, 42},
  SightRange = 4, ComputerReactionRange = 6, PersonReactionRange = 4,
  Armor = 4, BasicDamage = 8, PiercingDamage = 4, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 63,
  Points = 100,
  Demand = 1,
  Corpse = {"unit-dead-body", 0},
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "orc selected",
    "acknowledge", "orc acknowledge",
    "ready", "orc ready",
    "help", "orc help 3",
    "dead", "orc dead",
    "attack", "raider-attack"} } )

DefineUnitType("unit-spearman", { Name = "Spearman",
  Files = {"tileset-forest", "orc/units/spearman.png"},
  Size = {64, 64},
  Animations = "animations-archer", Icon = "icon-spearman",
  Costs = {"time", 70, "gold", 500, "wood", 50},
  Speed = 10,
  HitPoints = 40,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 5, ComputerReactionRange = 7, PersonReactionRange = 5,
  BasicDamage = 3, PiercingDamage = 6, Missile = "missile-arrow",
  MaxAttackRange = 4,
  Priority = 55,
  Points = 60,
  Demand = 1,
  Corpse = {"unit-dead-body", 0},
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "orc selected",
    "acknowledge", "orc acknowledge",
    "ready", "orc ready",
    "help", "orc help 3",
    "dead", "orc dead",
    "attack", "spearman-attack"} } )

DefineUnitType("unit-necrolyte", { Name = "Necrolyte",
  Files = {"tileset-forest", "orc/units/necrolyte.png"},
  Size = {64, 64},
  Animations = "animations-necrolyte", Icon = "icon-necrolyte",
  Costs = {"time", 90, "gold", 800, "wood", 100},
  Speed = 13,
  HitPoints = 90,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 4, ComputerReactionRange = 6, PersonReactionRange = 4,
  BasicDamage = 4, PiercingDamage = 8, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 63,
  Points = 100,
  Demand = 1,
  Corpse = {"unit-dead-body", 0},
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "orc selected",
    "acknowledge", "orc acknowledge",
    "ready", "orc ready",
    "help", "orc help 3",
    "dead", "orc dead",
    "attack", "necrolyte-attack"} } )

DefineUnitType("unit-warlock", { Name = "Warlock",
  Files = {"tileset-forest", "orc/units/warlock.png"},
  Size = {64, 64},
  Animations = "animations-conjurer", Icon = "icon-warlock",
  Costs = {"time", 120, "gold", 1200},
  Speed = 8,
  HitPoints = 60,
  DrawLevel = 40,
  MaxMana = 255,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 9, ComputerReactionRange = 11, PersonReactionRange = 9,
  BasicDamage = 0, PiercingDamage = 9, Missile = "missile-touch-of-death",
  MaxAttackRange = 3,
  Priority = 70,
  Points = 100,
  Demand = 1,
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = true,
  CanCastSpell = {"spell-eye-of-vision", "spell-runes", "spell-bloodlust"},
  LandUnit = true,
  Coward = true,
  isundead = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "orc selected",
    "acknowledge", "orc acknowledge",
    "ready", "orc ready",
    "help", "orc help 3",
    "dead", "orc dead",
    "attack", "warlock-attack"} } )

DefineUnitType("unit-lothar", { Name = "Lothar",
  Files = {"tileset-forest", "orc/units/lothar.png"},
  Size = {96, 96},
  Animations = "animations-footman", Icon = "icon-lothar",
  Costs = {"time", 90, "gold", 800, "wood", 100},
  Speed = 13,
  HitPoints = 90,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 4, ComputerReactionRange = 6, PersonReactionRange = 4,
  Armor = 4, BasicDamage = 8, PiercingDamage = 4, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 63,
  Points = 100,
  Demand = 1,
  Corpse = {"unit-dead-body", 0},
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "lothar-selected",
    "acknowledge", "lothar-acknowledge",
    "ready", "lothar-ready",
    "help", "basic orc voices help 1",
    "dead", "basic orc voices dead",
    "attack", "lothar-attack"} } )

DefineUnitType("unit-orc-farm", { Name = "Orc Farm",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/farm.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/farm.png"},
  Size = {96, 96},
  Animations = "animations-building", Icon = "icon-orc-farm",
  Costs = {"time", 100, "gold", 500, "wood", 250},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 400,
  DrawLevel = 20,
  TileSize = {2, 2}, BoxSize = {63, 63},
  SightRange = 3,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 20, AnnoyComputerFactor = 45,
  Points = 100,
  Supply = 4,
  Corpse = {"unit-destroyed-2x2-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "orc-farm-selected",
    "acknowledge", "orc-farm-acknowledge",
    "ready", "orc-farm-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-farm-attack"} } )

DefineUnitType("unit-orc-barracks", { Name = "Orc Barracks",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/barracks.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/barracks.png"},
  Size = {128, 128},
  Animations = "animations-building", Icon = "icon-orc-barracks",
  Costs = {"time", 200, "gold", 700, "wood", 450},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 800,
  DrawLevel = 20,
  TileSize = {3, 3}, BoxSize = {95, 95},
  SightRange = 3,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 30, AnnoyComputerFactor = 35,
  Points = 160,
  Corpse = {"unit-destroyed-3x3-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "orc-barracks-selected",
    "acknowledge", "orc-barracks-acknowledge",
    "ready", "orc-barracks-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-barracks-attack"} } )

DefineUnitType("unit-orc-temple", { Name = "Orc Temple",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/temple.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/temple.png"},
  Size = {128, 128},
  Animations = "animations-building", Icon = "icon-orc-temple",
  Costs = {"time", 175, "gold", 900, "wood", 500},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 700,
  DrawLevel = 20,
  TileSize = {3, 3}, BoxSize = {95, 95},
  SightRange = 3,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 15, AnnoyComputerFactor = 35,
  Points = 240,
  Corpse = {"unit-destroyed-3x3-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "orc-temple-selected",
    "acknowledge", "orc-temple-acknowledge",
    "ready", "orc-temple-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-temple-attack"} } )

DefineUnitType("unit-orc-kennel", { Name = "Orc Kennel",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/kennel.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/kennel.png"},
  Size = {128, 96},
  Animations = "animations-building", Icon = "icon-orc-kennel",
  Costs = {"time", 150, "gold", 1000, "wood", 300},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 500,
  DrawLevel = 20,
  TileSize = {3, 2}, BoxSize = {95, 63},
  SightRange = 3,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 15, AnnoyComputerFactor = 15,
  Points = 210,
  Corpse = {"unit-destroyed-3x3-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "orc-kennel-selected",
    "acknowledge", "orc-kennel-acknowledge",
    "ready", "orc-kennel-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-kennel-attack"} } )

DefineUnitType("unit-orc-town-hall", { Name = "Orc Town Hall",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/town_hall.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/town_hall.png"},
  Size = {128, 128},
  Animations = "animations-building", Icon = "icon-orc-town-hall",
  Costs = {"time", 255, "gold", 1200, "wood", 800},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 1200,
  DrawLevel = 20,
  TileSize = {4, 4}, BoxSize = {127, 127},
  SightRange = 4,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 35, AnnoyComputerFactor = 45,
  Points = 200,
  Supply = 1,
  Corpse = {"unit-destroyed-4x4-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  CanStore = {"gold", "wood"},
  Sounds = {
    "selected", "orc-town-hall-selected",
    "acknowledge", "orc-town-hall-acknowledge",
    "ready", "orc-town-hall-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-town-hall-attack"} } )

DefineUnitType("unit-orc-lumber-mill", { Name = "Orc Lumber Mill",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/lumber_mill.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/lumber_mill.png"},
  Size = {128, 128},
  Animations = "animations-building", Icon = "icon-orc-lumber-mill",
  Costs = {"time", 150, "gold", 600, "wood", 450},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1},
  ImproveProduction = {"wood", 25},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 600,
  DrawLevel = 20,
  TileSize = {3, 3}, BoxSize = {95, 95},
  SightRange = 3,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 25, AnnoyComputerFactor = 15,
  Points = 150,
  Corpse = {"unit-destroyed-3x3-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  CanStore = {"wood"},
  Sounds = {
    "selected", "orc-lumber-mill-selected",
    "acknowledge", "orc-lumber-mill-acknowledge",
    "ready", "orc-lumber-mill-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-lumber-mill-attack"} } )

DefineUnitType("unit-orc-tower", { Name = "Orc Tower",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/tower.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/tower.png"},
  Size = {96, 96},
  Animations = "animations-building", Icon = "icon-orc-tower",
  Costs = {"time", 125, "gold", 1000, "wood", 200},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 500,
  DrawLevel = 20,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 3,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 35, AnnoyComputerFactor = 20,
  Points = 240,
  Corpse = {"unit-destroyed-3x3-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "orc-tower-selected",
    "acknowledge", "orc-tower-acknowledge",
    "ready", "orc-tower-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-tower-attack"} } )

DefineUnitType("unit-orc-blacksmith", { Name = "Orc Blacksmith",
  Files = {"tileset-forest", "tilesets/forest/orc/buildings/blacksmith.png",
    "tileset-swamp", "tilesets/swamp/orc/buildings/blacksmith.png"},
  Size = {96, 96},
  Animations = "animations-building", Icon = "icon-orc-blacksmith",
  Costs = {"time", 200, "gold", 800, "wood", 450, "oil", 100},
  RepairHp = 4,
  RepairCosts = {"gold", 1, "wood", 1, "oil", 1},
  Construction = "construction-land",
  Speed = 0,
  HitPoints = 775,
  DrawLevel = 20,
  TileSize = {2, 2}, BoxSize = {63, 63},
  SightRange = 3,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 15, AnnoyComputerFactor = 20,
  Points = 170,
  Corpse = {"unit-destroyed-3x3-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "orc-blacksmith-selected",
    "acknowledge", "orc-blacksmith-acknowledge",
    "ready", "orc-blacksmith-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-blacksmith-attack"} } )

DefineUnitType("unit-orc-start-location", { Name = "Orc Start Location",
  Files = {"tileset-forest", "orc/o_startpoint.png"},
  Size = {32, 32},
  NumDirections = 1,
  Animations = "animations-building", Icon = "icon-cancel",
  Speed = 0,
  HitPoints = 0,
  DrawLevel = 0,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Demand = 0,
  Type = "land",
  Sounds = {
    "selected", "orc-start-location-selected",
    "acknowledge", "orc-start-location-acknowledge",
    "ready", "orc-start-location-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-start-location-attack"} } )

DefineUnitType("unit-orc-wall", { Name = "Wall",
  Files = {"tileset-forest", "neutral/wall.png"},
  Size = {32, 32},
  Animations = "animations-building", Icon = "icon-wall",
  Costs = {"time", 30, "gold", 20, "wood", 10},
  Construction = "construction-wall",
  Speed = 0,
  HitPoints = 40,
  DrawLevel = 39,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 1,
  Armor = 20, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0, AnnoyComputerFactor = 45,
  Points = 1,
  Corpse = {"unit-destroyed-1x1-place", 0},
  ExplodeWhenKilled = "missile-explosion",
  Type = "land",
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "orc-wall-selected",
    "acknowledge", "orc-wall-acknowledge",
    "ready", "orc-wall-ready",
    "help", "basic orc voices help 2",
    "dead", "building destroyed",
    "attack", "orc-wall-attack"} } )

DefineUnitType("unit-eye-of-vision", { Name = "Eye of Kilrogg",
  Files = {"tileset-forest", "orc/units/eye_of_kilrogg.png"},
  Size = {32, 32},
  Animations = "animations-eye-of-vision", Icon = "icon-eye-of-kilrogg",
  Speed = 42,
  HitPoints = 100,
  DrawLevel = 60,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 3, ComputerReactionRange = 20, PersonReactionRange = 10,
  BasicDamage = 1, PiercingDamage = 0, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 0,
  DecayRate = 3,
  Demand = 1,
  Type = "fly",
  RightMouseAction = "move",
  AirUnit = true,
  DetectCloak = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "eye-of-kilrogg-selected",
    "acknowledge", "eye-of-kilrogg-acknowledge",
    "ready", "eye-of-kilrogg-ready",
    "help", "basic orc voices help 1",
    "dead", "eye-of-kilrogg-dead",
    "attack", "eye-of-kilrogg-attack"} } )

DefineUnitType("unit-skeleton", { Name = "Skeleton",
  Files = {"tileset-forest", "neutral/units/skeleton.png"},
  Size = {64, 64},
  Animations = "animations-skeleton", Icon = "icon-skeleton",
  Speed = 8,
  HitPoints = 40,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 3, ComputerReactionRange = 4, PersonReactionRange = 2,
  BasicDamage = 6, PiercingDamage = 3, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 55,
  DecayRate = 100,
  Demand = 1,
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  isundead = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "skeleton-selected",
    "acknowledge", "skeleton-acknowledge",
    "ready", "skeleton-ready",
    "help", "basic orc voices help 1",
    "dead", "basic orc voices dead",
    "attack", "skeleton-attack"} } )

