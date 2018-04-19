local Node = {}
function Node:new(val,o)
	o = o or {}
	o.val = val
	setmetatable(o,self)
	self.__index = self
	return o
end
function Node:forEach(fun,count,pref)
	count = count or 0
	fun(self,count,pref)
	if self.next then
		self.next:forEach(fun,count+1,self)
	end
end
function Node:execNext(fun)
	if self.next then
		return true,fun(self.next)
	end
	return false
end
function Node:insertAt(val,at,pref)
	at = (at or 1) - 1
	if at==0 then
		local newNode =Node:new(val)
		newNode.next=self
		if pref then
			pref.next = newNode
		end
		return true,newNode
	else
		if self.next then
			return self.next:insertAt(at,val,pref)
		else
			return false
		end
	end
end
function Node:insertCompare(fun,val,pref,lok)
	lok = lok or 1
	if fun(self,val) then
		local node = Node:new(val)
		node.next = self
		if pref then
			pref.next = node
		end
		return lok,node
	else
		if not self.next then
			local node = Node:new(val)
			self.next = node
			return lok + 1,node
		else
			return self.next:insertCompare(fun,val,self,lok+1)
		end
	end
end
function Node:removeAt(at,pref)
	at = (at or 1) - 1
	if at == 0 then
		if pref then
			pref.next = self.next
		end
		return self.next
	else
		return self.next and self.next:removeAt(at,self)
	end
end
function Node:removeCompare(fun,all,pref,head)
	all = all or false
	if fun(self) then
		self:removeAt(nil,pref)
		if not all then
			return head or self.next
		end
	end
	if not head then
		head = self
	end
	if self.next then
		return self.next:removeCompare(fun,all,self,head)
	end
end
return Node
