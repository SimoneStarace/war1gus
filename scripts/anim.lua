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
--      anim.lua - The unit animation definitions.
--
--      (c) Copyright 2003-2010 by Jimmy Salmon
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

-- TODO remove this once replaced by correct animation
DefineAnimations(
   "animations-todo", 
   {Still = {"frame 0", "wait 4"},
    Move = {"frame 0", "move 32", "wait 4"},
    Attack = {"frame 0", "attack", "wait 4"},
    Death = {"frame 0", "wait 4"}}
)

local function DefaultStillAnimation()
   return {"frame 0", "wait 4"}
end

local function BuildMoveAnimation(frames, waittime)
   local tilesizeinpixel = 32
   local halfIndex;
   waittime = waittime or 6

   if (#frames % 2 == 0) then
      halfIndex = (#frames) / 2
   else
      halfIndex = (#frames + 1) / 2
   end
   local res = {"unbreakable begin"}
   while (tilesizeinpixel > 4) do
      for i = 1, halfIndex do
	 res[1 + #res] = "frame " .. frames[i]
	 res[1 + #res] = "move 4"
	 res[1 + #res] = "wait " .. waittime
	 tilesizeinpixel = tilesizeinpixel - 4;
      end
      for i = 1, halfIndex - 1  do
	 res[1 + #res] = "frame " .. frames[halfIndex - i]
	 res[1 + #res] = "move 4"
	 res[1 + #res] = "wait " .. waittime
	 tilesizeinpixel = tilesizeinpixel - 4;
      end
      res[1 + #res] = "frame 0"
      res[1 + #res] = "move 4"
      res[1 + #res] = "wait " .. waittime
      tilesizeinpixel = tilesizeinpixel - 4;
      
      for i = 1, halfIndex do
	 res[1 + #res] = "frame " .. frames[1 + #frames - i]
	 res[1 + #res] = "move 4"
	 res[1 + #res] = "wait " .. waittime
	 tilesizeinpixel = tilesizeinpixel - 4;
      end
      for i = (2 + #frames - halfIndex), #frames do
	 res[1 + #res] = "frame " .. frames[i]
	 res[1 + #res] = "move 4"
	 res[1 + #res] = "wait " .. waittime
	 tilesizeinpixel = tilesizeinpixel - 4;
      end
      res[1 + #res] = "frame 0"
      res[1 + #res] = "move 4"
      res[1 + #res] = "wait " .. waittime
      tilesizeinpixel = tilesizeinpixel - 4;
   end	
   res[1 + #res] = "unbreakable end"
   res[1 + #res] = "frame 0"
   res[1 + #res] = "wait 1"	

   if (tilesizeinpixel ~= 0) then
      error("Problem in move animation")
   end
   return res
end

local function BuildAttackAnimation(frames, waittime, coolofftime, sound)
   -- Attack / Harvest with some modification
   local halfIndex;
   if (#frames % 2 == 0) then
      halfIndex = (#frames ) / 2
   else
      halfIndex = (#frames + 1) / 2
   end
   local res = {"unbreakable begin"}
   for i = 1, #frames do
      res[1 + #res] = "frame " .. frames[i]
      if (i == halfIndex) then
	 res[1 + #res] = "attack"
	 res[1 + #res] = "sound " .. sound
      end
      res[1 + #res] = "wait " .. waittime
   end
   -- make sure we don't attack faster just because we have fewer frames
   res[1 + #res] = "wait " .. (5 - #frames) * waittime
   res[1 + #res] = "frame 0"
   res[1 + #res] = "wait " .. coolofftime
   res[1 + #res] = "unbreakable end"
   res[1 + #res] = "frame 0"
   res[1 + #res] = "wait 1"
   return res
end

local function BuildAttackHarvest(frames, waittime, sound)
   -- Attack / Harvest with some modification
   local res = {"unbreakable begin"}
   for i = 1, #frames do
      res[1 + #res] = "frame " .. frames[i]
      if (i == (1 + #frames) / 2) then
	 res[1 + #res] = "sound " .. sound
      end
      res[1 + #res] = "wait " .. waittime
   end
   res[1 + #res] = "unbreakable end"
   res[1 + #res] = "frame 0"
   res[1 + #res] = "wait 1"
   return res
end

local function BuildDeathAnimation(frames)
   local res = {"unbreakable begin"}
   for i = 1, #frames do
      res[1 + #res] = "frame " .. frames[i]
      res[1 + #res] = "wait 3"
   end
   res[#res] = "wait 101" -- overwrite last value
   res[1 + #res] = "unbreakable end"
   res[1 + #res] = "wait 1"
   return res
end


local function GetFrameNumbers(nbdir, initCounter)
   initCounter[1] = initCounter[1] - 1
   local total = initCounter[1] + initCounter[2] + initCounter[3];
   local counter = {initCounter[1] + 1, initCounter[2], initCounter[3]}
   local itype = 1; -- 1:move, 2:attack, 3:death
   local res = {{}, {}, {}}

   local function nextType(itype, counter)
      itype = itype + 1
      if (itype == 4) then
	 itype = 1;
      end
      if (counter[itype] > 0) then
	 return itype;
      end
      return nextType(itype, counter)
   end

   for i = 1, total do
      counter[itype] = counter[itype] - 1
      itype = nextType(itype, counter)

      res[itype][1 + initCounter[itype] - counter[itype]] = i * nbdir;
   end

   return res;
end

local function BuildAnimations(frames, ...)
   options = select(1, ...) or {}
   speed = options.speed or 6
   attackspeed = options.attackspeed or 5
   coolofftime = options.coolofftime or 1
   attacksound = options.attacksound or "sword attack"
   local returnvalue = {
      Still = options.Still or DefaultStillAnimation(),
      Move = options.Move or BuildMoveAnimation(frames[1], speed),
      Attack = options.Attack or BuildAttackAnimation(frames[2], attackspeed, coolofftime, attacksound),
      Death = options.Death or BuildDeathAnimation(frames[3]),
      Harvest_wood = options.Harvest_wood
   }
   if options.RepairAsAttack then
     returnvalue.Repair = returnvalue.Attack
   end
   return returnvalue
end

--
--
--

local frameNumbers_5_5_5_5 = GetFrameNumbers(5, {5, 5, 5})
local frameNumbers_5_5_5_4 = GetFrameNumbers(5, {5, 5, 4})
local frameNumbers_5_5_5_3 = GetFrameNumbers(5, {5, 5, 3})
local frameNumbers_5_5_4_5 = GetFrameNumbers(5, {5, 4, 5})
local frameNumbers_5_5_4_4 = GetFrameNumbers(5, {5, 4, 4})
local frameNumbers_5_5_4_3 = GetFrameNumbers(5, {5, 4, 3})
local frameNumbers_5_5_3_2 = GetFrameNumbers(5, {5, 3, 2})
local frameNumbers_5_5_2_3 = GetFrameNumbers(5, {5, 2, 3})
local frameNumbers_5_3_5_3 = GetFrameNumbers(5, {3, 5, 3})
local frameNumbers_5_2_5_3 = GetFrameNumbers(5, {2, 5, 3})


DefineAnimations("animations-brigand", BuildAnimations(frameNumbers_5_5_3_2))

DefineAnimations("animations-spider",
		 BuildAnimations(frameNumbers_5_5_4_5,
				 {attacksound = "fist attack", speed = 4}))

DefineAnimations("animations-water-elemental",
		 BuildAnimations(frameNumbers_5_3_5_3,
				 {speed = 4,
				  attacksound = "fireball attack"}))

DefineAnimations("animations-fire-elemental",
		 BuildAnimations(frameNumbers_5_5_4_3,
				 {speed = 5,
				  attacksound = "fireball attack"}))

DefineAnimations(
   "animations-slime",
   BuildAnimations(
      frameNumbers_5_5_5_3,
      {Still = {
	  "frame 0", "wait 8",
	  "frame 65", "wait 8",
	  "frame 70", "wait 8",
	  "frame 75", "wait 8",
	  "frame 80", "wait 8",
	  "frame 85", "wait 8",
	  "frame 90", "wait 1",
      },
      attacksound = "fist attack",
      attackspeed = 15,
	  coolofftime = 5,
      speed = 8})
)

local grizelda_garona_anim = {
   Still = DefaultStillAnimation(),
   Move = BuildMoveAnimation(frameNumbers_5_5_5_3[1]),
   Death = BuildDeathAnimation(frameNumbers_5_5_5_3[3])
}
DefineAnimations("animations-grizelda", grizelda_garona_anim)
DefineAnimations("animations-garona", grizelda_garona_anim)

DefineAnimations("animations-footman", BuildAnimations(frameNumbers_5_5_5_3))
DefineAnimations("animations-grunt", BuildAnimations(frameNumbers_5_5_5_3))

local worker_anim = BuildAnimations(
   frameNumbers_5_5_5_3,
   {Harvest_wood = BuildAttackHarvest(frameNumbers_5_5_5_3[2], 5, "tree chopping"),
    RepairAsAttack = true}
)
DefineAnimations("animations-peasant", worker_anim)
DefineAnimations("animations-peon", worker_anim)

local catapult_anim = BuildAnimations(
   frameNumbers_5_2_5_3,
   { speed = 10,
     attackspeed = 25,
     coolofftime = 49,
     attacksound = "catapult attack" }
)
DefineAnimations("animations-human-catapult", catapult_anim)
DefineAnimations("animations-orc-catapult", catapult_anim)

local anim_rider = BuildAnimations(frameNumbers_5_5_5_5, {speed = 3})
DefineAnimations("animations-knight", anim_rider)
DefineAnimations("animations-raider", anim_rider)
local anim_rider1 = BuildAnimations(frameNumbers_5_5_5_5, {speed = 2})
DefineAnimations("animations-knight1", anim_rider1)
DefineAnimations("animations-raider1", anim_rider1)
local anim_rider2 = BuildAnimations(frameNumbers_5_5_5_5, {speed = 1})
DefineAnimations("animations-knight2", anim_rider2)
DefineAnimations("animations-raider2", anim_rider2)

DefineAnimations("animations-daemon", BuildAnimations(frameNumbers_5_5_5_5))
DefineAnimations("animations-ogre",
		 BuildAnimations(frameNumbers_5_5_5_5,
				 {attacksound = "fist attack"}))
DefineAnimations("animations-skeleton", BuildAnimations(frameNumbers_5_5_5_5))
DefineAnimations("animations-scorpion",
		 BuildAnimations(frameNumbers_5_5_5_5,
				 {attacksound = "fist attack", speed = 4}))
DefineAnimations("animations-the-dead", BuildAnimations(frameNumbers_5_5_5_5))

DefineAnimations("animations-archer",
		 BuildAnimations(frameNumbers_5_5_2_3,
				 {attackspeed = 10,
				  attacksound = "arrow attack"}))
DefineAnimations("animations-spearman",
		 BuildAnimations(frameNumbers_5_5_2_3,
				 {attackspeed = 10,
				  attacksound = "arrow attack"}))

DefineAnimations("animations-cleric",
		 BuildAnimations(frameNumbers_5_5_4_3,
				 {attacksound = "fireball attack", speed = 7}))

DefineAnimations("animations-necrolyte",
		 BuildAnimations(frameNumbers_5_5_5_4,
				 {attacksound = "fireball attack", speed = 7}))

DefineAnimations("animations-conjurer",
		 BuildAnimations(frameNumbers_5_5_4_4,
				 {attacksound = "fireball attack", speed = 7}))
DefineAnimations("animations-warlock",
		 BuildAnimations(frameNumbers_5_5_4_4,
				 {attacksound = "fireball attack", speed = 7}))

DefineAnimations("animations-medivh",
		 BuildAnimations(frameNumbers_5_5_5_3,
				 {attacksound = "lightning"}))
DefineAnimations("animations-lothar", BuildAnimations(frameNumbers_5_5_5_3))

DefineAnimations(
   "animations-building",
   {Still = {"frame 0", "wait 5"},
    Death = {"frame 0", "wait 1"}})

DefineAnimations(
   "animations-ruins",
   {Death = {"unbreakable begin", "frame 0", "wait 600", "unbreakable end", "wait 1"}})

DefineAnimations(
   "animations-orc-dead-body",
   {Death = {"unbreakable begin",
	     "frame 5", "wait 300",
	     "frame 10", "wait 300",
	     "frame 15", "wait 300",
	     "frame 20", "wait 300",
	     "unbreakable end",
	     "wait 1"}})

DefineAnimations(
   "animations-human-dead-body",
   {Death = {"unbreakable begin",
	     "frame 0", "wait 300",
	     "frame 10", "wait 300",
	     "frame 15", "wait 300",
	     "frame 20", "wait 300",
	     "unbreakable end",
	     "wait 1"}})

DefineAnimations("animations-wounded", {Still = {"frame 0", "wait 5"}})

DefineAnimations(
   "animations-destroyed-place",
   {Still = {"frame 0", "wait 4",
	     "frame 0", "wait 1"}})
