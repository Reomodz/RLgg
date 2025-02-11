--[[
floatingWindowManager
Related function usage documentation
https://gitee.com/rlyun/rlgg/tree/master/%E6%82%AC%E6%B5%AE%E7%AA%97UI%E6%A1%86%E6%9E%B6


If there is a stuck UI, please use multi-threaded execution function

]] --
local floatingWindowManager = require('floatingWindowManager')
floatingWindowManager:init()

-- Interrupt thread
local function interruptThread(thread)
	if thread then
		pcall(function()
			thread:interrupt()
		end)
	end
end

-- Get asynchronous thread callback
local function getASyncThreadCallbak(func)
	return function()
		luajava.startThread(function()
			return pcall(func)
		end)
	end
end

-- Get synchronous thread callback. This is the only way to use this callback for gg library, otherwise it may be unstable.
local task
local function getSyncThreadCallbak(func)
	return function()
		if task then
			gg.toast('Other tasks are running, wait a minute!')
			return
		end
		luajava.startThread(function()
			task = true
			pcall(func)
			task = nil
		end)
	end
end

-- Get synchronous thread callback and execute
local function callSyncThreadCallbak(func)
	return getSyncThreadCallbak(func)()
end

-- Find function by function name and get synchronous thread callback
local function findFunctionByName(name)
	local func = _ENV[name]
	if not isFunction(func) then
		gg.alert(string.format('%q function does not exist', name))
		return nil
	end
	return getSyncThreadCallbak(func)
end

-- Button Factory - produces "Button Layout"
local function newButtonLayout(name)
	if not isString(name) then
		return
	end

	local layout = {
		Button,
		background = floatingWindowManager:getStateListDrawable(),
		layout_width = 'match_parent',
		layout_margin = '5dp',
		text = name,
		textSize = '16sp',
		onClick = findFunctionByName(name)
	}

	Return layout
end

-- Switch Factory - Production of "Switch Layout"
local function newSwitchLayout(openName, closeName)
	if not isString(openName) then
		return
	end

	local layout = {
		Switch,
		layout_width = 'match_parent',
		text = openName,
		onCheckedChange = function(CompoundButton, state)
			local func
			if state then
				-- Set the switch text to "off"
				if isString(closeName) then
					CompoundButton:setText(closeName)
				end

				-- Find the "open" function
				func = findFunctionByName(openName)
			else
				-- Set the switch text to "On"
				CompoundButton:setText(openName)

				if isString(closeName) then
					-- Find the "close" function
					func = findFunctionByName(closeName)
				end
			end

			if isFunction(func) then
				-- The function obtained by findFunctionByName is already wrapped by multithreading, so you can execute it directly
				func()
			end
		end
	}

	Return layout
end

-- Define function

_ENV['function 1'] = function()
	gg.alert('I am function 1')
end

_ENV['function 2'] = function()
	gg.alert('I am function 2')
end

_ENV['function 3'] = function()
	gg.alert('I am function 3')
end

_ENV['function 4'] = function()
	gg.alert('I am function 4')
end

_ENV['function 5'] = function()
	gg.alert('I am function 5')
end

_ENV['Close function 1'] = function()
	gg.alert('Function 1 is closed')
end

_ENV['Close function 2'] = function()
	gg.alert('Function 1 is closed')
end

_ENV['Close function 3'] = function()
	gg.alert('Function 1 is closed')
end

_ENV['Close function 4'] = function()
	gg.alert('Function 1 is closed')
end

_ENV['Close function 5'] = function()
	gg.alert('Function 1 is closed')
end

function A1()
	gg.alert('I am the function of A1')
end

function A2()
	gg.alert('I am the function of A2')
end

function B1()
	while true do
		gg.toast('dead loop')
		gg.sleep(1000)
	end
end

function C1()
	gg.alert('I am the function of C1')
end

function C2()
	gg.alert('I am the function of C2')
end

function C3()
	gg.clearResults()
	gg.searchNumber(100)
	gg.alert(string.format('Searched %s results', gg.getResultsCount()))
end

floatingWindowManager:newWindow(('FWM v%s'):format(floatingWindowManager.version), {
	onCreate = function(floatingWindow)
		floatingWindow:addlayout({
			ScrollView,
			layout_margin = '10dp',
			layout_width = 'match_parent',
			layout_height = 'match_parent',
			{
				LinearLayout,
				background = floatingWindowManager:getStateListDrawable(),
				layout_width = 'match_parent',
				layout_height = 'match_parent',
				orientation = 'vertical',
				padding = '10dp',
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Thread mode search test',
					textSize = '16sp',
					onClick = getSyncThreadCallbak(C3)
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Button function',
					textSize = '16sp',
					onClick = function(View)
						floatingWindowManager:start('button function') -- Open the button function window, provided that newWindow has been created
					end
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Switch function',
					textSize = '16sp',
					onClick = function()
						floatingWindowManager:start('switch function')
					end
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Other functions',
					textSize = '16sp'
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Multi-threaded function',
					textSize = '16sp',
					onClick = function()
						floatingWindowManager:start('multi-threaded function')
					end
				}
			}
		})
	end,
	onDestroy = function()
		-- gg.alert('Welcome to use next time!')
	end
})

floatingWindowManager:newWindow('button function', {
	onCreate = function(floatingWindow)

		floatingWindow:addlayout({
			ScrollView,
			layout_width = 'match_parent',
			layout_height = 'match_parent',
			{
				LinearLayout,
				background = floatingWindowManager:getStateListDrawable(),
				layout_width = 'match_parent',
				layout_height = 'match_parent',
				orientation = 'vertical',
				padding = '10dp',
				newButtonLayout('Function 1'),
				newButtonLayout('Function 2'),
				newButtonLayout('Function 3'),
				newButtonLayout('Function 4'),
				newButtonLayout('Function 5')
			}
		})

	end
})

floatingWindowManager:newWindow('switch function', {
	onCreate = function(floatingWindow)

		floatingWindow:addlayout({
			ScrollView,
			layout_width = 'match_parent',
			layout_height = 'match_parent',
			{
				LinearLayout,
				background = floatingWindowManager:getStateListDrawable(),
				layout_width = 'match_parent',
				layout_height = 'match_parent',
				orientation = 'vertical',
				padding = '10dp',
				newSwitchLayout('Function 1', 'Close function 1'),
				newSwitchLayout('Function 2', 'Close function 2'),
				newSwitchLayout('Function 3'),
				newSwitchLayout('Function 4'),
				newSwitchLayout('Function 5', 'Close function 5')
			}
		})
	end
})

floatingWindowManager:newWindow('multi-threaded function', {
	onCreate = function(floatingWindow)

		floatingWindow:addlayout({
			ScrollView,
			layout_width = 'match_parent',
			layout_height = 'match_parent',
			{
				LinearLayout,
				background = floatingWindowManager:getStateListDrawable(),
				layout_width = 'match_parent',
				layout_height = 'match_parent',
				orientation = 'vertical',
				padding = '10dp',
				{
					Switch,
					layout_width = 'match_parent',
					text = 'Switch 1',
					onCheckedChange = function(CompoundButton, state)
						-- The cacheName in the same window cannot be repeated and must be unique. It can be random.
						local cacheName = 'Multithreaded 1'
						if state then
							gg.alert('thread started')
							local thread1 = luajava.startThread(B1)
							floatingWindow:setCache(cacheName, thread1)
						else
							gg.alert('thread closed')
							local thread1 = floatingWindow:getCache(cacheName)
							interruptThread(thread1)
						end
					end
				}
			}
		})
	end
})

-- Run floating window
floatingWindowManager:run()
