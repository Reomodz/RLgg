--[[

Author: RL
Date: April 15, 2023
Description: RLGG's floating window management tool, through which you can add View to the floating window
]] --

local luajava = luajava
local WindowManagerLayoutParams = luajava.bindClass('android.view.WindowManager$LayoutParams')
local context = app.context:getApplicationContext()

local tagSet = {}
local windowManager = {
	version = '1.0.1',
	layoutParamsType = Build.VERSION.SDK_INT >= 26 and 2038 or 2002,
	context = context,
	instance = context:getSystemService(context.WINDOW_SERVICE),
	-- <View, LayoutParams>
	viewHashSet = {}
}

setmetatable(windowManager, {
	__index = function(self, k)
		local instance = self:getInstance()
		local v = instance[k]
		if v ~= nil then
			if isFunction(v) then
				local u = v
				v = function(this, ...)
					if this == self then
						this = instance
					end
					return u(this, ...)
				end
			end

			self[k] = v
			return v
		end
	end
})

function windowManager:getInstance()
	return self.instance
end

function windowManager:getTag(view, k)
	local t = tagSet[view]
	if not t then
		t = {}
		tagSet[view] = t
	end

	if k then
		return t[k]
	end

	return t
end

function windowManager:setTag(view, k, v)
	local t = self:getTag(view)
	t[k] = v
end

function windowManager:bindView(view)
	local viewManager = {}
	function viewManager:getView()
		return view
	end

	local super = self
	setmetatable(viewManager, {
		__index = function(self, k)
			local v = super[k]
			if not v then
				local view = self:getView()
				v = view[k]
				if not v then
					return
				end

				if isFunction(v) then
					local u = v
					v = function(this, ...)
						if this == self then
							this = view
						end
						return u(this, ...)
					end
				end

				rawset(self, k, v)
				return v
			end

			if isFunction(v) then
				local view = self:getView()
				local u = v
				v = function(this, ...)
					if this == self then
						this = super
					end
					return u(this, view, ...)
				end
			end
			rawset(self, k, v)
			return v
		end
	})

	return viewManager
end

function windowManager:newWindowManagerLayoutParams(attr)
	local layoutParams = WindowManagerLayoutParams()

	local defaultAttr = {
		type = self.layoutParamsType,
		width = WindowManagerLayoutParams.WRAP_CONTENT,
		height = WindowManagerLayoutParams.WRAP_CONTENT,
		flags = WindowManagerLayoutParams.FLAG_NOT_FOCUSABLE,
		format = PixelFormat.RGBA_8888,
		gravity = Gravity.CENTER
	}

	if attr then
		table.copy(defaultAttr, attr)
	end
	attr = defaultAttr

	for k, v in pairs(attr) do
		layoutParams[k] = v
	end

	return layoutParams
end

function windowManager:getLayoutParams(view)
	return self.viewHashSet[view]
end

function windowManager:containsView(view)
	if self.viewHashSet[view] then
		return true
	end
	return false
end

function windowManager:hide(view)
	local layoutParams = self:getLayoutParams(view)
	self:removeView(view)
	local function show()
		self:addView(view, layoutParams)
	end
	self:setTag(view, 'show', show)
	return show
end

function windowManager:show(view)
	local show = self:getTag(view, 'show')
	if show then
		return show()
	end
	return self:addView(view)
end

function windowManager:destroy(view)
	self:removeView(view)
	tagSet[view] = nil
end

function windowManager:destroyAll()
	for view, v in pairs(self.viewHashSet) do
		self:destroy(view)
	end
end

do
	local handler = luajava.getHandler()

	function windowManager:addView(view, layoutParams)
		if not layoutParams or isTable(layoutParams) then
			layoutParams = self:newWindowManagerLayoutParams(layoutParams)
		end

		local mWindow = self:getInstance()
		local function addView()
			return mWindow:addView(view, layoutParams)
		end

		if not luajava.isThread() then
			addView()
		else
			handler:post(luajava.getRunnable(addView))
		end

		self.viewHashSet[view] = layoutParams
	end
