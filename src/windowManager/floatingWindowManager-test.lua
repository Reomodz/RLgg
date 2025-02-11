--[[
floatingWindowManager
Related function usage documentation
https://gitee.com/rlyun/rlgg/tree/master/%E6%82%AC%E6%B5%AE%E7%AA%97UI%E6%A1%86%E6%9E%B6

If there is a stuck UI, please use multi-threaded execution function

]] --
local floatingWindowManager = require('floatingWindowManager')
floatingWindowManager:init()

-- Interrupting a Thread
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

-- Get synchronous thread callback. Callbacks involving the gg library can only use this method, otherwise it may be unstable.
local task
local function getSyncThreadCallbak(func)
	return function()
		if task then
			gg.toast('Running other tasks, wait a minute!')
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
		gg.alert(string.format('No %q function exists', name))
		return nil
	end
	return getSyncThreadCallbak(func)
end

-- Button Factory - Producing "Button Layout"
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

	return layout
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
					-- Find the "Close" function
					func = findFunctionByName(closeName)
				end
			end

			if isFunction(func) then
				-- The function obtained by findFunctionByName is already wrapped by multithreading, so you can execute it directly.
				func()
			end
		end
	}

	return layout
end

-- Defining a function

_ENV['Feature 1'] = function()
	gg.alert('Feature 1')
end

_ENV['Feature 2'] = function()
	gg.alert('I am function 2')
end

_ENV['Feature 3'] = function()
	gg.alert('I am function 3')
end

_ENV['Feature 4'] = function()
	gg.alert('I am function 4')
end

_ENV['Feature 5'] = function()
	gg.alert('I am function 5')
end

_ENV['Close function 1'] = function()
	gg.alert('Function 1 is disabled')
end

_ENV['Close function 2'] = function()
	gg.alert('Function 1 is disabled')
end

_ENV['Close function 3'] = function()
	gg.alert('Function 1 is disabled')
end

_ENV['Close function 4'] = function()
	gg.alert('Function 1 is disabled')
end

_ENV['Turn off feature 5'] = function()
	gg.alert('Function 1 is disabled')
end

function A1()
	gg.alert('I am A1 function')
end

function A2()
	gg.alert('I am A2 function')
end

function B1()
	while true do
		gg.toast('Infinite loop')
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
	gg.alert(string.format('%s results found', gg.getResultsCount()))
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
					text = 'Threaded Mode Search Test',
					textSize = '16sp',
					onClick = getSyncThreadCallbak(C3)
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Button Function',
					textSize = '16sp',
					onClick = function(View)
						floatingWindowManager:start('Button Function') -- Button Function button function window, provided that newWindow has been created
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
						floatingWindowManager:start('Switch function')
					end
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Other features',
					textSize = '16sp'
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Multithreading capabilities',
					textSize = '16sp',
					onClick = function()
						floatingWindowManager:start('Multithreading capabilities')
					end
				}
			}
		})
	end,
	onDestroy = function()
		-- gg.alert('Welcome to use next time!')
	end
})

floatingWindowManager:newWindow('Button Function', {
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
				newButtonLayout('Feature 1'),
				newButtonLayout('Feature 2'),
				newButtonLayout('Feature 3'),
				newButtonLayout('Feature 4'),
				newButtonLayout('Feature 5')
			}
		})

	end
})

floatingWindowManager:newWindow('Switch function', {
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
				newSwitchLayout('Feature 1', 'Close function 1'),
				newSwitchLayout('Function 2', 'Close Function 2'),
				newSwitchLayout('Function 3'),
				newSwitchLayout('Feature 4'),
				newSwitchLayout('Function 5', 'Close function 5')
			}
		})
	end
})

floatingWindowManager:newWindow('Multithreading capabilities', {
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
						-- cacheName in the same window cannot be repeated and must be unique. It can be random.
						local cacheName = 'Multithreaded 1'
						if state then
							gg.alert('Thread start')
							local thread1 = luajava.startThread(B1)
							floatingWindow:setCache(cacheName, thread1)
						else
							gg.alert('Thread shutdown')
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
