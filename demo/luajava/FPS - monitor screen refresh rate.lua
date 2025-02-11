local cglib = require('cglib')
local windowManager = require('windowManager')

local function FpsView()
	local fps = 0
	local fpsView = cglib.createInterceptor(TextView, {'onDraw'}, function(thisObject, param, methodProxy)
		methodProxy:invokeSuper(thisObject, param)
		fps = fps + 1
		thisObject:postInvalidateDelayed(2)
	end, context)

	fpsView:setText('fps')
	fpsView:setTextColor(0xff00ff00)
	fpsView:setTextSize(18)

	local handler = cglib.createInterceptor(Handler, {'handleMessage'}, function(thisObject, param, methodProxy)
		methodProxy:invokeSuper(thisObject, param)

		local message = param[1]
		fpsView:setText(string.format('fps:%d', message.what))

	end, Looper:getMainLooper())

	luajava.startThread(function()
		while true do
			local msg = Message:obtain()
			msg.what = fps
			fps = 0
			handler:sendMessage(msg)
			gg.sleep(1000)
		end
	end)

	return fpsView
end

local fpsViewManager = windowManager:bindView(FpsView())
fpsViewManager:show()
fpsViewManager:setMoveable(true)

gg.setVisible(false)
-- The following line needs to be deleted, otherwise it will be blocked
fpsViewManager:wait()

gg.alert('RLGG')
