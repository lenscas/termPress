local term = require"term"
local list = require "linkedList"
local objects = nil
return {
	addShape = function(self,shape)
		if objects then
			local place, node = objects:insertCompare(
				function(node) return node.val.z < shape.z end,
				shape
			)
			if place == 1 then
				objects = node
			end
			objects:forEach(function(node) print(node.val.z) end)
		else
			objects = list:new(shape)
		end
	end,
	draw = function(self)
		term.clear()
		if objects then
			objects:forEach(
				function(node)
					node.val:render()
				end
			)
		end
		io.flush()
	end,
	debug = function(self)
		objects:forEach(
			function(node)
				print(node.val.color)
			end
		)
	end
}
