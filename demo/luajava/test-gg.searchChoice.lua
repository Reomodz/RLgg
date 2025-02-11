local items = {'apple', 'watermelon', 'Honeydew Melon', 'banana', 'Sydney'}
local inputs = gg.searchChoice(items, 'title')

if not inputs then
	gg.alert('You canceled the operation')
	os.exit()
end

for i, _ in pairs(inputs) do
	print('You choose', i, items[i])
end
