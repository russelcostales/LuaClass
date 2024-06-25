local replicatedStorage = game:GetService("ReplicatedStorage")

return function()
	local class = require(replicatedStorage.Class)

	local function checkDefaultClass(method)
		it("should have a constructor -> " .. method, function()
			local class = class[method]("class")

			expect(class.new).to.be.a("function")
		end)

		it("should have a class name -> " .. method, function()
			local class = class[method]("class")

			expect(class.ClassName).to.be.a("string")
		end)

		it("should initialize on instantiate -> " .. method, function()
			local class = class[method]("class")

			function class:__init()
				self._variable = 1
			end

			function class:getVariable()
				return self._variable
			end

			local object = class.new()

			expect(object:getVariable()).to.be.ok()
		end)
	end

	describe("Class", function()
		checkDefaultClass("newClass")
	end)

	describe("Sub Class", function()
		checkDefaultClass("newSubClass")

		it("should inherit super methods -> newSubClass", function()
			local super = class.newClass("super")

			function super:__init()
				self._greeting = "hello!"
			end

			function super:getGreeting()
				return self._greeting
			end

			local sub = class.newSubClass("inherit", super)

			function sub:__init()
				self._name = "John"
			end

			function sub:getName()
				return self._name
			end

			local mySub = sub.new()

			expect(mySub:getGreeting()).to.be.a("string")
		end)

		it("should include sub methods -> newSubClass", function()
			local super = class.newClass("super")

			function super:__init()
				self._greeting = "hello!"
			end

			function super:getGreeting()
				return self._greeting
			end

			local sub = class.newSubClass("inherit", super)

			function sub:__init()
				self._name = "John"
			end

			function sub:getName()
				return self._name
			end

			local mySub = sub.new()

			expect(mySub:getName()).to.be.a("string")
		end)
	end)

	describe("Includes Class", function()
		checkDefaultClass("includesClass")

		it("should include super methods -> includesClass", function()
			local super = class.newClass("super")

			function super:__init()
				self._greeting = "hello!"
			end

			function super:getGreeting()
				return self._greeting
			end

			local superObject = super.new("super")
			local includes = class.includesClass("includes")

			function includes:__init()
				self._name = "John"
			end

			function includes:getName()
				return self._name
			end

			local mySub = includes.new(superObject)
			expect(mySub.super:getGreeting()).to.be.a("string")
		end)

		it("should include sub methods -> includesClass", function()
			local super = class.newClass("super")

			function super:__init()
				self._greeting = "hello!"
			end

			function super:getGreeting()
				return self._greeting
			end

			local superObject = super.new("super")
			local includes = class.includesClass("includes")

			function includes:__init()
				self._name = "John"
			end

			function includes:getName()
				return self._name
			end

			local mySub = includes.new(superObject)
			expect(mySub:getName()).to.be.a("string")
		end)
	end)
end
