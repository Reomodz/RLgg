--[[


Author: RL
Production time: last year
Open source time: April 15, 2023
Description: This module can add components to the "floating window frame"

Why open source?
The purpose is to provide some ideas for floating windows to the developers of RLGG
Plus I don't want to maintain it because it was so bad at the beginning


On the same day of the same year, another windowManager module was open sourced. This module is more sophisticated and has a higher degree of freedom. It can build a floating window UI from scratch.


floatingWindowManager
Related function usage documentation
https://gitee.com/rlyun/rlgg/tree/master/%E6%82%AC%E6%B5%AE%E7%AA%97UI%E6%A1%86%E6%9E%B6


]]

local function newGradientLayout(layout)
	local baseLayout = {
		GradientDrawable,
		cornerRadius = '15dp'
	}

	return table.copy(baseLayout, layout)
end

local function getGradientDrawable(color, cornerRadius)
	local attr = {
		cornerRadius = cornerRadius,
		color = color
	}
	local layout = newGradientLayout(attr)
	return luajava.loadlayout(layout)
end

local function getNormalGradientDrawable()
	return getGradientDrawable(0x30000000)
end

local function getPressedGradientDrawable()
	return getGradientDrawable(0x20000000)
end

local function newStateListDrawable()
	local drawable = StateListDrawable()
	drawable:addState({-android.R.attr.state_pressed}, getNormalGradientDrawable())
	drawable:addState({android.R.attr.state_pressed}, getPressedGradientDrawable())
	return drawable
end

local floatingWindowManager = {}

function floatingWindowManager:getBackgroundColor(alpha)
	if not isNumber(alpha) then
		alpha = 0xff
	else
		if alpha < 0 then
			alpha = 0
		elseif alpha > 0xff then
			alpha = 0xff
		end
	end
	return self.backgroundInfo:getColor() + 0x1000000 * alpha
end

function floatingWindowManager:runYoYo(callback)
	local YoYoImpl = self.YoYoImpl
	if not YoYoImpl then
		return false
	end
	return callback(YoYoImpl)
end

function floatingWindowManager:init()
	-- ZoomOut
	local thread = luajava.startThread(function()
		self.YoYoImpl = luajava.getYoYoImpl()
	end)
	thread:join(50)
end

local storage = storages.create('floatingWindowManager-64b882d50b534136')
-- print(storage.backgroundInfo)
floatingWindowManager.version = '1.0.4'

local backgroundInfo = storage.backgroundInfo or {
	alpha = 0xff // 2,
	color = 0x000000,
	notStroke = true,
	isCornerRadius = true
}

floatingWindowManager.backgroundInfo = backgroundInfo
-- print(backgroundInfo)

function backgroundInfo:getAlpha()
	return self.alpha & 0xff
end

function backgroundInfo:getColor()
	return self.color & 0x00ffffff
end

local function newIdManager()
	local IdManager = {
		map = {}
	}

	local idmap = {}
	local viewmap = {}
	local NULL = {}

	function IdManager:newId(name)
		if name == nil then
			name = NULL
		end
		local id = luajava.newId(name)
		idmap[name] = id
		return id
	end

	function IdManager:getId(name)
		if name == nil then
			name = NULL
		end
		return idmap[name]
	end

	function IdManager:getIdView(name)
		if name == nil then
			name = NULL
		end
		local view = viewmap[name]
		if view == nil then
			local id = self:getId(name)
			if not id then
				return nil
			end
			view = _ENV[id]
			if view then
				view = view.view
			end
			viewmap[name] = view
		end
		return view
	end

	return IdManager
end

