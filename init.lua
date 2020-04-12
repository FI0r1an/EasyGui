local path = (...):match("(.-)[^%/%.]+$")

_G.Class = require(path .. "Class")
_G.Style = require(path .. "Style")
_G.Base = require(path .. "Base")

local reqList = {"Screen", "Frame", "TextLabel", "TextButton"}
local easyGui = {}

for _, v in pairs(reqList) do
    easyGui[v] = require(path .. v)
end

function easyGui.UnpackToGlobal()
    for k, v in pairs(easyGui) do
        _G[k] = v
    end
end

return easyGui