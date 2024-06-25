# Lua Class and Subclass Creation Utilities

## `newClass(className)`

Creates a new class with the specified className.

### Parameters

- `className` (string): The name of the class.

### Returns

(table): The newly created class table.

## `newClass.new(...)`

Constructs a new instance of the class.

### Parameters

- `...`: Arguments to pass to the initializer (`__init`) method.

### Returns

(table): The new instance of the class.

## `newSubClass(className, super)`

Creates a new subclass inheriting from a superclass.

### Parameters

- `className` (string): The name of the subclass.
- `super` (table): The superclass to inherit from.

### Returns

(table): The newly created subclass table.

## `newSubClass.new(...)`

Constructs a new instance of the subclass.

### Parameters

- `...`: Arguments to pass to the initializer (`__init`) method.

### Returns

(table): The new instance of the subclass.

## `includesClass(className)`

Creates a new class that includes functionality from a superclass.

### Parameters

- `className` (string): The name of the new class.

### Returns

(table): The newly created class table.

## `includesClass.new(super, ...)`

Constructs a new instance of the class that includes functionality from a superclass.

### Parameters

- `super` (table): The superclass to include functionality from.
- `...`: Arguments to pass to the initializer (`__init`) method.

### Returns

(table): The new instance of the class.

---

The Lua code provided includes utilities for creating classes (`newClass`), subclasses (`newSubClass`), and classes that include functionality from a superclass (`includesClass`). Each function is designed to facilitate object-oriented programming in Lua by defining classes and their instances.

### Usage

- Use `newClass(className)` to create a new class.
- Use `newSubClass(className, super)` to create a subclass inheriting from a superclass.
- Use `includesClass(className)` to create a new class that includes functionality from a superclass.

```lua
-- Lua code goes here
