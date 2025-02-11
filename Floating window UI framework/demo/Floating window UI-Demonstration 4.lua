--[[
floatingWindowManager
Related function usage documentation
https://gitee.com/rlyun/rlgg/tree/master/%E6%82%AC%E6%B5%AE%E7%AA%97UI%E6%A1%86%E6%9E%B6


]]--

local function interruptThread(thread)
	if thread then
		pcall(function()
			thread:interrupt()
		end)
	end
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

-- Get the thread callback and assign it to onClick to avoid UI blocking problems

local function getASyncThreadCallbak(func) -- asynchronous thread callback
	return function()
		luajava.startThread(function()
			return pcall(func)
		end)
	end
end

-- Applied in line 101
local task
local function getSyncThreadCallbak(func) -- Synchronous thread callback. Callbacks involving the gg library can only use this method, otherwise it may be unstable.
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

local function callSyncThreadCallbak(func)
	return getSyncThreadCallbak(func)()
end

local floatingWindowManager = require('floatingWindowManager')
floatingWindowManager:init()

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
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Button 1',
					textSize = '16sp',
					onClick = function()
						callSyncThreadCallback(A1)
					end
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Button 2',
					textSize = '16sp',
					onClick = function()
						callSyncThreadCallback(A2)
					end
				}
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
				{
					Switch,
					layout_width = 'match_parent',
					text = 'Switch 1',
					onCheckedChange = function(CompoundButton, state)
						if state then
							callSyncThreadCallback(C1)
						else
							gg.alert('You turned off the C1 switch')
						end
					end
				},
				{
					Switch,
					layout_width = 'match_parent',
					text = 'Switch 2',
					onCheckedChange = function(CompoundButton, state)
						if state then
							callSyncThreadCallback(C2)
						else
							gg.alert('You turned off the C2 switch')
						end
					end
				}
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