end

function windowManager:updateViewLayout(view, layoutParams)
	self:getInstance():updateViewLayout(view, layoutParams)
end

function windowManager:updateView(view)
	self:updateViewLayout(view, self:getLayoutParams(view))
end

function windowManager:removeView(view)
	self:getInstance():removeView(view)
	self.viewHashSet[view] = nil
end

function windowManager:removeAllViews()
	for view, layoutParams in pairs(self.viewHashSet) do
		self:removeView(view)
	end
end

function windowManager:inSetRemoveValue(Set, v, cancel)
	repeat
		local i = table.indexof(Set, v)
		if not i then
			break
		end

		table.remove(Set, i)
	until false

	if #Set == 0 then
		cancel()
	end
end

function windowManager:getTouchListenerSet(view)
	local key = 'touchListenerSet'
	local listenerSet = self:getTag(view, key)
	if not listenerSet then
		listenerSet = {}
		self:setTag(view, key, listenerSet)
	end
	return listenerSet
end

function windowManager:addOnTouchListener(view, func)
	local listenerSet = self:getTouchListenerSet(view)
	if #listenerSet == 0 then
		view:setOnTouchListener(luajava.createProxy('android.view.View$OnTouchListener', {
			onTouch = function(v, e)
				local r
				for i, func in ipairs(listenerSet) do
					local tmp = func(v, e)
					if tmp ~= nil then
						r = tmp
					end
				end
				if r ~= nil then
					return r
				end
			end
		}))
	end
	table.insert(listenerSet, func)
end

function windowManager:cancelOnTouchListener(view)
	return view:setOnTouchListener(nil)
end

function windowManager:removeOnTouchListener(view, func)
	local Set = self:getTouchListenerSet(view)
	local function cancel()
		return self:cancelOnTouchListener(view)
	end
	self:inSetRemoveValue(Set, func, cancel)
end

function windowManager:removeAllOnTouchListener(view)
	local listenerSet = self:getTouchListenerSet(view)
	while #listenerSet >= 1 do
		table.remove(listenerSet, 1)
	end
	self:cancelOnTouchListener(view)
end

function windowManager:newMoveCallback(view, layoutParams)
	local getLayoutParams
	local RawX, RawY, x, y

	if layoutParams then
		getLayoutParams = function()
			return layoutParams
		end
	else
		getLayoutParams = function()
			return self:getLayoutParams(view)
		end
	end

	local function onTouch(view, event)
		local action = event:getAction()
		if action == event.ACTION_DOWN then
			local layoutParams = getLayoutParams()
			RawX = event:getRawX()
			RawY = event:getRawY()
			x = layoutParams.x
			y = layoutParams.y

		elseif action == event.ACTION_MOVE then
			local layoutParams = getLayoutParams()
			layoutParams.x = event:getRawX() - RawX + x
			layoutParams.y = event:getRawY() - RawY + y
			self:updateViewLayout(view, layoutParams)
		end
	end

	return onTouch
end

function windowManager:getMoveCallback(view)
	local key = 'moveCallback'
	local callback = self:getTag(view, key)
	if not callback then
		callback = self:newMoveCallback(view)
		self:setTag(view, key, callback)
	end
	return callback
end

function windowManager:setMoveable(view, is)
	local callback = self:getMoveCallback(view)
	if is then
		self:addOnTouchListener(view, callback)
	else
		self:removeOnTouchListener(view, callback)
	end
end

function windowManager:wait()
	local lock = luajava.getBlock()
	self:setTag(self, 'lock', lock)
	return lock('join')
end

function windowManager:exit()
	self:destroyAll()
	local lock = self:getTag(self, 'lock')
	if lock then
		return lock('end')
	end
end

setExitEvent(function()
	windowManager:exit()
end)

return windowManager
