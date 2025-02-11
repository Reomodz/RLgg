--[[
luajava.getYoYoImpl()

YoYo is a github open source project introduced by RLGG, which mainly implements some View animations

2023/2/9 GitHub - daimajia/AndroidViewAnimations: A collection of cute view animations.
https://github.com/daimajia/AndroidViewAnimations 1/1

]] --

local data = [[

Hinge , , ,,, RollIn RollOut Landing TakingOff DropOut
bounce
BounceIn , , , , BounceInDown BounceInLeft BounceInRight BounceInUp
fade
FadeIn , , , , FadeInUp FadeInDown FadeInLeft FadeInRight
FadeOut , , , , FadeOutDown FadeOutLeft FadeOutRight FadeOutUp
Somersault
FlipInX , , FlipOutX FlipOutY
Rotation
RotateIn , , , , RotateInDownLeft RotateInDownRight RotateInUpLeft RotateInUpRight
RotateOut , , , , RotateOutDownLeft RotateOutDownRight RotateOutUpLeft RotateOutUpRight
slip
SlideInLeft , , , SlideInRight SlideInUp SlideInDown
SlideOutLeft , , , SlideOutRight SlideOutUp SlideOutDown
Zoom
ZoomIn , , , , ZoomInDown ZoomInLeft ZoomInRight ZoomInUp
ZoomOut , , , , ZoomOutDown ZoomOutLeft ZoomOutRight ZoomOutU

]]

local typeList = {}
data:gsub('%u%w+', function(t)
	typeList[#typeList + 1] = t
end)

-- In actual use, you only need to fill in the corresponding type. I am just demonstrating here, so I will capture all types directly.
-- Supported types
print(typeList)


local YoYoImpl = luajava.getYoYoImpl()

local imageView = luajava.loadlayout({
	ImageView,
	src = 'https://www.baidu.com/img/flexible/logo/pc/result.png'
})

local layout = {
	LinearLayout,
	orientation = 'vertical'
}

for i, text in ipairs(typeList) do
	layout[#layout + 1] = {
		Button,
		text = text,
		onClick = function()
			local typ = text -- animation type, from the traversal of typeList
            local view = imageView -- select the View to be implemented, imageView here is an image
			YoYoImpl:with(typ):duration(700):playOn(view)
		end
	}
end

local rootView = luajava.loadlayout({
	LinearLayout,
	orientation = 'vertical',
	{imageView},
	{
		ScrollView,
		layout_margin = '10dp',
		layout
	}
})

local alert = luajava.newAlert()
alert:setView(rootView)

gg.showAlert(alert)
