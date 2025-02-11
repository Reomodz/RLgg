--[[

setOnAudioListener(android.content.BroadcastReceiver#onReceive)

onReceive callback belongs to the UI thread and cannot execute gg library functions (with blocking)

]] -- Set the visibility of View by monitoring the volume
function fromAudioSetVisibility(view)

	-- setOnAudioListener It comes with rlgg
	setOnAudioListener(function(context, intent)
		view:setVisibility(view:isShown() and view.GONE or  view.VISIBLE)
	end)

end

local windowManager = require('windowManager')
local viewManager

local button = Button(context)
button:setText('When the sound key is pressed, if the View is displayed, it is hidden, otherwise it is displayed')

fromAudioSetVisibility(button)

viewManager = windowManager:bindView(button)
viewManager:setMoveable(true)
viewManager:show()
viewManager:wait()

