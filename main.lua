(require"init").UnpackToGlobal()

function love.load()
    gui = Screen({}, "MyGui")
    local node = TextButton(
        {
            Size = {0, 0, 128, 128},
            Text = "Press maaaae",
            OnLeftClicked = function (self, x, y)
                print(111)
            end,
        }, "TextButton1"
    )
    gui:AddChild(node)
end

function love.update(dt)
    gui:Update(dt)
end

function love.draw()
    gui:Draw(1)
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf("AAAA", 0,0, 32, "center")
end

function love.keypressed(key)
    gui:KeyPressed(key)
end

function love.keyreleased(key)
    gui:KeyReleased(key)
end

function love.mousepressed(x, y, btn)
    gui:MousePressed(x, y, btn)
end

function love.mousereleased(x, y, btn)
    gui:MouseReleased(x, y, btn)
end