local threadManager = luajava.threadManager
local windowManager = app.context:getSystemService('window') -- android.view.WindowManagerImpl
local Utils
local ok, err = pcall(function()
	local className = 'rlyun.modules.window.Utils'
	Utils = luajava.bindClass(className)
	if not Utils then
		local path = file.getCacheName(className)
		if not file.isFile(path) then
			local data =
							'\x64\x65\x78\x0A\x30\x33\x35\x00\x33\x6E\x11\x0C\x70\xE4\x60\xEE\xDC\x16\x8A\x52\x79\xB9\xFC\x81\x7E\x04\x64\xEC\xEC\xF7\x1A\x7D\x0C\x09\x00\x00\x70\x00\x00\x00\x78\x56\x34\x12\x00\x00\x00\x00\x00\x00\x00\x00\x54\x08\x00\x00\x34\x00\x00\x00\x70\x00\x00\x00\x11\x00\x00\x00\x40\x01\x00\x00\x0A\x00\x00\x00\x84\x01\x00\x00\x0B\x00\x00\x00\xFC\x01\x00\x00\x0E\x00\x00\x00\x54\x02\x00\x00\x02\x00\x00\x00\xC4\x02\x00\x00\x08\x06\x00\x00\x04\x03\x00\x00\x04\x03\x00\x00\x0C\x03\x00\x00\x0F\x03\x00\x00\x13\x03\x00\x00\x16\x03\x00\x00\x1C\x03\x00\x00\x38\x03\x00\x00\x5D\x03\x00\x00\x72\x03\x00\x00\x99\x03\x00\x00\xC4\x03\x00\x00\xE2\x03\x00\x00\x06\x04\x00\x00\x26\x04\x00\x00\x49\x04\x00\x00\x5B\x04\x00\x00\x6F\x04\x00\x00\x98\x04\x00\x00\xB6\x04\x00\x00\xC2\x04\x00\x00\xC5\x04\x00\x00\xC9\x04\x00\x00\xCE\x04\x00\x00\xD4\x04\x00\x00\xD7\x04\x00\x00\xDC\x04\x00\x00\xE1\x04\x00\x00\xEE\x04\x00\x00\xF6\x04\x00\x00\x02\x05\x00\x00\x0D\x05\x00\x00\x16\x05\x00\x00\x1F\x05\x00\x00\x28\x05\x00\x00\x32\x05\x00\x00\x40\x05\x00\x00\x46\x05\x00\x00\x4F\x05\x00\x00\x55\x05\x00\x00\x5C\x05\x00\x00\x62\x05\x00\x00\x69\x05\x00\x00\x72\x05\x00\x00\x86\x05\x00\x00\x8E\x05\x00\x00\x96\x05\x00\x00\x9E\x05\x00\x00\xB0\x05\x00\x00\xB7\x05\x00\x00\xBD\x05\x00\x00\xCC\x05\x00\x00\xCF\x05\x00\x00\x01\x00\x00\x00\x03\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x0A\x00\x00\x00\x0B\x00\x00\x00\x0C\x00\x00\x00\x0D\x00\x00\x00\x0E\x00\x00\x00\x0F\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x13\x00\x00\x00\x17\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\xEC\x05\x00\x00\x03\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x0D\x00\x00\x00\xFC\x05\x00\x00\x13\x00\x00\x00\x0F\x00\x00\x00\x00\x00\x00\x00\x14\x00\x00\x00\x0F\x00\x00\x00\xF4\x05\x00\x00\x15\x00\x00\x00\x0F\x00\x00\x00\xE4\x05\x00\x00\x14\x00\x00\x00\x0F\x00\x00\x00\xD4\x05\x00\x00\x16\x00\x00\x00\x0F\x00\x00\x00\xFC\x05\x00\x00\x18\x00\x00\x00\x10\x00\x00\x00\xDC\x05\x00\x00\x06\x00\x01\x00\x32\x00\x00\x00\x06\x00\x01\x00\x33\x00\x00\x00\x0D\x00\x10\x00\x20\x00\x00\x00\x0D\x00\x10\x00\x21\x00\x00\x00\x0D\x00\x06\x00\x22\x00\x00\x00\x0D\x00\x00\x00\x2B\x00\x00\x00\x0D\x00\x00\x00\x2C\x00\x00\x00\x0D\x00\x04\x00\x30\x00\x00\x00\x0D\x00\x07\x00\x31\x00\x00\x00\x0D\x00\x01\x00\x32\x00\x00\x00\x0D\x00\x01\x00\x33\x00\x00\x00\x02\x00\x02\x00\x1D\x00\x00\x00\x02\x00\x00\x00\x1E\x00\x00\x00\x02\x00\x00\x00\x1F\x00\x00\x00\x04\x00\x05\x00\x2A\x00\x00\x00\x07\x00\x06\x00\x2E\x00\x00\x00\x0B\x00\x01\x00\x19\x00\x00\x00\x0C\x00\x04\x00\x00\x00\x00\x00\x0D\x00\x08\x00\x00\x00\x00\x00\x0D\x00\x04\x00\x1C\x00\x00\x00\x0D\x00\x09\x00\x24\x00\x00\x00\x0D\x00\x04\x00\x2D\x00\x00\x00\x0D\x00\x07\x00\x2D\x00\x00\x00\x0E\x00\x04\x00\x00\x00\x00\x00\x0E\x00\x03\x00\x29\x00\x00\x00\x0D\x00\x00\x00\x00\x00\x00\x00\x0C\x00\x00\x00\xF4\x05\x00\x00\xFF\xFF\xFF\xFF\x38\x06\x00\x00\x18\x08\x00\x00\x00\x00\x00\x00\x0E\x00\x00\x00\x01\x00\x00\x00\x0C\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xFF\x48\x06\x00\x00\x44\x08\x00\x00\x00\x00\x00\x00\x06\x3C\x69\x6E\x69\x74\x3E\x00\x01\x46\x00\x02\x46\x46\x00\x01\x49\x00\x04\x4C\x4C\x4C\x4C\x00\x1A\x4C\x61\x6E\x64\x72\x6F\x69\x64\x2F\x76\x69\x65\x77\x2F\x4D\x6F\x74\x69\x6F\x6E\x45\x76\x65\x6E\x74\x3B\x00\x23\x4C\x61\x6E\x64\x72\x6F\x69\x64\x2F\x76\x69\x65\x77\x2F\x56\x69\x65\x77\x24\x4F\x6E\x54\x6F\x75\x63\x68\x4C\x69\x73\x74\x65\x6E\x65\x72\x3B\x00\x13\x4C\x61\x6E\x64\x72\x6F\x69\x64\x2F\x76\x69\x65\x77\x2F\x56\x69\x65\x77\x3B\x00\x25\x4C\x61\x6E\x64\x72\x6F\x69\x64\x2F\x76\x69\x65\x77\x2F\x56\x69\x65\x77\x47\x72\x6F\x75\x70\x24\x4C\x61\x79\x6F\x75\x74\x50\x61\x72\x61\x6D\x73\x3B\x00\x29\x4C\x61\x6E\x64\x72\x6F\x69\x64\x2F\x76\x69\x65\x77\x2F\x57\x69\x6E\x64\x6F\x77\x4D\x61\x6E\x61\x67\x65\x72\x24\x4C\x61\x79\x6F\x75\x74\x50\x61\x72\x61\x6D\x73\x3B\x00\x1C\x4C\x61\x6E\x64\x72\x6F\x69\x64\x2F\x76\x69\x65\x77\x2F\x57\x69\x6E\x64\x6F\x77\x4D\x61\x6E\x61\x67\x65\x72\x3B\x00\x22\x4C\x64\x61\x6C\x76\x69\x6B\x2F\x61\x6E\x6E\x6F\x74\x61\x74\x69\x6F\x6E\x2F\x45\x6E\x63\x6C\x6F\x73\x69\x6E\x67\x43\x6C\x61\x73\x73\x3B\x00\x1E\x4C\x64\x61\x6C\x76\x69\x6B\x2F\x61\x6E\x6E\x6F\x74\x61\x74\x69\x6F\x6E\x2F\x49\x6E\x6E\x65\x72\x43\x6C\x61\x73\x73\x3B\x00\x21\x4C\x64\x61\x6C\x76\x69\x6B\x2F\x61\x6E\x6E\x6F\x74\x61\x74\x69\x6F\x6E\x2F\x4D\x65\x6D\x62\x65\x72\x43\x6C\x61\x73\x73\x65\x73\x3B\x00\x10\x4C\x6A\x61\x76\x61\x2F\x6C\x61\x6E\x67\x2F\x4D\x61\x74\x68\x3B\x00\x12\x4C\x6A\x61\x76\x61\x2F\x6C\x61\x6E\x67\x2F\x4F\x62\x6A\x65\x63\x74\x3B\x00\x27\x4C\x72\x6C\x79\x75\x6E\x2F\x6D\x6F\x64\x75\x6C\x65\x73\x2F\x77\x69\x6E\x64\x6F\x77\x2F\x55\x74\x69\x6C\x73\x24\x4D\x6F\x76\x65\x48\x6F\x6C\x64\x65\x72\x3B\x00\x1C\x4C\x72\x6C\x79\x75\x6E\x2F\x6D\x6F\x64\x75\x6C\x65\x73\x2F\x77\x69\x6E\x64\x6F\x77\x2F\x55\x74\x69\x6C\x73\x3B\x00\x0A\x4D\x6F\x76\x65\x48\x6F\x6C\x64\x65\x72\x00\x01\x56\x00\x02\x56\x4C\x00\x03\x56\x4C\x4C\x00\x04\x56\x4C\x4C\x4C\x00\x01\x5A\x00\x03\x5A\x4C\x4C\x00\x03\x61\x62\x73\x00\x0B\x61\x63\x63\x65\x73\x73\x46\x6C\x61\x67\x73\x00\x06\x61\x63\x74\x69\x6F\x6E\x00\x0A\x63\x61\x6E\x63\x65\x6C\x4D\x6F\x76\x65\x00\x09\x67\x65\x74\x41\x63\x74\x69\x6F\x6E\x00\x07\x67\x65\x74\x52\x61\x77\x58\x00\x07\x67\x65\x74\x52\x61\x77\x59\x00\x07\x69\x73\x4D\x6F\x76\x65\x64\x00\x08\x69\x73\x53\x63\x72\x6F\x6C\x6C\x00\x0C\x6C\x61\x79\x6F\x75\x74\x50\x61\x72\x61\x6D\x73\x00\x04\x6E\x61\x6D\x65\x00\x07\x6F\x6E\x54\x6F\x75\x63\x68\x00\x04\x72\x61\x77\x58\x00\x05\x72\x61\x77\x58\x32\x00\x04\x72\x61\x77\x59\x00\x05\x72\x61\x77\x59\x32\x00\x07\x73\x65\x74\x4D\x6F\x76\x65\x00\x12\x73\x65\x74\x4F\x6E\x54\x6F\x75\x63\x68\x4C\x69\x73\x74\x65\x6E\x65\x72\x00\x06\x73\x74\x61\x72\x74\x58\x00\x06\x73\x74\x61\x72\x74\x59\x00\x06\x75\x70\x64\x61\x74\x65\x00\x10\x75\x70\x64\x61\x74\x65\x56\x69\x65\x77\x4C\x61\x79\x6F\x75\x74\x00\x05\x76\x61\x6C\x75\x65\x00\x04\x76\x69\x65\x77\x00\x0D\x77\x69\x6E\x64\x6F\x77\x4D\x61\x6E\x61\x67\x65\x72\x00\x01\x78\x00\x01\x79\x00\x00\x00\x01\x00\x00\x00\x06\x00\x00\x00\x02\x00\x00\x00\x04\x00\x02\x00\x02\x00\x00\x00\x04\x00\x05\x00\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x03\x00\x00\x00\x03\x00\x00\x00\x07\x00\x06\x00\x04\x00\x02\x09\x02\x1A\x04\x0A\x23\x17\x12\x02\x0A\x01\x2F\x1C\x01\x18\x0D\x02\x08\x01\x2F\x18\x0E\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x0F\x06\x00\x00\x02\x00\x00\x00\x17\x06\x00\x00\x06\x06\x00\x00\x2C\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x24\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x04\x00\x02\x00\x00\x00\x00\x00\x00\x00\x0D\x00\x00\x00\x70\x10\x06\x00\x00\x00\x5B\x01\x08\x00\x5B\x02\x04\x00\x5B\x03\x07\x00\x6E\x20\x03\x00\x03\x00\x0E\x00\x00\x00\x03\x00\x01\x00\x02\x00\x00\x00\x00\x00\x00\x00\x07\x00\x00\x00\x54\x20\x07\x00\x12\x01\x6E\x20\x03\x00\x10\x00\x0E\x00\x00\x00\x0A\x00\x03\x00\x01\x00\x00\x00\x00\x00\x00\x00\x7A\x00\x00\x00\x6E\x10\x00\x00\x09\x00\x0A\x00\x54\x71\x04\x00\x12\x12\x2B\x00\x69\x00\x00\x00\x28\x62\x6E\x10\x01\x00\x09\x00\x0A\x03\x6E\x10\x02\x00\x09\x00\x0A\x04\x52\x75\x09\x00\x82\x55\x52\x76\x05\x00\xA7\x06\x03\x06\xC6\x65\x87\x55\x59\x15\x00\x00\x52\x75\x0A\x00\x82\x55\x52\x76\x06\x00\xA7\x06\x04\x06\xC6\x65\x87\x55\x59\x15\x01\x00\x6E\x10\x0A\x00\x07\x00\x5C\x72\x03\x00\x28\x3E\x6E\x10\x01\x00\x09\x00\x0A\x03\x6E\x10\x02\x00\x09\x00\x0A\x04\x52\x75\x05\x00\xC7\x35\x71\x10\x05\x00\x05\x00\x0A\x05\x15\x06\x80\x3F\x2D\x05\x05\x06\x3B\x05\x0D\x00\x52\x75\x06\x00\xC7\x45\x71\x10\x05\x00\x05\x00\x0A\x05\x2D\x05\x05\x06\x3A\x05\x1F\x00\x5C\x72\x02\x00\x28\x1B\x12\x02\x5C\x72\x02\x00\x5C\x72\x03\x00\x6E\x10\x01\x00\x09\x00\x0A\x02\x59\x72\x05\x00\x6E\x10\x02\x00\x09\x00\x0A\x02\x59\x72\x06\x00\x52\x12\x00\x00\x59\x72\x09\x00\x52\x12\x01\x00\x59\x72\x0A\x00\x00\x00\x55\x72\x02\x00\x0F\x02\x00\x00\x00\x01\x03\x00\x00\x00\x00\x00\x4B\x00\x00\x00\x28\x00\x00\x00\x04\x00\x00\x00\x02\x00\x01\x00\x02\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x54\x10\x04\x00\x6E\x20\x0B\x00\x01\x00\x0E\x00\x04\x00\x02\x00\x03\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x54\x20\x08\x00\x54\x21\x07\x00\x72\x30\x04\x00\x10\x03\x0E\x00\x01\x00\x01\x00\x01\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x70\x10\x06\x00\x00\x00\x0E\x00\x04\x00\x03\x00\x04\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x22\x00\x0D\x00\x70\x40\x07\x00\x10\x32\x11\x00\x00\x09\x01\x04\x02\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x07\x81\x80\x04\xD8\x0C\x08\x01\x84\x0D\x01\x01\xA4\x0D\x01\x01\xA8\x0F\x01\x01\xC4\x0F\x00\x00\x02\x00\x0C\x81\x80\x04\xE4\x0F\x01\x09\xFC\x0F\x00\x00\x0F\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x34\x00\x00\x00\x70\x00\x00\x00\x02\x00\x00\x00\x11\x00\x00\x00\x40\x01\x00\x00\x03\x00\x00\x00\x0A\x00\x00\x00\x84\x01\x00\x00\x04\x00\x00\x00\x0B\x00\x00\x00\xFC\x01\x00\x00\x05\x00\x00\x00\x0E\x00\x00\x00\x54\x02\x00\x00\x06\x00\x00\x00\x02\x00\x00\x00\xC4\x02\x00\x00\x02\x20\x00\x00\x34\x00\x00\x00\x04\x03\x00\x00\x01\x10\x00\x00\x06\x00\x00\x00\xD4\x05\x00\x00\x04\x20\x00\x00\x03\x00\x00\x00\x06\x06\x00\x00\x03\x10\x00\x00\x03\x00\x00\x00\x20\x06\x00\x00\x06\x20\x00\x00\x02\x00\x00\x00\x38\x06\x00\x00\x01\x20\x00\x00\x07\x00\x00\x00\x58\x06\x00\x00\x00\x20\x00\x00\x02\x00\x00\x00\x18\x08\x00\x00\x00\x10\x00\x00\x01\x00\x00\x00\x54\x08\x00\x00'
			file.write(path, data)
		end
		Utils = dex.loadfile(path, className)
	end
end)



