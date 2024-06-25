-- Class
-- Russel Costales
-- August 6, 2024

-- newClass: Creates a new class with the specified className.
-- @param className (string): The name of the class.
-- @return (table): The newly created class table.
local function newClass(className)
	local myClass = {}
	myClass.__index = myClass
	myClass.ClassName = className

	-- myClass.new: Constructs a new instance of the class.
	-- @param ...: Arguments to pass to the initializer (__init) method.
	-- @return (table): The new instance of the class.
	function myClass.new(...)
		local self = setmetatable({}, myClass)
		self:__init(...)
		return self
	end

	return myClass
end

-- newSubClass: Creates a new subclass inheriting from a super class.
-- @param className (string): The name of the subclass.
-- @param super (table): The superclass to inherit from.
-- @return (table): The newly created subclass table.
local function newSubClass(className, super)
	local mySubClass = {}
	mySubClass.__index = setmetatable(mySubClass, { __index = super })
	mySubClass.ClassName = className

	-- mySubClass.new: Constructs a new instance of the subclass.
	-- @param ...: Arguments to pass to the initializer (__init) method.
	-- @return (table): The new instance of the subclass.
	function mySubClass.new(...)
		local internal = super and super.new() or {}
		local self = setmetatable(internal, mySubClass)
		self:__init(...)
		return self
	end

	return mySubClass
end

-- includesClass: Creates a new class that includes functionality from a superclass.
-- @param className (string): The name of the new class.
-- @param super (table): The superclass to include functionality from.
-- @return (table): The newly created class table.
local function includesClass(className)
	local myClass = newClass(className)
	function myClass.new(super, ...)
		local self = setmetatable({ super = super }, myClass)
		self:__init(...)
		return self
	end
	return myClass
end

local methods = {
	newClass = newClass,
	newSubClass = newSubClass,
	includesClass = includesClass,
}

return methods
