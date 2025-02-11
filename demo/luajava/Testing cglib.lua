local cglib = require('cglib')

local o = cglib.createInterceptor(Object, {'toString', 'equals'}, function(thisObject, param, methodProxy)
	print('Interception', methodProxy:getMethodName())

	if methodProxy:getMethodName() == 'toString' then
		return 'cglib.createInterceptor: Modified the return value of toString'
	end

	return methodProxy:invokeSuper(thisObject, param)
end)

print(luajava.instanceOf(o, Object))
print(o:toString())

local o = cglib.createProxy(Object, {
	toString = function()
		return 'cglib.createProxy: Modified the return value of toString'
	end,
	equals = function(o)
		return false
	end
})

print(o:toString())
print(o:equals(o), 'It was intercepted and forced to return false')