local runOnMainThread = threadManager.runOnMainThread
local function getMainThreadCallback(invoke)
	return function()
		return runOnMainThread(invoke)
	end
end

local runOnUiThread = threadManager.runOnUiThread
local function getUiThreadCallback(invoke)
	return function()
		return runOnUiThread(invoke)
	end
end

local floatingWindow = {
	name = nil,
	cacheMap = nil,
	IdManager = nil,
	mRootView = nil,
	mParams = nil,
	callbackInfo = nil,
	alreadyInit = nil
}

function floatingWindow:onCreate()
	return self:callEvent('onCreate')
end

function floatingWindow:onStart()
	return self:callEvent('onStart')
end

function floatingWindow:onPause()
	return self:callEvent('onPause')
end

function floatingWindow:onResume()
	return self:callEvent('onResume')
end

function floatingWindow:onRestart()
	return self:callEvent('onRestart')
end

function floatingWindow:onDestroy()
	return self:callEvent('onDestroy')
end

function floatingWindow:callEvent(key)
	if key == nil then
		return
	end

	local callbackInfo = self.callbackInfo
	if not callbackInfo then
		return
	end

	local callback = callbackInfo[key]
	if not isFunction(callback) then
		return
	end
	return callback(self)
end

function floatingWindow:getWindowManager()
	return windowManager
