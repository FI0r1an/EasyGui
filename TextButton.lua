return Base({
    BaseName = "TextButton",
    TextAlpha = 1,
    OriginText = "Hello",
    Text = "Hello",
    TextColor = {{0, 0, 0, 1}, {0, 0, 0, 1}, {1, 1, 1, 1}},
    Color = {{1, 1, 1, 1}, {.8, .8, .8, 1}, {0.2, 0.2, 0.2, 1}},
    LineWidth = 5,
    LineColor = {{0.5, 0.5, 0.5, 1}, {0.5, 0.5, 0.5, 1}, {0.5, 0.5, 0.5, 1}},
    OffsetX = 0,
    OffsetY = 0,
    Font = nil,
    State = 1,
    Align = {Style.TextStyleEnum.CENTER, Style.TextStyleEnum.CENTER},
    OnDraw = function (self, alpha)
        Style.Rect(self:GetX(), self:GetY(), self:GetWidth(), self:GetHeight(), self.LineWidth,
            self.Color[self.State], self.LineColor[self.State], alpha or self.GlobalAlpha)
        Style.Print(self.Text, self.Align, self, self.TextColor[self.State], self.Font, alpha or self.TextAlpha)
    end,
    IsCollided = function (self)
        local lx, rx, uy, dy
        lx = self:GetX()-self.LineWidth
        uy = self:GetY()-self.LineWidth
        rx = lx + self:GetWidth()+self.LineWidth*2
        dy = uy + self:GetHeight()+self.LineWidth*2
        local mx, my = love.mouse.getPosition()
        return (mx > lx and mx < rx) and (my > uy and my < dy)
    end,
    CanHover = true,
    OnUpdate = function (self, dt)
        local mx, my = love.mouse.getPosition()
        if self.CanHover then
            if self:IsCollided() then
                self.State = 2
                self:OnHovered(mx, my)
            else
                self.State = 1
            end
        end
    end,
    MousePressed = function (self, x, y, btn)
        if self:IsCollided() then
            self.CanHover = false
            self.State = 3
            if btn == 1 then
                self:OnLeftClicked(x, y, btn)
            elseif btn == 2 then
                self:OnRightClicked(x, y, btn)
            elseif btn == 3 then
                self:OnCenterClicked(x, y, btn)
            end
        end
    end,
    MouseReleased = function (self, x, y, btn)
        self:OnReleased(x, y, btn)
        self.CanHover = true
        self.State = 1
    end,
    OnHovered = function (self, x, y) end,
    OnLeftClicked = function (self, x, y) end,
    OnCenterClicked = function (self, x, y) end,
    OnRightClicked = function (self, x, y) end,
    OnReleased = function (self, x, y, btn) end,
}, "TextButton")