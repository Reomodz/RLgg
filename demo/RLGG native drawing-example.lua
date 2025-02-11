--[[

What are the advantages of drawManager over the draw library?
Solve the problem that drawing cannot penetrate click events in Android 12 and above
Drawing content is completely implemented by yourself, with higher controllability, richer customization, and higher efficiency

]] -- 
local windowManager = require('windowManager')
local drawManager = windowManager:newDrawManager()

function starsView()
	local paint = Paint()
	paint:setAntiAlias(true)
	paint:setStrokeWidth(3)
	paint:setColor(Color.WHITE)
	paint:setStyle(Paint.Style.STROKE)

	local path = Path()

	local view
	view = drawManager:onDraw(function(canvas)
		local centerX = view:getWidth() / 2
		local centerY = view:getHeight() / 2
		local size = math.min(centerX, centerY) - 20

		path:reset()

		local angle = 2 * math.pi / 6
		local radius = size / 2

		for i = 0, 6 do
			local startX = centerX + radius * math.cos(i * angle)
			local startY = centerY + radius * math.sin(i * angle)
			local endX = centerX + radius * math.cos((i + 2) * angle)
			local endY = centerY + radius * math.sin((i + 2) * angle)

			path:moveTo(startX, startY)
			path:lineTo(endX, endY)
		end

		canvas:drawPath(path, paint)
	end)
	return view
end

-- Draw Yourself
-- If no parameters are required, you can draw to the screen with one line of code
drawManager:bindView(starsView()):show()

-- Draw text
-- text1DrawManager is the management object of this bindView
local text1DrawManager
text1DrawManager = drawManager:bindView(function(canvas)
	local paint = text1DrawManager:getTag('paint')
	if not paint then
		paint = Paint()
		paint:setColor(0xffff0000)
		paint:setTextSize(40)
		text1DrawManager:setTag('paint', paint)
	end

	canvas:drawText(tostring(os.time()), 100, 100, paint)

	-- Refresh after 1 second. 1000ms = 1s
	text1DrawManager:postInvalidateDelayed(1000)
end)
text1DrawManager:show()

-- You can also use native View
local bt = Button(context)
bt:setText('Button')

local btDrawManager = drawManager:bindView(bt)
btDrawManager:addView({
	x = 200,
	y = 200
})
btDrawManager:setBackgroundColor(0xffff0000)

-- Go to sleep and wait for wakeup or script completion
drawManager:park()