end

function floatingWindow:new(name, callbackInfo)
	local mtable = {
		name = name,
		alreadyInit = false,
		callbackInfo = callbackInfo
	}
	local super = self
	setmetatable(mtable, {
		__index = function(self, key)
			local data = super[key]
			if data ~= nil then
				self[key] = data
				return data
			end
		end
	})
	return mtable
end

function floatingWindow:show()
	windowManager:addView(self.mRootView, self.mParams)
	self:refreshWindow()
end

function floatingWindow:updateWindow(mParams)
	return windowManager:updateViewLayout(self.mRootView, mParams or self.mParams)
end

function floatingWindow:removeWindow()
	return windowManager:removeView(self.mRootView)
end

function floatingWindow:newWindowParams()
	
	local params = WindowManager.LayoutParams()
	params.type = (Build.VERSION.SDK_INT >= 26 and 2038 or 2002)
	params.format = PixelFormat.RGBA_8888
	params.flags = params.FLAG_NOT_FOCUSABLE
	params.width = params.WRAP_CONTENT
	params.height = params.WRAP_CONTENT
	-- params.width = params.MATCH_PARENT
	-- params.height = params.MATCH_PARENT
	params.gravity = Gravity.CENTER
	return params
end

function floatingWindow:setCache(key, data)
	self.cacheMap[key] = data
