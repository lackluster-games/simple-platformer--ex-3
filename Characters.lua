CHARACTER         = {x = nil, y = nil, speed = nil, icon = nil}   --Character class
CHARACTER.__index = CHARACTER                                    --make sure index points to CHARACTER class
ENEMY             = {move_r = nil}   --enemy class
setmetatable(ENEMY,CHARACTER)        --set enemy metatable to character metatable. this makes enemy a subclass of character
ENEMY.__index     = ENEMY

PLAYER             = {}                --player class
setmetatable(PLAYER,CHARACTER)        --set player metatable to character metatable. this makes player a subclass of character
PLAYER.__index     = PLAYER


--create a new chracter object
function CHARACTER:new(x,y,speed,icon)
    local o = o or {}
    setmetatable(o,self)
    o.x      = x
    o.y      = y
    o.speed  = speed  --determines how fast a charcter moves around
    o.icon   = love.graphics.newImage(icon)
    return o
end

--create a new player object
function PLAYER:new(x,y,speed,icon)
    local o = CHARACTER:new(x,y,speed,icon)
    setmetatable(o,self)
    return o
end

--create a new enemy object
function ENEMY:new(x,y,speed,icon)
    local o = CHARACTER:new(x,y,speed,icon)
    setmetatable(o,self)
    o.move_r = true  --if true, then charcter move to the right
    return o
end

--draw the character to screen
function CHARACTER:draw()
    love.graphics.draw(self.icon,self.x,self.y)
end

--move the enemy left and right across screen.
function ENEMY:move()
    if self.move_r == true then   --while move right is true
        self.x = self.x + self.speed 
        if self.x > WIDTH then       --when enemy reaches the right hand boundary
            self.x      = WIDTH
            self.move_r = false
        end
    else
        self.x = self.x - self.speed
        if self.x < 0 then          --when enemy reaches the left hand side
            self.x      = 0
            self.move_r = true
        end
    end

end

