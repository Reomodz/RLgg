
---@type ui
local ui = require('ui')
local windowManager = require('windowManager')
local viewManager

local drawerView
local text_title = string.randomMD5()

local main_titlebar_layout = {
	LinearLayout,
	layout_width = "match_parent",
	backgroundColor = 0x20000000,
	{
		ImageView,
		imageResource = 0x7f020037,
		layout_height = "30dp",
		layout_width = "30dp",
		scaleType = 'fitCenter',
		onClick = function()
			drawerView:openDrawer(Gravity.START)
		end
	},
	{
		TextView,
		layout_weight = 1,
		id = luajava.newId(text_title),
		gravity = "center_vertical",
		layout_height = "match_parent",
		onLongClick = function(view)
			gg.copyText(view:getText(), false)
		end
	},
	{
		ImageView,
		imageResource = 0x7f020029,
		layout_height = "30dp",
		layout_width = "30dp",
		scaleType = 'fitCenter',
		onClick = function(view)
			-- drawerLayout:openDrawer(Gravity.START)
			local menu = {
				{
					'refresh'
				},
				{
					'search'
				},
				{
					'Select All'
				},
				{
					'filter'
				},
				{
					'quit',
					onClick = function()
						viewManager:unpark()
					end
				}
			}

			---@type android.widget.PopupMenu
			local popupMenu = ui.SimplePopupMenu({
				bindView = view,
				menu = menu,
				onSelectedListener = function(parent, view, position)
					local name = menu[position][1]
					gg.toast(string.format('%q function not defined', name))
				end
			})
			popupMenu:show()
		end
	}
}

local mian_layout = {
	LinearLayout,
	layout_width = "match_parent",
	layout_height = "match_parent",
	orientation = "vertical",
	backgroundColor = 0x50292c33,
	{
		LinearLayout,
		backgroundColor = 0x50000000,
		layout_width = "match_parent",
		layout_height = "match_parent",
		orientation = "vertical",
		paddingEnd = '50dp',
		main_titlebar_layout,
		{
			'ui.FileListView',
			layout_height = "match_parent",
			layout_width = "match_parent",
			padding = '6dp',
			dir = gg.getFile():getdir(),
			onSelectedListener = function(parent, view, position, id, data)
				local mfile = data
				local textView = luajava.getIdView(text_title)
				if textView then
					textView:setText(mfile:getAbsolutePath())
				end
			end,
			-- fileFilter = 'lua'
		}
	}
}

local drawer_titlebar_layout = {
	LinearLayout,
	backgroundColor = 0x50000000,
	layout_width = "match_parent",
	orientation = "vertical",
	{
		LinearLayout,
		layout_width = "match_parent",
		{
			ImageView,
			imageResource = 0x7f02002c,
			layout_height = "30dp",
			layout_width = "30dp",
			scaleType = 'fitCenter'
		},
		{
			TextView,
			layout_weight = 1,
			gravity = "center_vertical",
			text = app.name,
			layout_height = "match_parent"
		},
		{
			ImageView,
			imageResource = 0x7f020029,
			layout_height = "30dp",
			layout_width = "30dp",
			scaleType = 'fitCenter',
			onClick = function(view)
				local menu = {
					{
						'quit',
						onClick = function(item)
							viewManager:unpark()
						end
					}
				}

				---@type android.widget.PopupMenu
				local popupMenu = ui.SimplePopupMenu({
					bindView = view,
					menu = menu,
					onSelectedListener = function(parent, view, position)
						-- When the menu does not exist onClick callback function, enter onSelectedListener

						local name = menu[position][1]
						gg.toast(string.format('%q function not defined', name))
					end
				})
				popupMenu:show()
			end
		}
	}
}

local expandableList_layout = {
	'ui.SimpleExpandableListView',
	layout_width = "match_parent",
	{
		'local',
		{
			'Root Storage',
			thread = function()
				gg.alert('hello')
			end
		},
		{
			'Internal storage'
		}
	},
	{
		'network'
	},
	{
		'tool',
		{
			'Plugin Management'
		},
		{
			'Remote Management'
		},
		{
			'Screen color'
		},
		{
			'Installation package management'
		},
		{
			'Text Editor'
		},
		{
			'Terminal emulator'
		},
		{
			'Actvity Records'
		},
		{
			'Smali command query'
		}
	}
}

local drawer_layout = {
	LinearLayout,
	layout_gravity = Gravity.START,
	layout_height = "match_parent",
	layout_width = "320dp",
	backgroundColor = 0xb0000000,
	orientation = "vertical",
	drawer_titlebar_layout,
	expandableList_layout
}

drawerView = luajava.loadlayout({
	'ui.DrawerLayoutx',
	layout_width = "match_parent",
	layout_height = "match_parent",
	mian_layout,
	drawer_layout
})



viewManager = windowManager:bindView(drawerView)

-- The width and height of the container of ui.DrawerLayoutx must be MATCH_PARENT 
viewManager:addView({
	width = WindowManager.LayoutParams.MATCH_PARENT,
	height = WindowManager.LayoutParams.MATCH_PARENT
})

gg.setVisible(false)
viewManager:wait()