end

function floatingWindow:getCache(key)
	return self.cacheMap[key]
end

function floatingWindow:newId(name)
	if self:getId(name) then
		self:error(string.format('This ID has been used, please change to another ID: %s', name))
	end
	return self.IdManager:newId(name)
end

function floatingWindow:getId(name)
	return self.IdManager:getId(name)
end

function floatingWindow:findViewByName(name)
	return self.IdManager:getIdView(name)
end

function floatingWindow:findAndCheckViewByName(name)
	local ret = self:findViewByName(name)
	if not ret then
		self:error(('View %s not found'):format(name))
	end
	return ret
end

function floatingWindow:error(err)
	floatingWindowManager:error(string.format('Window: %s\nError: %s', self.name, err))
end

function floatingWindow:loadlayoutByView(view, layout)
	return luajava.loadlayout(layout, nil, view)
end

function floatingWindow:loadlayoutByName(name, layout)
	return self:loadlayoutByView(self:findAndCheckViewByName(name), layout)
end

function floatingWindow:setTitle(title)
	title = tostring(title)

	local view = self:findViewByName('title')
	if view then
		view:setText(title)
		return
	end

	local layout = {
		TextView,
		id = self:newId('title'),
		layout_width = 'match_parent',
		text = title,
		textSize = '18sp'
	}
	self:loadlayoutByName('Title Bar', layout)
end

function floatingWindow:getBackground()
	return self:findViewByName('Root Page'):getBackground()
end

function floatingWindow:setBackgroundByName(name, drawable)
	local view, err = self:findViewByName(name)
	if not view then
		return false, err
	end
	return view:setBackgroundDrawable(drawable)
end

function floatingWindow:setBackground(drawable)
	return self:setBackgroundByName('Root Page', drawable)
end

function floatingWindow:initBackground()
	local backgroundInfo = floatingWindowManager.backgroundInfo
	local gradientDrawable = GradientDrawable()

	if backgroundInfo.isCornerRadius then
		gradientDrawable:setCornerRadius(20)
	end

	if not backgroundInfo.notStroke then
		gradientDrawable:setStroke(1, 0xffffffff)
	end

	gradientDrawable:setColor(floatingWindowManager:getBackgroundColor())
	gradientDrawable:setAlpha(backgroundInfo:getAlpha())

	return self:setBackground(gradientDrawable)
end


function floatingWindow:refreshWindow()
	self:initBackground()
end

function floatingWindow:addViewByName(name, subview)
	self:findViewByName(name):addView(subview)
end

local function getIcon(name)
	local dir = string.format('%s/icon', file.rlggStorage())
	local path = string.format('%s/%s.png', dir, name)
	if not file.isFile(path) then
		if file.isFile(dir) then
			file.rm(dir)
		end
		local url = 'http://pan.rlyun.top/api/v3/file/get/4979/icon.zip?sign=JJbAyZM-GLFnNAPVIjM8IKgj1YSGwOxXVkurA9QXtRI%3D%3A0'
		local tmppath = string.format('%s/icon.zip', file.rlggStorage())
		local ok, err = pcall(function()
			if file.download(url, tmppath) then
				file.unzip(tmppath, dir)
			end
		end)
		if not ok then
			gg.toast(tostring(err))
			file.delete(tmppath:getdir())
		end
		if not file.isFile(path) then
			gg.alert('Icon resource loading failed!')
			app.exit()
		end
	end
	return path
end

function floatingWindow:getIcon(name)
	local key = string.format('icon-%s', name)
	local data = self:getCache(key)
	if not data then
		data = getIcon(name)
		self:setCache(key, data)
	end
	return data
end

function floatingWindow:getCacheBitmap(path)
	local name = string.format('Bitmap-%s', path)
	local view = self:getCache(name)
	if not view then
		view = luajava.getBitmap(path)
		if not view then
			self:error('Unable to obtain Bitmap')
		end
		self:setCache(name, view)
	end
	return view
end

function floatingWindow:getIconBitmap(name)
	return self:getCacheBitmap(self:getIcon(name))
end

local function set_state_pressed(drawable)
	return drawable:addState({android.R.attr.state_pressed}, ColorDrawable(0x30000000))
end

local function getBitmapDrawableSelector(states)
	local drawable = StateListDrawable()
	for k, v in pairs(states) do
		drawable:addState({k}, luajava.getBitmapDrawable(v))
	end
	set_state_pressed(drawable)
	return drawable
end

function floatingWindow:goneViewByName(name)
	local view, err = self:findViewByName(name)
	if not view then
		return false, err
	end
	return view:setVisibility(view.GONE)
end

