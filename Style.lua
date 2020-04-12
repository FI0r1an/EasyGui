local Style = {}
local love = _G.love

Style.TextStyleX = {
    function (x, base)
        return x + base.LineWidth
    end,
    function (x, base)
        return x + base.LineWidth
    end,
    function (x, base)
        return x
    end
}

Style.TextStyleY = {
    function (y, base)
        return y + base.LineWidth
    end,
    function (y, base)
        return y + base.LineWidth + base:GetHeight() / 2
    end,
    function (y, base)
        return y + base.LineWidth + base:GetHeight() - (base.Font or Style.GlobalFont):getHeight()
    end
}

Style.GlobalFont = love.graphics.newFont("Inconsolata-Regular.ttf", 32)

Style.TextStyleEnum = {
    LEFT = 1, CENTER = 2, RIGHT = 3
}
Style.TextStyleText = {
    "left", "center", "right"
}

function Style.Text(text, align, x, y, base)
    local limit = base:GetWidth() + base.LineWidth/2
    local xx, yy
    xx = Style.TextStyleX[align[1]](x, base)
    yy = Style.TextStyleY[align[2]](y, base)
    love.graphics.printf(text, xx, yy, limit, Style.TextStyleText[align[1]])
end

function Style.Rect(x, y, w, h, lw, c1, c2, a)
    love.graphics.setColor(c2[1], c2[2], c2[3], c2[4] * a)
    love.graphics.rectangle("fill", x, y, w + lw*2, h + lw*2)
    love.graphics.setColor(c1[1], c1[2], c1[3], c1[4] * a)
    love.graphics.rectangle("fill", x + lw, y + lw, w, h)
end

function Style.Print(text, align, base, c, f, a)
    love.graphics.setColor(c[1], c[2], c[3], c[4] * a)
    love.graphics.setFont(f or Style.GlobalFont)
    love.graphics.translate(base.OffsetX, base.OffsetY)
    Style.Text(text, align, base:GetX(), base:GetY(), base)
    love.graphics.translate(-base.OffsetX, -base.OffsetY)
end

return Style