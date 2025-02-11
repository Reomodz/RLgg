--[[

Use luajava to build a file class library

This is better than reflection, supports method overloading, and the underlying luajava will automatically handle the conversion
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

	-- Get the function created by luajava
	local func = FileClass[name]
	if type(func) == 'function' then

		local function invoke(filePath, ...)
			local File = file.new(filePath)
			return func(File, ...)
		end

		file[name] = invoke
	end
end

print(file)

print(file.isDirectory('/sdcard/'))

