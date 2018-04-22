local term = require"term"
local list = require "linkedList"
local objects = nil
return {
	addShape = function(self,shape)
		if objects then
			local place, node = objects:insertCompare(
				function(node)
					return node.val.z < shape.z
				end,
				shape
			)
			if place == 1 then
				objects = node
			end
			objects:forEach(function(node) print(node.val.z) end)
		else
			objects = list:new(shape)
		end
		return shape
	end,
	draw = function(self)
		os.execute("clear")
		if objects then
			objects:forEach(
				function(node)
					node.val:render(self)
				end
			)
		end
		io.flush()
	end,
	write = function(self,text)
		if backgroundColor then
			io.write(term.colors["on"..backgroundColor](text))
		else
			io.write(text)
		end
	end,
	setBackgroundColor = function(self,color)
		assert(term.colors["on"..color],color.." is not a valid background color")
		backgroundColor = color
		return true
	end,
	debug = function(self)
		objects:forEach(
			function(node)
				print(node.val.color or node.val.command)
			end
		)
		objects:forEach(print)
	end,
	removeShape = function(self,obj)
		if not objects then return end
		objects = objects:removeCompare(
			function(node)
				return node.val == obj
			end
		)
	end,
	removeAll = function(self)
		objects = nil
	end
}
