return Base({
    BaseName = "TextLabel",
    TextAlpha = 1,
    Text = "Hello",
    TextColor = {0, 0, 0, 1},
    OffsetX = 0,
    OffsetY = 0,
    Font = nil,
    Align = {Style.TextStyleEnum.LEFT, Style.TextStyleEnum.RIGHT},
    OnDraw = function (self, alpha)
        Style.Rect(self:GetX(), self:GetY(), self:GetWidth(), self:GetHeight(), self.LineWidth,
            self.Color, self.LineColor, alpha or self.GlobalAlpha)
        Style.Print(self.Text, self.Align, self, self.TextColor, self.Font, alpha or self.TextAlpha)
    end
}, "TextLabel")