luajava.getViewPagerMagicIndicator = function(items)
	local titles = {}

	for i, v in ipairs(items) do
		local t = v.getTitle
		if t ~= nil then
			titles[i] = t
			v.getTitle = nil
		else
			t = v.title
			titles[i] = function()
				return v
			end
			v.title = nil
		end
	end

	-- Load Magicindicator dependency

	-- dalvik.system.DexClassLoader
	local Magicindicator = dex.getMagicindicator()
	local classname = 'rlyun.modules.widget.ViewPagerMagicIndicator'
	local ViewPagerMagicIndicatorClass = Magicindicator:loadClass(classname)

	local proxyMethodMap = {
		getIconDrawable = function(position)
			position = position + 1
			local layout = items[position]
			if not layout then
				return
			end

			local func = layout.getIconDrawable
			if not isFunction(func) then
				return
			end

			local ok, res = pcall(func)
			if ok then
				return res
			end
		end,
		getTitleView = function(position)
			position = position + 1
			local func = titles[position]
			if not isFunction(func) then
				return
			end

			local ok, res = pcall(func)
			if ok then
				return tostring(res)
			end
		end,
		getCount = function()
			return #items
		end,
		getContextView = function(position)
			position = position + 1
			local layout = items[position]
			local ok, view = pcall(luajava.loadlayout, layout)
			if ok then
				return view
			end

			return luajava.loadlayout({
				TextView,
				text = view
			})
		end
	}

	local base = luajava.newClassProxyInstance(ViewPagerMagicIndicatorClass.BaseImpl, proxyMethodMap)
	local view = ViewPagerMagicIndicatorClass(app.context, base)

	return view
end
