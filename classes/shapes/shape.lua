local Shape = {}
local term = require"term"
function Shape:extend(obj)
	obj = obj or {}
	return setmetatable(obj,{__index=self})
end
function Shape:getTerm()
	return term
end
function Shape:render()
	error("Not implemented")
end

return Shape
