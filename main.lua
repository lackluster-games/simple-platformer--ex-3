--part 2 of a series on building a simple platformer using love 2d.
--code hosted at: https://github.com/lackluster-games/simple-platformer-ex-3
--licensed inde the GPL
--  Copyright (C) <2020>  <return5>
--
--   This program is free software: you can redistribute it and/or modify
--   it under the terms of the GNU General Public License as published by
--   the Free Software Foundation, either version 3 of the License, or
--   (at your option) any later version.
--
--   This program is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--   GNU General Public License for more details.
--
--   You should have received a copy of the GNU General Public License
--   along with this program.  If not, see <https://www.gnu.org/licenses/>.

--tell lua about 'Characters.lua'
require "Characters"

--function to draw each enemy to screen
local function drawEnemies()
    --for every enemy in enemy_list
    for _,enemy in ipairs(ENEMY_LIST) do
        enemy:draw()  --call draw function on enemy object
    end
end

--move each enemy on screen
local function moveEnemies()
    --for each enemy in enemy_list
    for _,enemy in ipairs(ENEMY_LIST) do
        enemy:move()  --cal move function on enemy object
    end
end

--fill enemy_list with enemy objects
local function makeEnemies()
    --loop through three times
    for i=1,3,1 do
        ENEMY_LIST[i] = ENEMY:new(i*100,80,1,"/images/enemy.png")  --make new enemy object for each 'i' index in enemy_list
    end
end

--load this stuff when program starts
function love.load()
    player = PLAYER:new(20,20,10,"/images/player.png")   --make a player object
    HEIGHT = 150  --height of screen
    WIDTH  = 300  --right hand boundary
    ENEMY_LIST ={}  --holds list of enemies
    makeEnemies()  --fill enemy_list with enemy objects
end

--draw stuff each frame
function love.draw()
    player:draw()  --draw player to screen
    drawEnemies()  --draw the enemies to screen
end

--updates every frame
function love.update()
    moveEnemies()  --move each enemy each frame
end

--handle keyboard input 
function love.keypressed(key)
    if key == "w" then
        player.y = player.y - 10  
        if player.y < 0 then     --if player ties to go above the upper boundary
            player.y = 0
        end
    elseif key == "s" then
        player.y = player.y + 10  
        if player.y > HEIGHT then   --if player tries to go below lower boundary
            player.y = HEIGHT
        end
    elseif key == "a" then
        player.x = player.x - 10   
        if player.x < 0 then      --if player tries to go pass the left hand boundary
            player.x = 0
        end
    elseif key == "d" then
        player.x = player.x + 10   
        if player.x > WIDTH then  --if player tries to go pass the right hand boundary
            player.x = WIDTH
        end
    end
end



