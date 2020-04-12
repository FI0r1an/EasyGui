return Base({
    BaseName = "Frame",
    OnDraw = function (self, alpha)
        Style.Rect(self:GetX(), self:GetY(), self:GetWidth(), self:GetHeight(), self.LineWidth,
            self.Color, self.LineColor, alpha or self.GlobalAlpha)
    end
}, "Frame")