function floatingWindow:visibleViewByName(name)
	local view, err = self:findViewByName(name)
	if not view then
		return false, err
	end
	return view:setVisibility(view.VISIBLE)
end

function floatingWindow:newWindow()

	local function newWindowScalingBackground()
		return getBitmapDrawableSelector({
			[-android.R.attr.state_selected] = self:getIcon('Minimize the window'),
			[android.R.attr.state_selected] = self:getIcon('Maximize the window')
		})
	end

	local maximize = self:getIconLayout('Maximize Window 2', {
		id = self:newId('Window resizing'),
		onClick = function(view)
			local Selected = not view:getTag()
			view:setSelected(Selected)
			view:setTag(Selected)

			if Selected then
				view:setImageBitmap(self:getIconBitmap('Window Restore'))
				self:match_parent() -- Maximize Window 2
				self:goneViewByName('Window Shrink')
			else
				view:setImageBitmap(self:getIconBitmap('Maximize Window 2'))
				self:wrap_content()
				self:visibleViewByName('Window Shrink')
			end
		end
	})

	local minimize = self:getIconLayout('Minimize the window', {
		id = self:newId('Window Shrink'),
		onClick = function(view)
			local Selected = not view:getTag()
			view:setSelected(Selected)
			view:setTag(Selected)

			local mainView = self:findAndCheckViewByName('Main Page')
			local windowControlView = self:findAndCheckViewByName('Window resizing')
			local backView = self:findViewByName('back')

			local icon
			local visible

			if Selected then -- gone
				icon = self:getIconBitmap('Maximize the window')
				visible = view.GONE

			else -- visible
				icon = self:getIconBitmap('Minimize the window')
				visible = view.VISIBLE
			end

			-- Change Icon
			view:setImageBitmap(icon)

			-- Change the visible state of a layout
			if mainView then
				mainView:setVisibility(visible)
			end
			if windowControlView then
				windowControlView:setVisibility(visible)
			end
			if backView then
				backView:setVisibility(visible)
			end

		end,
		onLongClick = function()
			floatingWindowManager:exit()
		end
	})

	-- Controlling window resizing layout
	local controlViewLayout = {LinearLayout, maximize, minimize}

	-- Status bar layout
	local StatusBar = {
		LinearLayout,
		id = self:newId('Status Bar'),
		layout_width = 'match_parent',
		layout_height = 'wrap_content',
		gravity = "right|center_vertical",
		-- backgroundColor = 0xffff0000,
		{
			LinearLayout,
			id = self:newId('Function bar left'),
		},
		{
			LinearLayout,
			paddingLeft = '5dp',
			paddingRight = '5dp',
			id = self:newId('Title Bar')
		},
		{
			LinearLayout,
			id = self:newId('Function bar right'),
		},
		controlViewLayout
	}

	local rootLayout = {
		FrameLayout,
		id = self:newId('Root Page'),
		{
			FrameLayout,
			layout_width = "match_parent",
			layout_height = "match_parent",
			{
				LinearLayout,
				layout_width = "match_parent",
				layout_height = "match_parent",
				orientation = 'vertical',
				padding = '4dp',
				StatusBar,
				{
					LinearLayout,
					id = self:newId('Main Page'),
					layout_width = 'match_parent',
					layout_height = 'wrap_content'
				}
			},
			{
				FrameLayout,
				id = self:newId('Root Page 2'),
				layout_width = 'match_parent',
				layout_height = 'match_parent'
			}
		}
	}

	local rootView = luajava.loadlayout(rootLayout)

	self:setTitle(self.name)

	return rootView
end

function floatingWindow:wrap_content()
	local params = self.mParams
	params.width = params.WRAP_CONTENT
	params.height = params.WRAP_CONTENT
	self:updateWindow(params)
end

function floatingWindow:match_parent()
	local params = self.mParams
	params.width = params.MATCH_PARENT
	params.height = params.MATCH_PARENT
	self:updateWindow(params)
end

function floatingWindow:addView(subview)
	return self:addViewByName('Main Page', subview)
end

function floatingWindow:addlayout(layout)
	return self:loadlayoutByName('Main Page', layout)
end

function floatingWindow:getIconLayout(name, from)
	local drawable = StateListDrawable()
	set_state_pressed(drawable)

	local baseLayout = {
		ImageView,
		id = self:getId(name) or self:newId(name),
		layout_margin = '2dp',
		layout_width = '28dp',
		layout_height = '28dp',
		src = self:getIcon(name),
		background = drawable
	}

	return table.copy(baseLayout, from)
end

function floatingWindow:getIconView(name)
	local view = self:findViewByName(name)
	if not view then
		return view
	end

	return luajava.loadlayout(self:getIconLayout(name))
end

function floatingWindow:backTitle()
	local view = self:findViewByName('back')
	if view then
		return
	end

	local attr = {
		onClick = function()
			floatingWindowManager:removeWindow()
		end
	}
	local layout = self:getIconLayout('back', attr)
	self:loadlayoutByName('Function bar left', layout)
end

