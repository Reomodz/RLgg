# luajava

## introduce

luajava is a class library of luaj, its purpose is to allow lua to interact with java, such as instantiating/calling java Object in lua



The data type of luajava interaction is usually userdata, which consists of two words, user (user) + data (data)

The userdata method is usually called using the syntax:

For example

~~~lua
-- Bind a java class
FileClass = luajava.bindClass('java.io.File')
type(FileClass) --> userdata #java.lang.Class

testFile = luajava.new(FileClass, '/sdcard/test')
type(testFile) --> userdata #java.io.File

-- Call the isFile method to determine whether it is a file. The call here uses : instead of the table one.
testFile:isFile()


~~~



The command with a colon is called SELF. It passes the data on the left as the first parameter to the method on the right.

~~~lua
local namemap = {name='RL'}

local test = 'hello $name'

local res = string.gsub(test, '$(%w+)', namemap)
print(res) --> hello RL

local res = test:gsub('$(%w+)', namemap)
print(res) --> hello RL
~~~

string.gsub(test, p2

Equivalent to

test:gsub(p2

Equivalent to

test.gsub(test, p2



When java calls an object method, the default first parameter (p0) is this, which means the object itself, and luajava also requires the first parameter to be itself, so it is more appropriate to use: to call the method.

testFile:isFile()

You can also use

testFile.isFile(testFile)



In fact, it is not required to use:

Instead, it stipulates that the first parameter must be the userdata caller itself, so it is more appropriate to use:





## Usage

### How to get the java class?

To get a Java class, you can use the luajava.bindClass method to bind and get a userdata type (java.lang.Class) data

~~~lua
FileClass = luajava.bindClass('java.io.File')
RunnableClass = luajava.bindClass('java.lang.Runnable')
ThreadClass = luajava.bindClass('java.lang.Thread')


~~~



Support generic import of java classes in RLGG

Using the import method

~~~lua
-- This generic import includes all classes under java.lang
import('java.lang.*')

print(Runnable) --> interface java.lang.Runnable
print(Thread) --> class java.lang.Thread


~~~



### How to create/instantiate objects?

The keyword to create an object in Java is new class();

In luajava, the method to create an object is luajava.new

~~~lua
FileClass = luajava.bindClass('java.io.File')

testFile = luajava.new(FileClass, '/sdcard/test')
~~~



In RLGG, you can create an object by calling the class directly.

~~~lua
FileClass = luajava.bindClass('java.io.File')

testFile = FileClass('/sdcard/test')
~~~





### How to get/set the properties of an object?

In fact, it is used in the same way as table

~~~lua
Math = luajava.bindClass('java.lang.Math')
PI = Math.PI
print(PI) -- >3.14159...
~~~

The data type obtained depends on what type the data is in Java. If it is a method, then the corresponding function in Lua is

null -> nil

Boolean -> boolean

All numerical values ​​-> number

String -> string

If there is no corresponding conversion type, it is userdata



~~~lua
MathClass = luajava.bindClass('java.lang.Math')
local abs = MathClass.abs
print(type(abs)) --> function

-- Call the method obtained from userdata. The first parameter must be userdata, that is, itself. If it is a static method, any userdata can be passed.
local res = abs(MathClass, -100)
print(res) --> 100

-- abs(MathClass, -100) can be abbreviated as MathClass:abs(-100)

print(MathClass:abs(-100)) --> 100
~~~







### How to implement the interface?

For example, you need to implement the run of java.lang.Runnable



The first, most primitive method, uses luajava.createProxy

Disadvantage: Only classes included in ApkLoader can be implemented. For example, classes in third-party dex are not supported because they are not the same class loader.

~~~lua
-- Note that all implemented interfaces cannot be directly printed out because they do not have a toString method. If you must view them, you can add a toString method to the implementation table.
runnable = luajava.createProxy('java.lang.Runnable', {
	run = function()
		--
	end
})

ThreadClass = luajava.bindClass('java.lang.Thread')
thread = luajava.new(ThreadClass, runnable)


~~~



The second method is to use luajava.newClassProxyInstance. This method is not native luajava, but my extension.

To avoid the first disadvantage, change the interface class to be implemented to a class, which can be a class from any source, such as a class loaded by a third-party dex

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



The method that luajava.newClassProxyInstance needs to implement can be abbreviated from table to a unique function. Note that table can be omitted when the interface has only one abstract method.

For example, java.lang.Runnable has only one run method that can be implemented, so you can omit the table and write function directly.

~~~lua
local function run()
	
end

RunnableClass = luajava.bindClass('java.lang.Runnable')
runnable = luajava.newClassProxyInstance(RunnableClass, run)

~~~



The third method uses the underlying mechanism, which requires RLGG 2.0.7 and above to support

Any interface can be directly replaced by function, and the underlying layer will automatically implement it for you. The disadvantages are the same as the first method.

~~~lua
local function run()
	
end

ThreadClass = luajava.bindClass('java.lang.Thread')
thread = ThreadClass(run)

~~~



### How to inherit [?abstract] classes?

Lua alone cannot do this. You need to write an adapter class and the implemented interface in Java, compile it into dex/jar, and then implement the interface through luajava.newClassProxyInstance

~~~lua
local dexloader = dex.loadfile('dex file')
AdapterClass = dexloader:loadClass('Adapter class name')

Impl = luajava.newClassProxyInstance(AdapterClass.Impl, {
        Method1 = function(...)
        
        end,
        Method2 = function(...)
        
        end,
})

MyAbstractObj = AdapterClass(Impl)


~~~

Adapters or decorators can dynamically implement the required functions in Lua



### How to obtain methods through reflection?

Why do you need to get the method this way?

Because when there is a property with the same name as a method in the object, should you get the data of the property or the method?

Or when there are overloaded methods in the object, the method obtained may not be the one you need, so there is a reflection method to obtain it

It can get a method of a class according to the parameter type of the method

~~~lua
MathClass = luajava.bindClass('java.lang.Math')
FloatClass = luajava.bindClass('java.lang.Float')
Class = luajava.bindClass('java.lang.Class')

local methodName = 'abs'
local parameterTypes = {FloatClass.TYPE}
local abs = Class.getMethod(MathClass, methodName, parameterTypes)
print(abs) -- >userdata public static float java.lang.Math.abs(float)

-- Calling Java methods using reflection
print(abs:invoke(nil, {-100})) --> 100

-- Use the class.forMethod method to map the Java method that needs to be reflected into a LuaFunction
abs = class.forMethod(MathClass, methodName, parameterTypes)
print(type(abs)) --> function
print(abs(-100)) --> 100
~~~





## Notes

- In the callback event of luajava, it is best not to have any blockage, otherwise it may get stuck. You can use multi-threaded execution

  Error demonstration

  ~~~lua
  local alert = gg.newAlert('rounded corners')
  
  local view = luajava.loadlayout({
  	Button,
  	text = 'Button',
  	background = {
  		GradientDrawable,
  		cornerRadius = '15dp',
  		color = 0xffff0000
  	},
  	onClick = function()
  		gg.alert('will get stuck')
  	end
  })
  alert:setView(view)
  
  gg.showAlert(alert)
  
  ~~~

  

  Correct demonstration

  ~~~lua
  local alert = gg.newAlert('rounded corners')
  
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
  			gg.alert('Won't get stuck')
  		end
          -- Use multi-threaded execution
  		luajava.startThread(func)
  	end
  })
  alert:setView(view)
  
  gg.showAlert(alert)
  
  ~~~

  

  

  

-
