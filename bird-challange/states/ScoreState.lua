--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]
ScoreState = Class {
    __includes = BaseState
}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    if self.score >= 15 then
        Trophy('gold', VIRTUAL_WIDTH / 2 - TROPHY_SIZE / 2, 120):render()
    elseif self.score >= 10 then
        Trophy('silver', VIRTUAL_WIDTH / 2 - TROPHY_SIZE / 2, 120):render()
    elseif self.score >= 5 then
        Trophy('bronze', VIRTUAL_WIDTH / 2 - TROPHY_SIZE / 2, 120):render()
    end
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end
