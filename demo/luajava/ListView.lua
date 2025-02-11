local arr = {"Pineapple", "Mango", "Pomegranate", "Grape", "Apple", "Orange", "Watermelon", "Pineapple", "Mango", "Pomegranate", "Grape", "Apple", "Orange", "Watermelon", "Pineapple", "Mango", "Pomegranate", "Grape", "Apple", "Orange", "Watermelon"}

local adapter = ArrayAdapter(context, android.R.layout.simple_list_item_1, arr)

local listView = ListView(context)
listView:setAdapter(adapter)

luajava.setInterface(listView, 'setOnItemClickListener', function(parent, view, position, id)
	-- The current callback function belongs to the main thread and cannot execute blocking code, otherwise an exception will occur. If necessary, you can use multithreading

	luajava.startThread(function()
		-- The initial order of java is different from that of lua, need to be fixed, +1
		local fix_position = position + 1
		gg.alert2('You clicked', arr[fix_position])

	end)
end)

local alert = gg.newAlert('What kind of fruit do you want to buy?')
alert:setView(listView)
gg.showAlert(alert)
