--[[
    Pipe Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The Pipe class represents the pipes that randomly spawn in our game, which act as our primary obstacles.
    The pipes can stick out a random distance from the top or bottom of the screen. When the player collides
    with one of them, it's game over. Rather than our bird actually moving through the screen horizontally,
    the pipes themselves scroll through the game to give the illusion of player movement.
]]

Trophy = Class{}

TROPHY_SIZE = 56

function Trophy:init(type, x, y)
    self.image = love.graphics.newImage('trophy_' ..type.. '.png')
    self.x = x
    self.y = y

    self.width = TROPHY_SIZE
    self.height = TROPHY_SIZE
end

function Trophy:update(dt)
    
end

function Trophy:render()
    love.graphics.draw(self.image, self.x, self.y)
end