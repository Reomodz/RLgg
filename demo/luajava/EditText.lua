--[[

Solve the problem that EditText cannot get focus in the floating window, and cannot click the back key after getting focus

]]


local windowManager = require('windowManager')
local LayoutParams = luajava.bindClass('android.view.WindowManager$LayoutParams')
local editTextManager

local editText = EditText(context)

luajava.setInterface(editText, 'setOnFocusChangeListener', function(view, hasFocus)
	editTextManager:getLayoutParams().flags = hasFocus and LayoutParams.FLAG_NOT_TOUCH_MODAL or LayoutParams.FLAG_NOT_FOCUSABLE
	editTextManager:updateView()
end)

luajava.setInterface(editText, 'setOnKeyListener', function(view, keyCode, KeyEvent)
	if keyCode == KeyEvent.KEYCODE_BACK then
		view:setFocusable(false)
	end
end)

luajava.setInterface(editText, 'setOnClickListener', function(view)
	if not view:isFocused() then
		view:setFocusableInTouchMode(true)
		view:setFocusable(true)
	end
end)

windowManager:addView(editText, {
	flags = LayoutParams.FLAG_NOT_TOUCH_MODAL
})

editTextManager = windowManager:bindView(editText)
editTextManager:setMoveable(true)
editTextManager:wait()
