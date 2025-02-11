# luajava

## 介绍

luajava是luaj的一个类库，它的目的是让lua可以和java进行交互，例如在lua实例化/调用java的Object（对象）



luajava交互的数据类型通常为 userdata ，该类型由两个单词组成，user（用户）+ data（数据）

userdata方法的调用通常使用:语法，

例如

~~~lua
-- 绑定一个java的类
FileClass = luajava.bindClass('java.io.File')
type(FileClass) --> userdata #java.lang.Class

testFile = luajava.new(FileClass, '/sdcard/test')
type(testFile) --> userdata #java.io.File

-- 调用 isFile 方法判断是否为文件，这里的调用用的是:而不是table用的.
testFile:isFile()


~~~



:（英文冒号）的指令叫 SELF，它的作用是将左边的数据作为第一个参数传递给右边的方法

~~~lua
local namemap = {name='RL'}

local test = 'hello $name'

local res = string.gsub(test, '$(%w+)', namemap)
print(res) --> hello RL

local res = test:gsub('$(%w+)', namemap)
print(res) --> hello RL
~~~

string.gsub(test, p2

等价于

test:gsub(p2

等价于

test.gsub(test, p2



java调用对象方法时，默认第一个参数(p0)是this，即自身对象的意思，而luajava也要求第一个参数是自身，所以用:来调用方法再适合不过了

testFile:isFile()

也可以用

testFile.isFile(testFile)



其实并不是规定用:

而是规定第一个参数必须是 userdata 调用者自己，因此使用:更加适合





## 用法

### 如何获取java的类？

获取java类可以使用 luajava.bindClass 方法绑定，得到一个userdata类型（java.lang.Class）的数据

~~~lua
FileClass = luajava.bindClass('java.io.File')
RunnableClass = luajava.bindClass('java.lang.Runnable')
ThreadClass = luajava.bindClass('java.lang.Thread')


~~~



在RLGG中支持泛型导入java类

使用 import 方法

~~~lua
-- 该泛型导入包含了 java.lang 下级所有的类
import('java.lang.*')

print(Runnable) --> interface java.lang.Runnable
print(Thread) --> class java.lang.Thread


~~~



### 如何创建/实例化对象？

在java中创建一个对象的关键字是 new 类();

在luajava中，创建对象的方法是 luajava.new

~~~lua
FileClass = luajava.bindClass('java.io.File')

testFile = luajava.new(FileClass, '/sdcard/test')
~~~



在RLGG中，创建对象可以直接call类

~~~lua
FileClass = luajava.bindClass('java.io.File')

testFile = FileClass('/sdcard/test')
~~~





### 如何获取（get）/设置（set）对象的属性？

其实和 table 使用方法一样

~~~lua
Math = luajava.bindClass('java.lang.Math')
PI = Math.PI
print(PI) -- >3.14159...
~~~

获取到的数据类型取决于该数据在java中是什么类型，如果是一个方法，那么在lua对应的就是 function

null -> nil

Boolean -> boolean

所有数值有关 -> number

String -> string

没有对应的转换类型，则为 userdata



~~~lua
MathClass = luajava.bindClass('java.lang.Math')
local abs = MathClass.abs
print(type(abs)) -- > function

-- 调用从 userdata 获取的方法，第一个参数必须是 userdata ，即自身，如果是静态方法，传任意 userdata 即可
local res = abs(MathClass, -100)
print(res) -- > 100

-- abs(MathClass, -100) 可以简写为 MathClass:abs(-100)

print(MathClass:abs(-100)) --> 100
~~~







### 如何实现接口？

例如需要实现 java.lang.Runnable 的 run



第一种，最原始的方法，利用 luajava.createProxy

缺点，只能实现 ApkLoader 包含的类，例如第三方dex中的类是不支持的，因为不是同一个类加载器

~~~lua
-- 注意，所有实现的接口都不能直接 print 查看，因为它没有 toString 方法，如果你非要查看，可以在实现时的table加上 toString 方法
runnable = luajava.createProxy('java.lang.Runnable', {
	run = function()
		--
	end
})

ThreadClass = luajava.bindClass('java.lang.Thread')
thread = luajava.new(ThreadClass, runnable)


~~~



第二种，利用 luajava.newClassProxyInstance，该方法不是原生 luajava，是我拓展的

为了避免第一种缺点，将需要实现的接口类改为类，可以是任意来源的类，比如第三方dex加载的类

~~~lua
RunnableClass = luajava.bindClass('java.lang.Runnable')
runnable = luajava.newClassProxyInstance(RunnableClass, {
	run = function()
		--
	end
})

ThreadClass = luajava.bindClass('java.lang.Thread')
thread = luajava.new(ThreadClass, runnable)

~~~



luajava.newClassProxyInstance 需要实现的方法，可以从table缩写成唯一的 function，注意，接口只有唯一一个抽象方法时才可以省略table

例如 java.lang.Runnable 只有唯一一个 run 方法可以实现，那么就可以省略 table，直接写 function

~~~lua
local function run()
	
end

RunnableClass = luajava.bindClass('java.lang.Runnable')
runnable = luajava.newClassProxyInstance(RunnableClass, run)

~~~



第三种，利用 底层的机制，需要RLGG 2.0.7 及以上版本才支持

任意接口都可以直接使用function代替，底层自动帮你实现，缺点和第一种一样

~~~lua
local function run()
	
end

ThreadClass = luajava.bindClass('java.lang.Thread')
thread = ThreadClass(run)

~~~



### 如何继承[?抽象]类？

单纯lua做不到，您需要在java编写一个适配器类及实现的接口，编译成dex/jar，再通过 luajava.newClassProxyInstance 实现接口

~~~lua
local dexloader = dex.loadfile('dex文件')
AdapterClass = dexloader:loadClass('适配器类名')

Impl = luajava.newClassProxyInstance(AdapterClass.Impl, {
        Method1 = function(...)
        
        end,
        Method2 = function(...)
        
        end,
})

MyAbstractObj = AdapterClass(Impl)


~~~

适配器或者说装饰器，可以在lua动态实现需要的功能



### 如何反射获取方法？

为什么需要这种方式来获取方法？

因为当对象中存在和方法名字一样的属性时，你获取的数据应该是属性还是方法呢？

或者当对象中存在重载方法时，获取到的方法可能并不是你需要的那个，所以就有了反射的方式获取

它可以按照方法的参数类型获取类的某个方法

~~~lua
MathClass = luajava.bindClass('java.lang.Math')
FloatClass = luajava.bindClass('java.lang.Float')
Class = luajava.bindClass('java.lang.Class')

local methodName = 'abs'
local parameterTypes = {FloatClass.TYPE}
local abs = Class.getMethod(MathClass, methodName, parameterTypes)
print(abs) -- >userdata  public static float java.lang.Math.abs(float)

-- 使用反射的方式调用java方法
print(abs:invoke(nil, {-100})) --> 100

-- 使用 class.forMethod 方法可以把需要反射的java方法映射成 LuaFunction
abs = class.forMethod(MathClass, methodName, parameterTypes)
print(type(abs)) --> function
print(abs(-100)) --> 100
~~~





## 注意事项

- 在 luajava 的回调事件中，最好不好有堵塞，否则可能会卡死，可以用多线程执行

  错误示范

  ~~~lua
  local alert = gg.newAlert('圆角')
  
  local view = luajava.loadlayout({
  	Button,
  	text = 'Button',
  	background = {
  		GradientDrawable,
  		cornerRadius = '15dp',
  		color = 0xffff0000
  	},
  	onClick = function()
  		gg.alert('会卡死')
  	end
  })
  alert:setView(view)
  
  gg.showAlert(alert)
  
  ~~~

  

  正确示范

  ~~~lua
  local alert = gg.newAlert('圆角')
  
  local view = luajava.loadlayout({
  	Button,
  	text = 'Button',
  	background = {
  		GradientDrawable,
  		cornerRadius = '15dp',
  		color = 0xffff0000
  	},
  	onClick = function()
  		local function func()
  			gg.alert('不会卡死')
  		end
          -- 使用多线程执行
  		luajava.startThread(func)
  	end
  })
  alert:setView(view)
  
  gg.showAlert(alert)
  
  ~~~

  

  

  

- 
