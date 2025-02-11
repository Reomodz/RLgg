--[[
This function is built into RLGG string.crc32

Need to use

java.util.zip.CRC32
update(byte[] b)

In rlgg, string type can be automatically converted to byte[]

]] --
-- Get string CRC
local function crc32(content)
	local instance = luajava.newInstance('java.util.zip.CRC32')
	instance:update(tostring(content))
	return instance:getValue()
end

local res = crc32('RLGG')
print(res, string.format('0x%x', res))

