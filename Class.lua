local function Class(base, name)
    local c = {}
    assert(type(name) == "string", "Wrong type of Name")
    
    local function copy(t1, t2)
        for k, v in pairs(t2) do
            if type(v) == "table" then
                t1[k] = {}
                copy(t1[k], v)
            else
                t1[k] = v
            end
        end
    end
    
    copy(c, base or {})
    c.Name = name
    local mt = {
        __call = function (self, prot, name)
            local c = Class(self, name)
            copy(c, prot or {})
            return self:Init(c)
        end,
        __index = function (self, key)
            local children = rawget(self, "Children")
            return rawget(self, key) or children[key]
        end,
        __newindex = function (self, k, v)
            if k == "Parent" then
                rawget(self, "Parent"):RemoveChild(self)
                rawset(self, k, nil)
                rawset(self, k, v)
                v:AddChild(self)
                return
            end
            rawset(self, k, v)
        end
    }
    c = setmetatable(c, mt)
    c.__class = true

    return c
end

return Class