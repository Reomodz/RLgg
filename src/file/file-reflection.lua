--[[

Use luajava to build a file class library

Disadvantages: incompatible with function overloading. You will know the reason after thinking about it.

]] --
local Class = luajava.bindClass('java.lang.Class')
local FileClass = luajava.bindClass('java.io.File')

local file = {}

file.new = function(filePath)
	return luajava.new(FileClass, filePath)
end

-- java.lang.reflect.Method[]
local methods = Class.getMethods(FileClass)

for i = 1, #methods do
	local method = methods[i]
	local name = method:getName()

	local function invoke(filePath, ...)
		local File = file.new(filePath)

		-- Reflection Execution
		return method:invoke(File, {...})
	end

	file[name] = invoke
end

print(file)

print(file.isDirectory('/sdcard/'))

