draw3 = require('draw3')

-- 方块宽度为屏幕宽度的十分之一
width = device.width / 10
-- 方块高度为屏幕高度的十分之一
height = device.height / 10

-- 把绘制的对象创建出来
rect1 = draw3.rect(0, 0, 0, 0)

-- 更新绘制内容
for y = 1, device.height, height do
	-- 设置随机颜色
	local color = math.random(000000, 0xffffff)
	rect1.setColor(color)

	for x = 1, device.width, width do
		rect1.update(x, y, x + width, y + height)
		gg.sleep(100)
	end
end