function floatingWindow:exitTitle()
	local view = self:findViewByName('closure')
	if view then
		return
	end

	local function onClick()
		if self:getId('Exit Menu') then
			self:visibleViewByName('Exit Menu')
			return
		end

		local closeMenu = self:findViewByName('Exit Menu')
		if closeMenu then
			self:addViewByName('Root Page 2', closeMenu)
			return
		end

		local function newLayout(iconName, title, onClick)
			local baseLayout = {
				LinearLayout,
				layout_width = 'match_parent',
				paddingRight = '10dp',
				gravity = "center_vertical",
				onClick = onClick,
				self:getIconLayout(iconName, {
					id = 0
				}),
				{
					Button,
					backgroundColor = 0x00000000,
					text = title,
					clickable = false
				}
			}
			return baseLayout
		end

		local layou1 = newLayout('closure', 'Exit floating window', function()
			floatingWindowManager:exit()
		end)

		local layou2 = newLayout('quit', 'Exit Program', function()
			floatingWindowManager:setExitEvent(app.exit)
			floatingWindowManager:exit()
		end)

		local main = {
			FrameLayout,
			id = self:newId('Exit Menu'),
			layout_margin = '15dp',
			layout_width = 'match_parent',
			layout_height = 'match_parent',
			onTouch = function(view, motionEvent)
				self:goneViewByName('Exit Menu')
				return true
			end,
			{
				LinearLayout,
				orientation = 'vertical',
				backgroundColor = 0xa0000000,
				layou1,
				layou2
			}
		}

		self:loadlayoutByName('Root Page 2', main)
	end

	-- Close button layout
	local closeLayout = self:getIconLayout('closure', {
		onClick = onClick
	})

	-- 关闭按钮的容器布局
	local layout = {RelativeLayout, closeLayout}

	-- Load the "Close Button" to the "Left Function Bar"
	self:loadlayoutByName('Function bar left', layout)

end

local windowMap = {}
local windowStack = table.new()
local cacheMap = {}
local const = {
	setting = setmetatable({}, {
		__tostring = function()
			return 'set up'
		end
	}),
	null = setmetatable({}, {
		__tostring = function()
			return 'null'
		end
	})
}

windowStack.push = function(self, data)
	self:insert(data)
	return #self
end

windowStack.popup = function(self)
	if #self == 0 then
		return nil
	end
	return self:remove()
end

local currentWindow = floatingWindow
if true then
	currentWindow = nil
end
local exitEvents = {}

function floatingWindowManager:getCache(key)
	return cacheMap[key]
end

function floatingWindowManager:setCache(key, data)
	cacheMap[key] = data
end

function floatingWindowManager:popupWindow()
	if not currentWindow then
		return false
	end

	currentWindow:onDestroy()
	currentWindow:removeWindow()
	currentWindow = nil

	return windowStack:popup()
end

function floatingWindowManager:setWindow(floatingWindow)
	if not floatingWindow then
		return
	end

	currentWindow = floatingWindow
	return floatingWindow:show()
end

function floatingWindowManager:addWindow(floatingWindow)
	if currentWindow then

		windowStack:push(currentWindow)
		currentWindow:onPause()

		currentWindow:removeWindow()
	end

	self:setWindow(floatingWindow)
end

function floatingWindowManager:removeWindow()
	local floatingWindow = self:popupWindow()
	if not floatingWindow then
		return false
	end

	self:setWindow(floatingWindow)
	floatingWindow:onResume()
	return floatingWindow
end

function floatingWindowManager:updateWindow()
	if not currentWindow then
		return false
	end

	return currentWindow:updateWindow()
end

function floatingWindowManager:exit()
	repeat
	until not self:popupWindow()

	local function empty(mtable)
		for k, v in pairs(mtable) do
			mtable[k] = nil
		end
	end

	floatingWindowManager:setExitEvent(function()
		local backgroundInfo = table.copy(floatingWindowManager.backgroundInfo)
		for k, v in pairs(backgroundInfo) do
			if isFunction(v) then
				backgroundInfo[k] = nil
			end
		end
		storage.backgroundInfo = backgroundInfo
		storage.save()
	end)

	self:setCache('mainName', nil)
	empty(windowMap)
	empty(windowStack)

	return self:unpark()
end

function floatingWindowManager:newWindow(name, callbackInfo)
	if name == nil then
		error(('Window: %s\nWindow name missing'):format(name), 2)
	end

	if not isTable(callbackInfo) then
		error(('Window: %s\nMissing callback event'):format(name), 2)
	end

	if self:getCache('mainName') == nil then
		self:setCache('mainName', name)
	end
	windowMap[name] = floatingWindow:new(name, callbackInfo)
end

function floatingWindowManager:error(err)
	gg.alert(err)
	self:exit()
	floatingWindowManager:setExitEvent(app.exit)
end

function floatingWindow:initok()
	if not Utils then
		gg.alert('The floating window cannot complete the mobile event initialization')
		return
	end
	Utils:setMove(windowManager, self.mParams, self.mRootView)
end

function floatingWindow:init()
	if not self.alreadyInit then
		self.cacheMap = {}
		self.IdManager = newIdManager()
		self.mRootView = self:newWindow()
		self.mParams = self:newWindowParams()
		self.alreadyInit = true
		self.FWM = floatingWindowManager
		self:initok()
	end
end

function floatingWindow:start()
	local key = self.onCreate
	if not self:getCache(key) then
		self:setCache(key, true)
		self:onCreate()
	end

	---[[Window appears animation
	local rootView = self:findAndCheckViewByName('Root Page')
	floatingWindowManager:runYoYo(function(YoYoImpl)
		YoYoImpl:with('ZoomInLeft'):duration(600):playOn(rootView)
	end)
	--]]

	local key = self.onStart
	if not self:getCache(key) then
		self:setCache(key, true)
		self:onStart()
	else
		self:onRestart()
	end
end

