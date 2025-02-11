local function FishView()
	local mPaint
	local mFishX = 20 -- The x-coordinate of the fish
	local mFishY = 70 -- The y coordinate of the fish

	
	mPaint = Paint()
	mPaint:setAntiAlias(true)
	mPaint:setStyle(Paint.Style.FILL)
	mPaint:setColor(Color.RED)

	local function onDraw(canvas)
		-- Draw the fish body
		local bodyPath = Path()
		bodyPath:moveTo(mFishX, mFishY)
		bodyPath:lineTo(mFishX + 100, mFishY - 50)
		bodyPath:lineTo(mFishX + 150, mFishY)
		bodyPath:lineTo(mFishX + 100, mFishY + 50)
		bodyPath:close()
		canvas:drawPath(bodyPath, mPaint)

		-- Drawing fish eyes
		mPaint:setColor(Color.WHITE)
		canvas:drawCircle(mFishX + 110, mFishY - 10, 8, mPaint)
		mPaint:setColor(Color.BLACK)
		canvas:drawCircle(mFishX + 110, mFishY - 10, 4, mPaint)

		-- Draw the fish mouth
		local mouthPath = Path()
		mouthPath:moveTo(mFishX + 150, mFishY)
		mouthPath:lineTo(mFishX + 120, mFishY + 20)
		mouthPath:lineTo(mFishX + 120, mFishY - 20)
		mouthPath:close()
		canvas:drawPath(mouthPath, mPaint)
	end

	return luajava.proxyOnDraw(onDraw)
end

local fishView = FishView()

-- Use the windowManager module to add View to the floating window
local windowManager = require('windowManager')

local viewManager = windowManager:bindView(fishView)
viewManager:addView({
	width = 200,
	height = 200,
})

viewManager:setMoveable(true)
gg.setVisible(false)
viewManager:wait()

