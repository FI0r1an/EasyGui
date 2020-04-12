local love = _G.love
return Base({
    BaseName = "Screen",
    Size = {1, 1, love.graphics.getDimensions()},
    KeyPressed = function (self, key)
        for _, v in pairs(self:GetChildren()) do
            v:KeyPressed(key)
        end
    end,
    KeyReleased = function (self, key)
        for _, v in pairs(self:GetChildren()) do
            v:KeyReleased(key)
        end
    end,
    MousePressed = function (self, x, y, btn)
        for _, v in pairs(self:GetChildren()) do
            v:MousePressed(x, y, btn)
        end
    end,
    MouseReleased = function (self, x, y, btn)
        for _, v in pairs(self:GetChildren()) do
            v:MouseReleased(x, y, btn)
        end
    end
}, "Screen")