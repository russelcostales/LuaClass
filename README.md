# Using the Class Creation Functions
## Overview

This Lua script provides functions to create classes and subclasses with inheritance and mixin capabilities. It allows you to define structured object-oriented programming constructs in Lua with reduced boilerplate.

## Example Usage

### Creating a New Class

To create a new class, use the `newClass` function:

```lua
local class = require("path.to.class")

local MyClass = class.newClass("MyClass")

function MyClass:__init()
    self._variable = 1
end

function MyClass:getVariable()
    return self._variable
end

local instance = MyClass.new()
print(instance:getVariable()) -- Output: 1
```

### Creating a Subclass
You can create a subclass that inherits from a superclass using `newSubClass`:
```lua
local class = require("path.to.class")

local SuperClass = class.newClass("SuperClass")

function SuperClass:__init()
    self._greeting = "Hello!"
end

function SuperClass:getGreeting()
    return self._greeting
end

local SubClass = class.newSubClass("SubClass", SuperClass)

function SubClass:__init()
    self._name = "John"
end

function SubClass:getName()
    return self._name
end

local instance = SubClass.new()
print(instance:getGreeting()) -- Output: Hello!
print(instance:getName())     -- Output: John
```

Including Functionality from a Superclass
To create a class that includes functionality from a superclass, use `includesClass`:

## Additional Notes

- **Constructor** `(__init)`: Each class and subclass can define an `__init` method to initialize instance variables.
- **Inheritance:** Subclasses inherit methods and properties from their superclasses.
- **Mixin Functionality:** Use `includesClass` to incorporate functionality from another class instance.

## Conclusion

These class creation functions provide a structured approach to object-oriented programming in Lua, supporting inheritance and mixin capabilities. By using these functions, you can organize and manage complex code structures effectively.

For more details, refer to the Lua script's comments or documentation provided with the script itself.