local function mainStatusBar(self, floatingWindow)
	-- Show End Icon Button
	floatingWindow:exitTitle()

	-- Get the layout of the "Set Icon Button"
	local layout = floatingWindow:getIconLayout('set up', {
		onClick = function()
			-- Launch Settings Window
			self:start(const.setting)
		end
	})

	-- Add "Settings Icon Button" to "Right Function Bar"
	floatingWindow:loadlayoutByName('Function bar right', layout)

	if self:getCache(const.setting) then
		return
	end
	self:setCache(const.setting, true)

	local function loadSettingWindow(floatingWindow)
		floatingWindow:setTitle('set up')

		local function newLinearLayout(attr)
			local baseLayout = {
				LinearLayout,
				orientation = 'vertical',
				layout_width = 'match_parent',
				layout_marginTop = '10dp',
				padding = '4dp',
				background = floatingWindowManager:getStateListDrawable()
			}

			return table.copy(baseLayout, attr)
		end

		local function newTitleLayout(text)
			local baseLayout = {
				TextView,
				gravity = "center",
				layout_width = 'match_parent',
				text = text
			}

			return baseLayout
		end

		local titleLayout = newTitleLayout('Floating window transparency')
		local contentLayout = {
			SeekBar,
			id = floatingWindow:newId('SeekBar-Floating Window Transparency'),
			min = 0,
			max = 0xff,
			layout_width = 'match_parent',
			onSeekBarChange = {
				onProgressChanged = function(SeekBar, var2, var3)
					-- print('onProgressChanged',var2, var3)
					if not var3 then
						return
					end

					floatingWindowManager.backgroundInfo.alpha = var2
					local bg = floatingWindow:getBackground()
					if not bg then
						return
					end
					bg:setAlpha(var2)
				end
			}
		}
		local layout1 = newLinearLayout({LinearLayout, titleLayout, contentLayout})

		local titleLayout = newTitleLayout('Customize theme colors')
		local layout2 = newLinearLayout({LinearLayout, titleLayout})
		layout2.onClick = function()
			local color = tonumber(floatingWindowManager.backgroundInfo.color) or 0
			local R, G, B = string.format('%06x', color):match('(%x%x)(%x%x)(%x%x)')
			R = tonumber(R, 16)
			G = tonumber(G, 16)
			B = tonumber(B, 16)

			local input = gg.prompt({'R [0; 255]', 'G [0; 255]', 'B [0; 255]'}, {R, G, B}, {'number', 'number', 'number'})
			if not input then
				return
			end

			local R, G, B = table.unpack(input)
			local color = tonumber(string.format('%02x%02x%02x', R, G, B), 16)
			floatingWindowManager.backgroundInfo.color = color
			floatingWindow:refreshWindow()
		end

		local checkBoxLayout1 = {
			CheckBox,
			layout_width = 'match_parent',
			text = 'Theme rounded corners',
			checked = floatingWindowManager.backgroundInfo.isCornerRadius,
			onCheckedChange = function(CompoundButton, b)
				floatingWindowManager.backgroundInfo.isCornerRadius = b
				floatingWindow:refreshWindow()
			end
		}

		local checkBoxLayout2 = {
			CheckBox,
			layout_width = 'match_parent',
			text = 'Borderless',
			checked = backgroundInfo.notStroke,
			onCheckedChange = function(CompoundButton, b)
				backgroundInfo.notStroke = b
				floatingWindow:refreshWindow()
			end
		}

		local layout3 = newLinearLayout({LinearLayout, checkBoxLayout1, checkBoxLayout2})

		local rootlayout = {
			LinearLayout,
			layout_width = 'match_parent',
			layout_height = 'match_parent',
			orientation = 'vertical',
			padding = '4dp',
			layout1,
			layout2,
			layout3
		}

		floatingWindow:addlayout(rootlayout)

		local seekBar=floatingWindow:findViewByName('SeekBar-Floating Window Transparency')
		if seekBar then
			seekBar:setProgress(floatingWindowManager.backgroundInfo:getAlpha())
		end
	end

	-- Creating a Settings Window
	self:newWindow(const.setting, {
		onCreate = loadSettingWindow
	})
end

function floatingWindowManager:start(name)
	local floatingWindow = windowMap[name]
	if not floatingWindow then
		local err = string.format('No %q window', tostring(name))
		gg.alert2('Floating window abnormality', err)
		return
	end

	floatingWindow:init()
	self:addWindow(floatingWindow)

	if #windowStack >= 1 then
		floatingWindow:backTitle()
	else
		mainStatusBar(self, floatingWindow)
	end

	return floatingWindow:start()
end

function floatingWindowManager:getStateListDrawable()
	return newStateListDrawable()
end

function floatingWindowManager:setExitEvent(callback)
	exitEvents[#exitEvents + 1] = callback
end

function floatingWindowManager:unpark()
	local unpark = self:getCache('unpark')
	if isFunction(unpark) then
		return unpark()
	end
end

function floatingWindowManager:run(name)
	local mainName = self:getCache('mainName')
	if not mainName then
		-- gg.alert('Use newWindow to create a window first, please see the group file demonstration')
		error('First create a window using newWindow', 2)
	end

	if self:getCache('isrun') then
		return
	else
		self:setCache('isrun', true)
	end

	local exitok

	setExitEvent(function()
		-- self:exit()
		if not exitok then
			app.exit()
		end
	end)

	gg.setVisible(false)
	runOnMainThread(function()
		self:start(mainName)
	end)
	luajava.setFloatingWindowHide(true)

	do
		local park, unpark = luajava.getLockSupport()
		self:setCache('unpark', unpark)
		park()
	end

	luajava.setFloatingWindowHide(false)
	gg.setVisible(true)

	if #exitEvents > 0 then
		for i, callback in ipairs(exitEvents) do
			if isFunction(callback) then
				exitEvents[i] = nil
				callback()
			end
		end
	end

	self:setCache('isrun', false)
	exitok = true
end

return floatingWindowManager
