--[[

    Use luajava to build a string library

    Disadvantages: incompatible with function overloading. You will know the reason after thinking about it.

]] --
local jstring = {}

local Class = luajava.bindClass('java.lang.Class')
local StringClass = luajava.bindClass('java.lang.String')

-- java.lang.reflect.Method[]
local methods = Class.getMethods(StringClass)

for i = 1, #methods do
	local method = methods[i]
	local name = method:getName()

	-- If the name corresponding to the jstring is not equal to nil, it means that it already exists, and the current method is overloaded, so ignore it.
	if jstring[name] == nil then

		local function invoke(s, ...)
			-- The variable s is of type string, which will be automatically converted to java.lang.String by reflection. Other types may fail to be converted and throw an exception.

			-- If the type of s is number, help convert it, otherwise it will also be an exception. For other types, ignore it and let it be an exception.
			if type(s) == 'number' then
				s = tostring(s)
			end

			-- Reflection execution
			return method:invoke(s, {...})
		end

		jstring[name] = invoke

	end
end

-- java.lang.String.split returns java.lang.String[] which is not suitable for use in Lua, so it needs to be fixed
local func = jstring.split
jstring.split = function(...)
	local list = func(...)
	local t = {}
	for i = 1, #list do
		t[i] = tostring(list[i])
	end
	return t
end

print(jstring)

local url = 'https://gitee.com/rlyun'

-- Determine whether the string starts with http
print(jstring.startsWith(url, 'http'))
print(jstring.startsWith(123456, 'http'))

-- Determine whether the string ends with rlyun
print(jstring.endsWith(url, 'rlyun'))

-- Splitting a string
print(jstring.split(url, '/'))
