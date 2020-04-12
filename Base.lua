return Class({
    BaseName = "Base",
    Children = {},
    Parent = nil,
    Color = {1, 1, 1, 1},
    Position = {0, 0, 0, 0},
    Size = {0, 0, 32, 32},
    GlobalAlpha = 1,
    Enable = true,
    LineWidth = 3,
    LineColor = {.5, .5, .5, 1},
    Init = function (self, c)
        c.Children = {}
        return c
    end,
    Limit = {},
    AddChild = function (self, child)
        assert(type(child) == "table", "Wrong type of Child")
        self.Children[child.Name] = child
        rawset(child, "Parent", self)
    end,
    RemoveChild = function (self, child)
        assert(type(child) == "table" or type(child) == "string", "Wrong type of Child")
        local name = (type(child) == "string") and child or (child.Name)
        local child = self.Children[name]
        child.Parent = nil
        self.Children[name] = nil
    end,
    FindChild = function (self, name)
        return self.Children[name]
    end,
    ClearChildren = function (self)
        for k, _ in pairs(self.Children) do
            self.Children[k] = nil
        end
    end,
    GetChildren = function (self)
        return rawget(self, "Children")
    end,
    GetParent = function (self)
        return rawget(self, "Parent")
    end,
    OnUpdate = function (self, dt) end,
    Update = function (self, dt)
        self.Limit = self:GetRoot().Size
        if self.Enable then
            for _, v in pairs(self:GetChildren()) do
                v:Update(dt)
            end
            self:OnUpdate(dt)
        end
    end,
    OnDraw = function (self, alpha) end,
    Draw = function (self, alpha)
        for _, v in pairs(self:GetChildren()) do
            v:Draw(alpha or self.GlobalAlpha)
        end
        self:OnDraw(alpha or self.GlobalAlpha)
    end,
    KeyPressed = function (self, key) end,
    KeyReleased = function (self, key) end,
    MousePressed = function (self, x, y, btn) end,
    MouseReleased = function (self, x, y, btn) end,
    Show = function (self)
        self.GlobalAlpha = 1
    end,
    Unshow = function (self)
        self.GlobalAlpha = 0
    end,
    GetRoot = function (self)
        local root = self
        while root.Parent do
            root = root.Parent
        end
        return root
    end,
    GetX = function (self)
        return self.Position[1] * self.Limit[3] + self.Position[3]
    end,
    GetY = function (self)
        return self.Position[2] * self.Limit[4] + self.Position[4]
    end,
    GetPosition = function (self)
        return self:GetX(), self:GetY()
    end,
    GetWidth = function (self)
        return self.Size[1] * self.Limit[3] + self.Size[3]
    end,
    GetHeight = function (self)
        return self.Size[2] * self.Limit[4] + self.Size[4]
    end,
    GetSize = function (self)
        return self:GetWidth(), self:GetHeight()
    end
}, "Base")