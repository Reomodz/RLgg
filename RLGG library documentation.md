



# _ENV

> _ENV is a global environment variable



[View as text](https://gitee.com/rlyun/rlgg/raw/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md)

> Save for easy search



All parameters named root indicate whether to execute the function with root privileges, usually of boolean type



## modules

> The module needs to be loaded using require. Generally, the first load requires an Internet connection, so it is not recommended to load it in UiThread. Instead, load the used modules in advance.

### [draw3](#draw3)



### [floatingWindowManager](src/windowManager/floatingWindowManager.lua)



### [windowManager](src/windowManager/windowManager.lua)



### [Chinese module](%E4%B8%AD%E6%96%87%E6%A8%A1%E5%9D%97/%E4%B8%AD%E6%96%87%E6%A8%A1%E5%9D%97.lua)



### [cglib](#cglib)



### ui

> In Production



### androidx

> Returns androidx's java.lang.ClassLoader



###









## Global Functions

#### isNil

> Determine whether the data type is nil

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### isBoolean

> Determine whether the data type is boolean

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### isNumber

> Determine whether the data type is number

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### isString

> Determine whether the data type is string

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### isTable

> Determine whether the data type is table

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### isFunction

> Determine whether the data type is function

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### isUserdata

> Determine whether the data type is userdata

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### isThread

> Determine whether the data type is thread

| Parameter name | Type |
| :----- | -------- |
| data | LuaValue |

| Return value name | Type |
|---------- |------- |
| ok | boolean |
| type | string |



#### import

> Import java class

| Parameter Name | Type | Description |
| :-------- | ------ | ----------------------- |
| className | string | Supports generic types, such as java.lang.* |

| Return value name | Type |
| ---------- | --------------- |
| Class | java.lang.Class |

> Example

~~~lua
local File = import('java.io.File')
local sdcard = File('/sdcard/') -- java.io.File
print(sdcard:isFile()) -- false

local java_util = import('java.util.*')
local UUID = java_util.UUID -- java.util.UUID
local uuid = UUID:randomUUID() -- java.util.UUID
uuid = uuid:toString() -- string
print(uuid)
~~~





#### getLoadingBox

> Get loading frame

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| text | string | is| the text to be displayed |

| Return value name | Type |
|---------- | ----- |
| LoadingBox | table |

> LoadingBox

| Field Name | Type | Description |
| ------ | -------- | ---------- |
| display | function | display loading box |
| Close | function | Close loading box |

> Example

~~~lua
local loadingBox = getLoadingBox('Loading...')
loadingBox['display']()
gg.sleep(2000)
loadingBox['Close']()
~~~



#### printf

> Print formatted content

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------- |
| format | string | yes | placeholder format |
| vararg | ... | is | |

> Example

~~~lua
printf('Hello, my name is %s', 'rlgg')
~~~



#### newShell

> Create a shell process

| Parameter name | Type | Required | Description |
| :----- | ------- | ---- | --------------------------------------- |
| root | boolean | false | If root == true then use su, otherwise use sh |

| Return value name | Type |
|--------------|-----|
| [shell](#shell) | table |



#### shell

> Created by newShell



##### read

> Read results

| Return value type |
|----------|
| string |



##### write

> Writing cmd asynchronously means that the execution result will not be obtained immediately

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------- |
| cmd | string | is | shell command |



##### cmd

> Synchronously write cmd, wait for the execution result, and return

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------- |
| cmd | string | is | shell command |

| Return value type |
|----------|
| string |



##### exec

> Execute cmd

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------- |
| name | string | yes | command name |
| args | ... | no | arguments |

| Return value type |
|----------|
| string |



##### execFile

> Use cmd to execute binary files

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------------------ |
| path | string | yes | absolute path to binary file |

| Return value type |
|----------|
| string |



##### destroy

> Destroy the shell process



> Example

~~~lua
local shell = newShell(true)
print('cmd', shell.cmd('echo "hello"'))
print('exec', shell.exec('echo', 'hello'))
print('write', shell.write('sleep 1\necho "I slept for 1 second"')) -- Sleep for 1 second, there is no blocking here, because write is asynchronous writing cmd command
gg.sleep(1100)
print('read', shell.read()) -- I sleep for 1 second
print('echo', shell.echo('Supports getting command names directly from the shell as functions to execute')) -- Supports getting command names directly from the shell as functions to execute
~~~



#### checkPkg

> Verify the package name/process. If the package name has been started, it will be automatically selected. Otherwise, a selection box will pop up to select the start process.

| Parameter name | Type | Required | Description |
| :------ | ----- | ---- | -------- |
| pkgList | table | yes | list of package names |

| Return value type | Description |
| ---------- | ---------------- |
| string | Returns the selected package name |

~~~lua
checkPkg({'game package name'})
~~~





#### checkSign

> Verify the modifier signature MD5

| Parameter name | Type | Required | Description |
| :------- | ----- | ---- | ------- |
| signList | table | yes | MD5 list |

| Return value type | Description |
| ---------- | --------------------------------------------------------------- |
| boolean | As long as the modifier signature MD5 matches any one in the parameter MD5 list, it is true, otherwise it is false |



#### checkMD5

> Check modifier MD5

| Parameter name | Type | Required | Description |
| :------ | ----- | ---- | ------- |
| md5List | table | yes | MD5 list |

| Return value type | Description |
| ---------- | --------------------------------------------------------------- |
| boolean | true if the modifier MD5 matches any one in the parameter MD5 list, false otherwise |



#### checkXposed

> If xposed is installed in the operating environment, an error will be reported

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| error | string | No | Error message |



#### callAsyncTask

> Execute asynchronous tasks

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ---------------- |
| func | function | is | background thread execution task |



#### getAbsTime

> Get an absolute timestamp (from the network, not locally)

| Return value type | Description |
| :--------- | ---------------------------------- |
| number | Network timestamp, same format as os.time() |



#### image

> Show image

| Parameter name | Type | Required | Description |
| :--------- | ------ | ---- | ----------------------- |
| src[^src]: | string | yes| |
| _ | _ | No| This parameter is deprecated, just write nil |
| msg | string | no | prompt message |

> Recommend using [gg.image](#ggimage)



#### hashCode

> Get the hashCode of the data

| Parameter name | Type |
| ------ | -------- |
| data | LuaValue |

| Return value type |
|:---------|
| number |



#### setScreenshots

> Disable screen recording

| Parameter name | Type |
|------ |------ |
| bool | boolean |

~~~lua
setScreenshots(true)
~~~



#### 	

> Monitor sound changes

| Parameter Name | Type | Description |
| --------- | -------- | ----------------------------------------------- |
| onReceive | function | android.content.BroadcastReceiver#onReceive |

[View example](https://gitee.com/rlyun/rlgg/blob/master/src/luajava/Listen to sound changes Hide View.lua)



#### setOnExitListener

> Set the script end event
>
> Formerly known as setExitEvent

| Parameter name | Type | Required | Description |
| :------- | -------- | ---- | --------------- |
| callback | function | yes | executed after the script ends |
| name | string | no | event name |

| Return value | Type | Description |
| ------ | -------- | ---------------- |
| remove | function | Remove the event after calling |

~~~lua
setOnExitListener(function()
	gg.alert("Script ended")
    -- Execute code to close/destroy objects to prevent memory leaks
end)
~~~







## Global fields

| Field Name | Type | |
| -------- | ----------------------- | ---- |
| context | android.content.Context | |
| | | |
| | | |



---

---

## Multithreading Description

There are several ways to start multithreading:

Direct Start

~~~lua
local thread = luajava.startThread(function()
	-- Function to be executed
end,'Thread name, message when thread is abnormal','Thread parameters, support all Lua types')
~~~

After getting the thread, call the thread's start method to start the thread

~~~lua
local thread = luajava.getThread(function()
	-- Function to be executed
end)

-- Start the thread. This method does not support parameters.
thread:start()
~~~

Interrupt the thread (terminate)

Just call the interrupt method of the function and execute it

~~~lua
local thread = luajava.startThread(function()
	-- Function to be executed
end)

-- Interrupt the thread
thread:interrupt()
~~~

The started multithreaded programs will terminate with the end of the script and will be automatically recycled.

Including but not limited to voice functions, killing GG, and other asynchronous processing functions are all implemented through multi-threading



Multithreading means instability. It is best to use RLGG 2.0.9 or newer version to use multithreading, which will be more stable.

All View callback functions are UI threads, which cannot perform blocking operations, such as searching memory, requesting the network, etc. At this time, you need to start multiple threads to handle





##luajava



---

#### luajava.bindClass

> Get Class
>
> java.lang.Class#forName(java.lang.String)

| Parameter name | Type | Required | Description |
| :-------- | ------ | ---- | ---- |
| className | string | yes | class name |

| Return value type | Class name |
| -------------------------- | --------------- |
| userdata\|false,error | java.lang.Class |

~~~lua
local Object = luajava.bindClass('java.lang.Object')
local o = Object()
print(o:getClass() == Object) -- true
~~~



#### luajava.newInstance

> Create objects and instantiate them

| Parameter name | Type | Required | Description |
| :-------- | ------ | ---- | -------- |
| className | string | yes | class name |
| vararg | ... | no | constructor parameters |

| Return value type | Class name |
| ---------- | ---------------- |
| userdata | java.lang.Object |

~~~lua
local o = luajava.newInstance('java.lang.Object')
print(o:hashCode())
~~~



#### luajava.new

> Create an object

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | -------- |
| class | userdata | is | class name |
| vararg | ... | no | constructor parameters |

| Return value type | Class name |
| ---------- | ---------------- |
| userdata | java.lang.Object |

~~~lua
local Object = luajava.bindClass('java.lang.Object')
local o = luajava.new(Object)
print(o:getClass() == Object) -- true
~~~



#### luajava.createProxy

> Create Agent

| Parameter name | Type | Required | Description |
| :------------- | ------ | ---- | -------- |
| interfaceName | string | yes | interface class name |
| proxyMethodMap | table | yes | proxy method |

| Return value type |
|----------|
| userdata |



#### luajava.createProxyFromClass

> Create Agent
>
> Since the built-in luajava.createProxy proxy object of luajava can only be a class name, if the class name to be proxied is an external dex, the class cannot be obtained, or other exceptions may occur, so a method that supports proxying with Class as the proxy object is provided.

| Parameter name | Type | Required | Description |
| :------------- | ---------------- | ---- | -------- |
| interfaceClass | userdata | yes | interface class |
| proxyMethodMap | table\| function | is | proxy method |

| Return value type |
|----------|
| userdata |

> For examples, refer to luajava.createProxy, except that the class name is replaced with the obtained Class.
>
> In addition, the proxyMethodMap parameter supports automatic adaptation of the method name that needs to be proxied by function, provided that the interface has only one method



#### luajava.astable

> Array to table

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ---------------------------------------- |
| list | userdata | yes | needs to satisfy java.lang.Class#isArray == true |

| Return value type |
|----------|
| table |



#### luajava.getMethods

> Get object method array

| Parameter name | Type | Required | Description |
| :-------- | ------ | ---- | ---- |
| className | string | yes | class name |

| Return value type |
|----------|
| table |



#### luajava.stringToByte

> String to byte[]

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------ |
| data | string | is | string |

| Return value type | Class name |
|---------- | ---- |
| userdata | [B |



#### luajava.newByte

> Create byte[]

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| length | number | is | length |

| Return value type | Class name |
|---------- | ---- |
| userdata | [B |



#### luajava.numberToJava

> Convert Lua value to Java value

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ----------------------- |
| type | number | yes | Please see the type reference description below |
| data | LuaValue | is | the content to be converted |

> type

| Parameters | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
| -------- | ---- | ---- | ----- | ---- | ---- | ----- | ------ |
| Conversion type | byte | char | short | int | long | float | double |

| Return value type | Description |
| ---------- | --------------- |
| number | Lua value after conversion |



#### luajava.currentThread

> Return to the current thread

| Return value type | Class name |
| ---------- | ---------------- |
| userdata | java.lang.Thread |



#### luajava.isMainThread

> Determine whether the current thread is the main thread

| Return value type |
|----------|
| boolean |



#### luajava.isGGThread

> Determine whether the current thread is the thread of the modifier's running environment

| Return value type |
|----------|
| boolean |



#### luajava.isThread

> Determine whether the current thread is not the main thread (equivalent to a normal thread)
>
> not luajava.isMainThread

| Return value type |
|----------|
| boolean |



#### luajava.getRunnable

> Create a Runnable proxy

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ------- |
| run | function | is | run method |

| Return value type | Class name |
| ---------- | ------------------ |
| userdata | java.lang.Runnable |



#### luajava.getThread

> Create Thread

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ------- |
| run | function | is | run method |
| name | string | no | thread name |

| Return value type | Class name |
| ---------- | ---------------- |
| userdata | java.lang.Thread |

~~~lua
local th = luajava.getThread(function()
	gg.alert('RLGG')
end)

th:start()

~~~



#### luajava.startThread

> Create and execute threads

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ----------------------------------------------- |
| run | function | is | run method |
| name | string | No | Thread name, which can be quickly located when the thread is abnormal |
| vararg | ... | No | Thread parameter, if present, must be written before the previous name parameter |

| Return value type | Class name |
| ---------- | ---------------- |
| userdata | java.lang.Thread |

~~~lua
local thread = luajava.startThread(function(arg1)
	gg.alert(arg1)

end, 'thread name', 'RLGG')
~~~



#### luajava.getLockSupport

> Thread synchronization lock

| Return value | Type | Description |
| ------ | -------- | --------------------------------------------------------------- |
| park | function | After execution, the current thread will enter sleep (blocked) |
| unpark | function | After execution, cancel the effect of park and use the parameter as the return value of park (optional) |

> Example

~~~lua
local park, unpark = luajava.getLockSupport()

local function run()
	-- Thread tasks

	-- Simulate time-consuming tasks
	gg.sleep(100)

	-- Which is output first, 1 or the return value of unpark?
	print(1)

	return unpark(1, 2, 3) -- pass the return value to park
end

local thread = luajava.startThread(run)

print(park())
~~~



#### luajava.getHandler

> Singleton android.os.Handler
>
> Pseudocode: android.os.Handler(android.os.Looper.getMainLooper())

| Return value type | Class name |
| ---------- | ------------------ |
| userdata | android.os.Handler |



#### luajava.postMain

> Synchronously execute luajava.getHandler():post(run)
>
> Can be understood as belonging to the UI (main) thread

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ------- |
| run | function | is | run method |
| vararg | ... | no | |

| Return value | Description |
| ------ | ------------------- |
| | Same return value as pcall |



#### luajava.post

> Use luajava.postMain to execute. If no exception is caught, return the real result, otherwise throw an exception

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ------- |
| run | function | is | run method |
| vararg | ... | no | |

| Return value | Description |
| -------- | --------- |
| LuaValue | return from run |



#### luajava.runOnUiThread

> Run UI thread asynchronously. In fact, it is the same as luajava.postMain. luajava.postMain is synchronous, supports parameters and catches exceptions
>
> Its Looper comes from android.os.Looper.getMainLooper()

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | -------- |
| run | function | is | callback method |



#### luajava.setmetatable

> Set the metatable for objects of type userdata

| Parameter name | Type | Required | Description |
| :-------- | -------- | ---- | ---- |
| object | userdata | yes | |
| metatable | table | is | metatable |

| Return value type | Description |
| ---------- | ------------------- |
| userdata | Returns the parameter object |

> Metatable

[Lua Metatable | Novice Tutorial](https://www.runoob.com/lua/lua-metatables.html "Lua Metatable In Lua table, we can access the corresponding key to get the value, but we cannot operate on two tables (such as adding). Therefore, Lua provides metatables, which allow us to change the behavior of the table. Each behavior is associated with a corresponding metamethod. For example, using metatables, we can define how Lua calculates the addition operation a+b of two tables. When Lua tries to add two tables, it first checks whether one of them has a metatable, and then checks whether...")



> Example

~~~lua
luajava.setmetatable(
	String,
	{
		__index = string,
	}
)

print(String.gsub) -- When String cannot find gsub, it will look for it at the place corresponding to __index, which is string, so the final result is string.gsub
~~~



#### luajava.iteratorValues

> Get all values ​​of iterator

| Parameter name | Type | Required |
| :------- | ------------------ | ---- |
| userdata | java.util.Iterator | Yes |

| Return value name | Type | Description |
| ---------- | ----- | ---- |
| values ​​| table | |



#### luajava.iterator

> Traversing iterators

| Parameter name | Type | Required |
| :------- | ------------------ | ---- |
| userdata | java.util.Iterator | Yes |

| Return value name | Type | Description |
| ---------- | -------- | ------------------------------- |
| next | function | Each execution of next will return the next set of data |

> next

| Return value name | Type | Description |
| ---------- | -------- | ---------- |
| index | number | Index of the data |
| value | LuaValue | data |



#### luajava.list

> Traverse userdata data

| Parameter name | Type | Required |
| :------- | -------------- | ---- |
| userdata | java.util.List | yes |

| Return value name | Type | Description |
| ---------- | -------- | ------------------------------- |
| next | function | Each execution of next will return the next set of data |

> next

| Return value name | Type | Description |
| ---------- | -------- | ---------- |
| index | number | Index of the data |
| value | LuaValue | data |

> Example

~~~lua
for i, package in luajava.list(app.pm:getInstalledPackages(0)) do
	print(i, package.packageName)
end
~~~



#### luajava.array

> Traverse userdata data

| Parameter name | Type | Required |
| :------- | ------------------ | ---- |
| userdata | java.lang.Object[] | Yes |

| Return value name | Type | Description |
| ---------- | -------- | ------------------------------- |
| next | function | Each execution of next will return the next set of data |

> next

| Return value name | Type | Description |
| ---------- | -------- | ---------- |
| index | number | Index of the data |
| value | LuaValue | data |

> Example

~~~lua
local File = luajava.bindClass('java.io.File')
local Array = class.getMethods(File)
for i, method in luajava.array(Array) do
	print(i, method:getName())
end
~~~



#### luajava.ipairs

> Traverse userdata data (combining luajava.array and luajava.list)

| Parameter name | Type | Required |
| :------- | ---------------------------------- | ---- |
| userdata | java.util.List \| java.lang.Object[] | Yes |

| Return value name | Type | Description |
| ---------- | -------- | ------------------------------- |
| next | function | Each execution of next will return the next set of data |

> next

| Return value name | Type | Description |
| ---------- | -------- | ---------- |
| index | number | Index of the data |
| value | LuaValue | data |

> Example

~~~lua
local File = luajava.bindClass('java.io.File')
local Array = class.getMethods(File)
for i, method in luajava.ipairs(Array) do
	print(i, method:getName())
end
~~~



#### luajava.instanceOf

> Determine whether the data is of a certain type

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ------ |
| data | userdata | yes | |
| Class | userdata | is | target class |

| Return value type |
|----------|
| boolean |

> Example

~~~lua
local f = luajava.newInstance('java.io.File', gg.getFile())
print(luajava.instanceOf(f, luajava.bindClass('java.io.File')))
--true

local o = luajava.newInstance('java.lang.Object')
print(luajava.instanceOf(o, luajava.bindClass('java.io.File')))
--false
~~~



#### luajava.download

> Downloader with progress bar

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------- |
| url | string | yes | resource to download |
| path | string | yes | Download save path |
| msg | string | no | prompt message |

| Return value type |
| ---------------- |
| boolean, [error] |

> Example

~~~lua
local url = 'https://downv6.qq.com/qqweb/QQ_1/android_apk/Android_8.9.71_64.apk'
local path = gg.EXT_STORAGE .. url:match('/[^/]+$')
local msg = 'Downloading QQ, please wait...' .. '\n' .. path
local ok, err = luajava.download(url, path, msg)
if not ok then
	error('Download failed:' .. err)
end
~~~



#### luajava.setInterface

> Set the interface method (the method parameter is the interface)

| Parameter name | Type | Required | Description |
| :--------- | --------------- | ---- | ---------------- |
| obj | userdata | is | java object |
| methodName | string | yes | method name |
| Override | function\|table | is | the callback function after proxy |

> Example

~~~lua
button = Button(context)
luajava.setInterface(button, 'setOnClickListener', function(view)
	-- This function is the proxy of android.view.View$OnClickListener#onClick
end)
~~~

Equivalent to

~~~lua
button = Button(context)
button:setOnClickListener(luajava.createProxy('android.view.View$OnClickListener', {
	onClick = function(view)
		-- This function is the proxy of android.view.View$OnClickListener#onClick
	end
}))
~~~



Starting from version 2.0.9, the table|function parameter can automatically implement the interface

If the interface has multiple methods, a table is required. If it has only one method, a function can be used directly.

~~~lua
button = Button(context)
button:setOnClickListener(function(view)
	-- This function is the proxy of android.view.View$OnClickListener#onClick
end)

button:setOnClickListener({
	onClick = function(view)
		-- This function is the proxy of android.view.View.OnClickListener.onClick
	end
})

~~~



#### luajava.callMethod

> Calling Java object methods

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | ---------- |
| obj | userdata | is | java object |
| methodName | string | yes | method name |
| vararg | ... | no | passed arguments |

~~~lua
obj = Object()
print(luajava.callMethod(obj, 'hashCode'))
~~~



#### luajava.callStaticMethod

> Calling Java object static methods

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | ---------- |
| class | userdata | is | java class |
| methodName | string | yes | method name |
| vararg | ... | no | passed arguments |

~~~lua
Math = luajava.bindClass('java.lang.Math')
print(luajava.callStaticMethod(Math, 'random'))
~~~



#### luajava.getObjectField

> Get object fields

| Parameter name | Type | Required | Description |
| :-------- | -------- | ---- | -------- |
| obj | userdata | is | java object |
| fieldName | string | yes | field name |

| Failure return value type |
|--------------|
| nil, error |



#### luajava.getStaticObjectField

> Get Class static fields

| Parameter name | Type | Required | Description |
| :-------- | -------- | ---- | -------- |
| obj | userdata | is | java object |
| fieldName | string | yes | field name |

~~~lua
Math = luajava.bindClass('java.lang.Math')
print(luajava.getStaticObjectField(Math, 'PI'))
~~~

| Failure return value type |
|--------------|
| nil, error |



#### luajava.setObjectField

> Set object fields

| Parameter name | Type | Required | Description |
| :-------- | -------- | ---- | -------- |
| obj | userdata | is | java object |
| fieldName | string | yes | field name |
| value | LuaValue | is | |

| Return value type |
|----------|
| boolean |



#### luajava.setStaticObjectField

> Set the Class static field

| Parameter name | Type | Required | Description |
| :-------- | -------- | ---- | -------- |
| obj | userdata | is | java object |
| fieldName | string | yes | field name |
| value | LuaValue | is | |

~~~lua

~~~

| Return value type |
|----------|
| boolean |



#### luajava.webView

> Create android.webkit.WebView and execute RLGG function

| Parameter name | Type | Required | Description |
| :------- | -------- | ---- | ---- |
| onCreate | function | no | |

| Return value type |
|-----------------------|
| android.webkit.WebView |

The onCreate parameter is the callback function after the WebView is created. Callback parameter 1 is the created WebView, which belongs to the UI thread and completes some initialization work.

When the main thread ends, the webView is automatically destroyed

[rlgg-js interactive example.lua](https://gitee.com/rlyun/rlgg/blob/master/demo/luajava/rlgg-js interactive example.lua)





---



#### Layout related

##### luajava.loadlayout

> Load Layout

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | -------- |
| info | table | yes | layout information |
| env | table | no | environment |
| group | userdata | no | parent container |

>Layout Information

| Field Name | Type | Required | Description |
| ----------- | -------- | ---- | ----------------------------------------------------- |
| 1 | userdata | is | the class of the layout |
| 2 | table | No | Indexes that can be traversed by ipairs. Except 1, the others are layout information of child controls. |
| Other key fields | LuaValue | No | Same as xml control |



| Return value type | Class name | Description |
| ---------- | ----------------------- | ------------------ |
| userdata | Determined by parameter info[1] | cannot be setmetatable |

> Example

~~~lua
local view = luajava.loadlayout({
	LinearLayout,
	orientation = 'vertical',
	{
		Button,
		text = 'I am button 1',
		onClick = function()
			gg.toast('Button 1 was clicked')
		end
	},
	{
		Button,
		id = luajava.newId('I am button 2'),
		text = 'I am button 2',
	}
})

-- view = android.widget.LinearLayout

local button2 = luajava.getIdView('I am button 2')
-- Both getIdView and getIdValue support SET command to set properties, getIdView is more recommended (please refer to luajava.setmetatable)
button2.onClick = function()
	gg.toast('Button 2 was clicked')
end
~~~



##### luajava.newId

> Get an id starting from 0x8f000000

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| ID Name | string | yes |

| Return value type |
|----------|
| number |



##### luajava.getId

> Get the id created by newId

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ----------------------------------------------- |
| ID name | string | Yes | Must be created by [luajava.newId][#luajavanewId] |

| Return value type |
|----------|
| number |



##### luajava.getIdValue

> Get the value corresponding to id

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ----------------------------------------------- |
| ID name | string | Yes | Must be created by [luajava.newId][#luajavanewId] |

| Return value type | Description |
| ---------- | --------------------------------------------------------------- |
| table | When userdata was first designed, it did not support direct metatable operations, so table was used instead |



##### luajava.getIdView

> Get the component corresponding to the id

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ----------------------------------------------- |
| ID name | string | Yes | Must be created by [luajava.newId][#luajavanewId] |

| Return value type | Class name |
| ---------- | ------------------ |
| userdata | android.view.View |



##### luajava.getBitmapDrawable

> Load local or online image resources, online resources will be cached locally

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------------------------------------------------- |
| path | string | yes | local or online image resource, local requires absolute path, online requires url link |

| Return value type | Class name |
| ---------- | ---------------------------------------- |
| userdata | android.graphics.drawable.BitmapDrawable |



##### luajava.getDrawable

> Load local or online image resources, online resources will be cached locally

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------------------------------------------------- |
| path | string | yes | local or online image resource, local requires absolute path, online requires url link |

| Return value type | Class name |
| ---------- | ---------------------------------- |
| userdata | android.graphics.drawable.Drawable |



##### luajava.getBitmap

> Load local or online image resources, online resources will be cached locally

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------------------------------------------------- |
| path | string | yes | local or online image resource, local requires absolute path, online requires url link |

| Return value type | Class name |
| ---------- | ----------------------- |
| userdata | android.graphics.Bitmap |



##### luajava.getResBitmap

> Get Bitmap from app/Res

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------ |
| id | number | yes | resource ID |

| Return value type | Class name |
| ---------- | ----------------------- |
| userdata | android.graphics.Bitmap |



##### luajava.getResDrawable

> Get Drawable from app/Res

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------ |
| id | number | yes | resource ID |

| Return value type | Class name |
| ---------- | ---------------------------------------- |
| userdata | android.graphics.drawable.BitmapDrawable |



##### luajava.getFloatingWindow

> Get the View of the floating window icon

| Return value type | Class name |
| ---------- | ----------------------- |
| userdata | android.graphics.Bitmap |



##### luajava.setFloatingWindowAttr

> Set the properties of the floating window icon View

| Parameter name | Type | Required | Description |
| :----- | ----- | ---- | ---- |
| attr | table | is | |



##### luajava.setFloatingWindowHide

> Set the floating window icon to hide

| Parameter name | Type | Required | Description |
| :----- | ------- | ---- | -------- |
| isHide | boolean | yes | whether to hide |



##### luajava.newToast

> Create Toast

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------------------ |
| text | string | is | |
| length | number | yes | length of display time 1\|0 |

| Return value type | Class name |
| ---------- | ------------------ |
| userdata | android.widget.Toast |



##### luajava.showToast

> Display Toast

| Parameter name | Type | Required | Description |
| :----- | -------------------- | ---- | ---- |
| Toast | android.widget.Toast | Yes | |



##### luajava.toast

> Same as gg.toast, but returns Toast

| Parameter Name | Type | Required | Default | Description |
| :----- | ------- | ---- | ----- | ---------- |
| text | string | is| | |
| fast | boolean | no | false | fast mode? |

| Return value type | Class name |
| ---------- | ------------------ |
| userdata | android.widget.Toast |



##### luajava.showViewToast

> Display View to Toast

| Parameter name | Type | Required | Description |
| :----- | ----------------- | ---- | ---- |
| view | android.view.View | Yes | |

| Return value type | Class name |
| ---------- | ------------------ |
| userdata | android.widget.Toast |



##### luajava.layoutToast

> A combination of luajava.loadlayout and luajava.showViewToast

| Parameter name | Type | Required | Description |
| :----- | ----- | ---- | ---- |
| layout | table | yes | |

| Return value type | Class name |
| ---------- | ------------------ |
| userdata | android.widget.Toast |



##### luajava.newAlert

> Create Alert

| Return value type | Class name |
| ---------- | ------------------------------- |
| userdata | android.app.AlertDialog$Builder |



##### luajava.showAlert

> Show Alert

| Parameter name | Type | Required | Description |
| :----- | ----------------------- | ---- | ---- |
| Alert | android.app.AlertDialog | Yes | |



##### luajava.showViewAlert

> Display View to Alert

| Parameter name | Type | Required | Description |
| :----- | ----------------- | ---- | ---- |
| view | android.view.View | Yes | |



##### luajava.layoutAlert

> A combination of luajava.loadlayout and luajava.showViewAlert

| Parameter name | Type | Required | Description |
| :----- | ----- | ---- | ---- |
| layout | table | yes | |



##### luajava.getViewPagerMagicIndicator

> Bottom navigation, pagination layout

| Parameter name | Type | Required | Description |
| :------ | ----- | ---- | ---------- |
| layouts | table | yes | list of layouts |



> layouts

| Interface method name | Parameter name | Parameter type | Description | Return value type |
| --------------- | -------- | -------- | ------------ | ---------------------------------- |
| getIconDrawable | index | number | Returns the icon resource | android.graphics.drawable.Drawable |
| getTitleView | index | number | Returns title | string |

[See example](https://gitee.com/rlyun/rlgg/blob/master/src/luajava/luajava.getViewPagerMagicIndicator.lua)





##gg

[**Native function** portal](http://gg.rlyun.top/help/classgg.html "Native function")



#### gg.setIcon

> Set GG floating window icon

| Parameter name | Type | Required | Description |
| :----- | -------------- | ---- | ------------- |
| src | string\|number | yes | local file or URL |

[View source code](src/gg/gg.setIcon.lua)



#### gg.getRangesListX

> getRangesListX is an upgraded version of getRangesList

| Parameter name | Type | Required | Description |
| :-------- | ------------------- | ---- | ---- |
| matchInfo | nil\|number\|string | no| |

> matchInfo

| When matchInfo type is equal to | Handle the event |
| ----------------------- | --------------------------------------- |
| nil | Returns the entire memory list |
| number | Returns a list of memory address ranges that match matchInfo |
| table | Filter based on memory information fields |

#### Memory Information

> Memory information is of table type

| Field Name | Type | Description |
| -------------------------- | ------ | -------------------------- |
| internalName | string | The internal name of the memory |
| name | string | the name of the memory |
| start | number | starting address of memory |
| end | number | end address of memory |
| state | string | Memory state type {A, Ca, Xa, etc.} |
| type | string | Memory permission type, read and write |

The filtering method uses equal or LUA regular matching.

> Example

~~~lua
-- Returns all memory whose state type matches Xa
local matchInfo = {
    state = 'Xa',
}
local list = gg.getRangesListX(matchInfo)


-- Returns all memory whose status type matches Xa and whose name ends with so
local matchInfo = {
    state = 'Xa',
    internalName = '.*so$',
}
local list = gg.getRangesListX(matchInfo)


-- Returns a status type equal to A
local matchInfo = {
    state = '^A$', -- If you write A directly, it may match As
    limit = 1, -- limit the number to 1
}
local list = gg.getRangesListX(matchInfo)

~~~



#### gg.getRangesInfo

> Get a [memory information](#memory information)

| Parameter name | Type | Required | Description |
| :-------- | ------------------- | ---- | ---- |
| matchInfo | nil\|number\|string | no| |

> Example

~~~lua
-- Returns a memory information with status type equal to A
local matchInfo = {
    state = '^A$', -- If you write A directly, it may match As
}
local RangesInfo = gg.getRangesInfo(matchInfo)
~~~





#### gg.playMusic

> Play Music

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------------------------------------------------------- |
| path | string | yes | Local resources are absolute paths, online resources are URL links, if path=stop, it will be paused |



#### gg.playVideo

> Play Video

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------------------------------------------------------- |
| path | string | yes | Local resources are absolute paths, online resources are URL links, if path=stop, it will be paused |



#### gg.command

> Execute command

[Linux Command Manual]("https://m.runoob.com/linux/linux-command-manual.html")



| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| cmd | string | is | command |

| Return value type |
|----------|
| string |

> Example

~~~lua
print(gg.command('ls'))
~~~



#### gg.isVPN

> Whether the current device uses VPN (network proxy)

| Return value type |
|----------|
| boolean |

> Example

~~~lua
if gg.isVPN() then
	gg.alert('Please turn off the network proxy!')
	os.exit()
    return
end
~~~



#### gg.getProcess

> Get the running process

| Return value type | Description |
| ---------- | :--------------------------------------------- |
| table | Starting from 0, each element contains 2 fields cmdLine and process |



#### gg.setProcess

> Set the current selection process

| Parameter name | Type | Required | Description |
| :------ | -------------- | ---- | ---------------- |
| cmdline | number, string | yes | index or process name |



#### gg.getConfig

> Get the configuration of the modifier

| Parameter name | Type | Required | Description |
| :----- | -------------- | ---- | -------------- |
| id | number, string | no | id or configuration name |

| Return value type | Description |
|------------- |------------------------------------------------------------- |
| table, string | If id does not exist, return all configurations of table type, otherwise return the configuration corresponding to id |



#### gg.setConfig

> Set the configuration of the modifier

| Parameter name | Type | Required | Description |
| :----- | -------------- | ---- | -------------- |
| id | number, string | yes | id or configuration name |
| value | LuaValue | is | |

> Example

~~~lua
gg.setConfig("Hide auxiliary", 14)
gg.setConfig("Run Guardian", 3)
gg.setConfig("freeze interval", 33000)
gg.setConfig("Bypass mode", 0)

~~~



#### gg.setProcessX

> The process selection box pops up



#### gg.exit

> Exit/Restart

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------------------------------- |
| mode | string | no | If mode=re, restart, otherwise exit |



#### gg.arsc

> Read resources.arsc resource value

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------ |
| id | number | yes | resource id |

| Return value type |
|----------|
| string |



#### gg.killGG

> Kill other GG modifiers



#### gg.loopKillGG

> Cycle to kill other GG modifiers

| Parameter Name | Type | Required | Default | Description |
| :-------- | ------ | ---- | ---- | -------------------------- |
| Intervals | number | No | 5000 | The interval in milliseconds between executing killGG |

~~~lua
-- Just add it to the first line of the script, and you can kill other GGs while the script is running
gg.loopKillGG()
~~~



#### gg.checkVpn

> Verify whether the current device is a network proxy, if so, report an error



#### gg.loopCheckVpn

> Loop checkVpn

| Parameter Name | Type | Required | Default | Description |
| :-------- | ------ | ---- | ---- | ---------------------------- |
| Intervals | number | No | 2000 | The interval in milliseconds between executing checkVpn |



#### gg.getClipboard

> Get the contents of the clipboard

| Return value type |
|----------|
| string |



#### gg.getWindowOrientation

> Get window direction

| Return value type | Description |
| ---------- | ------------------ |
| number | 0 = portrait, others = landscape |



#### gg.getScriptDir

> Get the running working directory

| Return value type |
|----------|
| string |



#### gg.getSignatures

> Get the signature hash value of GG

| Return value type |
|----------|
| number |



#### gg.newAlert

> Use [luajava.newAlert](#luajavanewAlert) to create and initialize its properties

| Parameter name | Type | Required |
| :----- | ----------- | ---- |
| title | string\|nil | yes |
| message | string | yes |

| Return value type |
| ---------------------------------- |
| android.app.AlertDialog$Builder |



#### gg.showAlert

> gg.showAlert displays Alert in the same way as [gg.alert](#ggalert), which is different from [luajava.showAlert](#luajavashowAlert), which does not block

| Parameter name | Type | Required |
| :---------- | ----------------------- | ---- |
| AlertDialog | android.app.AlertDialog | Yes |
| button | ... | no |

| Return value type | Description |
| ---------- | ---------------------------------- |
| number | Return value is the same as [gg.alert](#ggalert) |



#### gg.htmlAlert

> Alert displayed in HTML format

| Parameter Name | Type | Required | Default |
| :------- | ------ | ---- | ---- |
| title | html | no | |
| info | html | yes | |
| positive button | string | no | ok |
| negative button | string | no | |
| neutral button | string | no | |

| Return value type | Description |
| ---------- | --------------------------------------------- |
| number | The return value is the same as [gg.showAlert](#ggshowAlert) |



#### gg.alert2

> Custom title alert

| Parameter Name | Type | Required | Default |
| :------- | ------ | ---- | ---- |
| Title | string | No | |
| message | string | yes | |
| positive button | string | no | ok |
| negative button | string | no | |
| neutral button | string | no | |

| Return value type | Description |
| ---------- | --------------------------------------------- |
| number | The return value is the same as [gg.showAlert](#ggshowAlert) |



#### gg.diyToast

> Custom color toast

| Parameter name | Type | Required | Description |
| :-------------- | ------ | ---- | --------------- |
| text | string | is | the text to display |
| textColor | number | No | Numeric value of the text color |
| backgroundColor | number | No | Background color value |



#### gg.colorToast

> Custom color toast

| Parameter Name | Type | Required | Default | Description |
| :----- | ------ | ---- | ---- | -------------------------- |
| html | string | yes| | the text to display |
| length | number | No | 0 | The length of the displayed time 0=short, 1=long |



#### gg.image

> Show image

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------------------- |
| src | string | yes | src can be a cloud resource or a local file |
| msg | string | no | prompt message |



#### gg.searchChoice

> Search prompt box

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| items | table | is | |
| title | string | no| |

| Return value type | Description |
| ---------- | ---------------------------- |
| table\|nil | Return value is the same as gg.multiChoice |

~~~lua
gg.searchChoice({'11','22','33'},'Title')
~~~





------



> The following method is only for compatibility with third-party GG functions
>
> It is recommended to use the real method directly instead of the compatible one





#### gg.intent

Please refer to [app.intent](#appintent)



#### gg.downloadFile

Please refer to [file.download](#filedownload)



#### gg.jumpAPP

Please refer to [app.start](#appstart)



#### gg.appPath

Please refer to [app.getPath](#appgetPath)



#### gg.isHTTPdump

Please refer to [gg.isVPN](#ggisVPN)



#### gg.go URL

Please refer to [app.openUrl](#appopenUrl)



#### gg.colorAlert

Please refer to [gg.htmlAlert](#gghtmlalert)



#### gg.alertX

Please refer to [gg.htmlAlert](#gghtmlalert)





---

---



## json



### json.decode

> Parsing json string

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| data | string | yes | json string |

| Return value type |
|----------|
| table |

The starting index of the parsed array in the table is 0, and the traversal needs to start from 0

~~~lua
data = '["a","b","c"]'
t = json.decode(data)
print(t)

for i = 0, #t do
	local v = t[i]
	print(v)
end

~~~



### json.encode

> Encode json

| Parameter name | Type | Required | Description |
| :----- | ----- | ---- | ------------ |
| json | table | yes | parsed json |

| Return value type |
|----------|
| string |

When converting table to json, the initial index of the array must be 0

---

---



## base64



### base64.decode

> Parsing base64 string

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| data | string | is | base64 string |

| Return value type |
|----------|
| string |



### base64.encode

> Base64 encode the string

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| data | string | yes | |

| Return value type |
|----------|
| string |



---

---



## timers



### timers.setInterval

> Cycle Timer

| Parameter name | Type | Required | Description |
| :-------- | -------- | ---- | ---------------------------- |
| callback | function | is | task function |
| Intervals | number | yes | The interval between executing the task function (in milliseconds) |

| Return value name | Type | Description |
| ---------- | ------ | --------------------------------------------------------------- |
| id | number | You can use [timers.clearInterval](###timers.clearInterval) to turn off the timer |



### timers.clearInterval

> Clear loop timer

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------------------------------------------------------- |
| id | number | is | the id created by [timers.setInterval](#timerssetInterval) |



### timers.setTimeout

> One-shot timer, destroyed after triggering

| Parameter name | Type | Required | Description |
| :-------- | -------- | ---- | ---------------------------- |
| callback | function | is | task function |
| Intervals | number | yes | The interval between executing the task function (in milliseconds) |

| Return value name | Type | Description |
| ---------- | ------ | --------------------------------------------------------------- |
| id | number | You can use [timers.clearTimeout](#timersclearTimeout) to turn off the timer |



### timers.clearTimeout

> Clear one-shot timer

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------------------------------------------------- |
| id | number | is | the id created by [timers.setTimeout](#timerssetTimeout) |



---

---



## storages



### storages.create

> Create local storage

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------------------- |
| name | string | yes | Use name to distinguish different storage files |

| Return value name | Type | Description |
| ---------- | ----- | -------------------------- |
| storage | table | reference [storage](#storage) |



### storages.remove

> Delete local storage

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------------------------------------------------------- |
| name | string | yes | Delete local storage files created by [storages.create](#storagescreate) |



---

---



### storage

>storage is a class library created by storages.create



#### storage.get

> Get data

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | -------------------------- |
| key | LuaValue | yes | Get the data saved by storage.put |

| Return value type |
|----------|
| LuaValue |



#### storage.put

> Save data

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ----------------------------------------------------- |
| key | LuaValue | Yes | Data name, after saving, the data can be obtained through storage.get |
| value | LuaValue | No | If value does not exist, the data of the key will be deleted |



#### storage.save

> Write out the storage file, usually put in the first-level key is automatically saved



#### storage.remove

> Delete data

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ----------------------- |
| key | LuaValue | yes | delete the data saved by storage.put |



#### storage.remove

> Delete data

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ----------------------- |
| key | LuaValue | yes | delete the data saved by storage.put |



#### storage.contains

> Does the data exist?

| Parameter name | Type | Required |
| :----- | -------- | ---- |
| key | LuaValue | yes |

| Return value type | Description |
| ---------- | ----------------------- |
| boolean | storage.get(key) ~= nil |



#### storage.clear

> Delete the entire configuration file



#### storage.enKey

> After using encryption, the key written to the local configuration file is encrypted

| Parameter name | Type | Required | Description |
| :----- | ------- | ---- | ------------------------------- |
| mode | boolean | yes | true=use encryption, false=do not use encryption |

---

---



## assets



### assets.read

> Read data

| Parameter name | Type | Required | Description |
| :------- | ------ | ---- | ------------ |
| filename | string | yes | assets file name |

| Return value type | Description |
| ---------- | ---------------------------- |
| string | If filename does not exist, an error will be reported |

> Example

~~~lua
-- For example, under apk/assets/ there is a file called rlgg.lua
--apk/assets/rlgg.lua
-- Then the way to read this file is
local data = assets.read('rlgg.lua')


-- For example, in the apk/assets/secondary directory/ there is a file called rlgg.lua
--apk/assets/secondary directory/rlgg.lua
-- Then the way to read this file is
local data = assets.read('/secondary directory/rlgg.lua')
~~~



### assets.write

> Read data and write it locally

| Parameter name | Type | Required | Description |
| :------- | ------ | ---- | ---------------------------------------------------------- |
| filename | string | yes | assets file name |
| path | string | yes | Write out the absolute path of the file or directory. If it is a directory, the absolute path is directory/filename |

| Return value type | Description |
| ---------- | ------------------ |
| string | Write out the absolute path to the file |

~~~lua
-- Write apk/assets/shell/test.sh to /sdcard/test.sh
assets.write('/shell/test.sh','/sdcard/')

-- Write to /sdcard/1.sh
assets.write('/shell/test.sh','/sdcard/1.sh')
~~~



### assets.toPath

> Read data and write it locally

| Parameter name | Type | Required | Description |
| :------- | ------ | ---- | ------------ |
| filename | string | yes | assets file name |

| Return value type | Description |
| ---------- | ------------------ |
| string | Write out the absolute path to the file |



### assets.exec

> Execute binary file

| Parameter name | Type | Required | Description |
| :------- | ------ | ---- | ------------ |
| filename | string | yes | assets file name |

| Return value type | Description |
| ---------- | -------------------------------------------------- |
| string | shell.execFile Shell library comes here [newShell](#newshell) |

> Execute the executable file with root privileges

~~~lua
assets.exec('/shell/test.sh')
~~~



### assets.lua

> Execute lua file

| Parameter name | Type | Required | Description |
| :------- | ------ | ---- | ------------ |
| filename | string | yes | assets file name |
| vararg | ... | no | pass in arguments |

| Return value type | Description |
|----------|--------|
| LuaValue | Execution result |

> You can put offline scripts into apk/assets/ and then execute them using assets.lua

~~~lua
assets.lua('built-in lua script')
~~~





---

---



## coroutine

[Lua coroutine | Novice tutorial](https://www.runoob.com/lua/lua-coroutine.html)



## string

> The string library inherits java.lang.String

[Lua strings | Novice tutorial](https://www.runoob.com/lua/lua-strings.html)



### Digital Signature



#### string.md

> Information Summary

| Parameter name | Type | Required | Description |
| :-------- | ------ | ---- | ---------- |
| data | string | yes | signed data |
| algorithm | string | is | algorithm |

| Return value type | Case | Description |
| ---------- | ------ | -------- |
| string | large | digital signature |



#### string.md5

> md5 signature

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| data | string | yes | signed data |

| Return value type | Case | Length | Principle |
| ---------- | ------ | ---- | ----------------------- |
| string | large | 32 | string.md(data, 'md5') |

> Example

~~~lua
string.md5('rlgg') --> E95E84AA6CFC78268301FB36CF389446
~~~



#### string.md5l

> md5 signature - lowercase

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| data | string | yes | signed data |

| Return value type | Case | Length | Principle |
| ---------- | ------ | ---- | ----------------------- |
| string | small | 32 | string.md5(data):lower() |

> Example

~~~lua
string.md5l('rlgg') --> e95e84aa6cfc78268301fb36cf389446
~~~

 

#### string.sha1

> sha1 signature

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| data | string | yes | signed data |

| Return value type | Case | Length | Principle |
| ---------- | ------ | ---- | ----------------------- |
| string | large | 40 | string.md(data, 'sha1') |

> Example

~~~lua
string.sha1('rlgg') --> 24F3202052781064A25E5F8BCC00C748BBE4B1B2
~~~



#### string.sha256

> sha256 signature

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| data | string | yes | signed data |

| Return value type | Case | Length | Principle |
| ---------- | ------ | ---- | ----------------------- |
| string | large | 64 | string.md(data, 'sha256') |

> Example

~~~lua
string.sha1('rlgg') --> 23D4561B95B6D58D1ACC1919F5CFCB780FBED3E8ED0973D7A0BDE22DEE4BCEC0
~~~



### Encoding/Decoding



#### string.zip

> String Compression

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |

| Return value type |
|----------|
| string |



#### string.unzip

> String decompression

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------------------------------------------------- |
| data | string | is | decompressed string compressed by [string.zip](####string.zip) |

| Return value type |
|----------|
| string |



#### string.bin2hex

> Convert string to hexadecimal

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| data | string | yes | |

| Return value type | Case |
|----------|------|
| string | large |

>Example

~~~lua
string.bin2hex('rlgg') --> 726C6767
~~~



#### string.hex2bin

> Hexadecimal to plain text

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| data | string | yes | |

| Return value type |
|----------|
| string |



#### string.xor

> XOR encryption

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ----------------------------------------------- |
| data | string | yes | If data is xor encrypted, then encrypting it again is decryption |
| key | string | yes | key |

| Return value type |
|----------|
| string |



#### string.rc4

> rc4 encryption

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ----------------------------------------------- |
| data | string | yes | If data is rc4 encrypted, then encrypting it again is decryption |
| key | string | yes | key |

| Return value type |
|----------|
| string |



#### string.base64

> base64 encoding

| Parameter Name | Type | Required | Default |
| :----- | ------ | ---- | ---- |
| mode | string | no | en |

| Return value type | |
| ---------- | --------------------------------------------------------------- |
| string | If mode == 'de' then call [base64.decode](#base64decode) else call [base64.encode](#base64encode) |



#### string.enUrl

> Encode URL

| Parameter name | Type | Required |
| :--------- | ------ | ---- |
| [url][URL] | string | yes |

| Return value type |
|----------|
| string |



#### string.deUrl

> Decode URL

| Parameter name | Type | Required | Description |
| :--------- | ------ | ---- | ----------- |
| [url][URL] | string | is | the encoded URL |

| Return value type |
|----------|
| string |



#### string.url

> URL encoding or decoding

| Parameter Name | Type | Required | Default | Description |
| :--------- | ------ | ---- | ---- | ----------------------------------- |
| [url][URL] | string | yes| | Encoded URL |
| mode | string | no | en | if mode == 'de' then decode else encode |

| Return value type |
|----------|
| string |



#### string.urlCode

> Same as url, purpose is to be compatible with other GG

| Return value type |
|----------|
| string |



#### string.chars

> table to string

| Parameter name | Type | Required | Description |
| :----- | ----- | ---- | ----------------------------------- |
| bytes | table | yes | see [string.bytes](#stringbytes) |

| Return value type | Principle |
| ---------- | -------------------------------- |
| string | string.char(table.unpack(bytes)) |



#### string.bytes

> Convert string to table

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |

| Return value type | Principle |
| ---------- | -------------------------- |
| table | {string.byte(data, 1, -1)} |



#### string.toHex

> Convert to hexadecimal \\x..

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |

| Return value type |
|----------|
| string |

> Example

~~~lua
string.toHex('rlgg') --> \x72\x6C\x67\x67
~~~



------





### string.startsWith

> Matches text headers

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |
| prefix | string | yes |

| Return value type |
|----------|
| boolean |

> Example

~~~lua
local url = 'http://127.0.0.1'
if not string.startsWith(url, 'http') then
	return false, 'url is invalid'
end

~~~



### string.endsWith

> matches the end of the text

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |
| prefix | string | yes |

| Return value type |
|----------|
| boolean |

> Example

~~~lua
local path = '/sdcard/rlgg.lua'
if not string.endsWith(path, 'lua') then
	return false, 'You did not enter a Lua file'
end

~~~



### string.split

> Split string

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |
| regex | string | yes |
| limit | number | no |

| Return value type |
|----------|
| table |

> Example

~~~lua
string.split('a,b,c,d,e,f,g', ',')
--[[ result
{
	[1] = 'a',
	[2] = 'b',
	[3] = 'c',
	[4] = 'd',
	[5] = 'e',
	[6] = 'f',
	[7] = 'g',
}
]]
~~~



### string.replace

> Replace string

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| data | string | yes |
| target | string | yes |
| replacement | string | yes |

| Return value type |
|----------|
| string |

> Example

~~~lua
string.replace('I am xxxx','xxxx','rlgg') --> I am rlgg
~~~



### string.replaceAll

> Java regular replacement string

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| data | string | yes |
| target | string | yes |
| replacement | string | yes |

| Return value type |
|----------|
| string |

> Example

~~~lua
string.replaceAll('I am xxxx','x+','rlgg') --> I am rlgg
~~~



### string.trim

> Remove leading and trailing spaces

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |

| Return value type |
|----------|
| string |



### string.ltrim

> Delete the left space

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |

| Return value type |
|----------|
| string |



### string.rtrim

> Delete right space

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |

| Return value type |
|----------|
| string |



### string.append

> String Append

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| data | string | yes |
| args | ... | yes |

| Return value type |
|----------|
| string |



### string.random

> Random string

| Parameter Name | Type | Required | Default | Description |
| :----- | ------ | ---- | ---- | ------------ |
| len | number | no | 1 | string length |
| min | number | no | 0 | minimum char range |
| max | number | no | 255 | maximum char range |

| Return value type |
|----------|
| string |



### string.randomUUID

> Random UUID

| Parameter name | Type | Required | Description |
| :----- | ------- | ---- | ----------------------- |
| mode | boolean | no | replace - empty if mode == true |

| Return value type |
|----------|
| string |



### string.UID

> Random UUID

| Return value type | Principle |
| ---------- | ----------------------- |
| string | string.randomUUID(true) |



### string.tonumber

> Convert string to value

| Parameter name | Type | Required | Description |
| :------ | ------ | ---- | -------------------------- |
| data | string | yes | |
| default | | no | If conversion fails, return default |

| Return value type |
| ----------------- |
| number \| default |



### string.randomMD5

> Random MD5

| Return value type |
|----------|
| string |



### string.equal

> You can abbreviate eq to check whether two strings are equal, ignoring case

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| self | string | is |
| target | string | yes |

| Return value type |
|----------|
| boolean |



### string.toMusic

> String to Speech

| Parameter name | Type | Required | Description |
| :----- | ------- | ---- | -------------------------- |
| text | string | yes | voice text |
| sync | boolean | no | Whether to play synchronously (default is asynchronous) |

~~~lua
string.toMusic("Welcome to RLGG", true)
~~~





### string.subsum

> Count the number of substrings

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| data | string | yes | main string |
| sub | string | is | substring |

| Return value type |
|----------|
| number |



### string.hashCode

> Get string hashCode

| Parameter name | Type |
| :----- | ------ |
| data | string |

| Return value type |
|----------|
| number |



### string.crc32

> Get the crc32 of the string

| Parameter name | Type |
| :----- | ------ |
| data | string |

| Return value type |
|----------|
| number |





## http

>What is HTTP?
>The Hypertext Transfer Protocol (HTTP) is designed to ensure communication between clients and servers.
>
>HTTP works as a request-response protocol between a client and a server.
>
>A web browser might be the client, and a web application on your computer might be the server.
>
>For example: The client (browser) submits an HTTP request to the server; the server returns a response to the client. The response contains information about the status of the request and possible content that was requested.





> callback

| Variable Name | Type | Description |
| -------- | -------- | --------------------------------------------------------------- |
| callback | function | If the data exists, use thread asynchronous request, and pass the result as the first parameter to callback after the request is completed |



### http.arg2data

> Parameter transfer submission data

| Parameter name | Type |
| :----- | ----- |
| arg | table |

| Return value type |
|----------|
| string |

> Example

~~~lua
http.arg2data({a=1,b=2})-- a=1&b=2
~~~



### http.get

> Submit a get request

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | -------- |
| [url][URL] | string | yes| |
| headers | table | no | request headers |
| callback | function | no | asynchronous callback |

| Return value type | Description |
| ----------------------- | ----------------------------------------------- |
| table\|java.lang.Thread | If callback parameter is present, the thread of the asynchronous request is returned |

> Example

~~~lua
for i = 1, 100 do
	local function callback(result)
		if not result then
			return
		end
		printf('The result of the %sth request is %s', i, result.code)
	end

	local asynThread = http.get('https://www.baidu.com/', nil, callback)
	asynThread:join(10) -- wait 10 milliseconds
end

gg.sleep(100)
~~~



### http.post

> Submit a post request

| Parameter name | Type | Required | Description |
| :--------- | ------------- | ---- | ---------- |
| [url][URL] | string | yes| |
| headers | table | no | request headers |
| data | string\|table | no | submitted data |
| callback | function | no | asynchronous callback |

| Return value type | Description |
| ----------------------- | ----------------------------------------------- |
| table\|java.lang.Thread | If callback parameter is present, the thread of the asynchronous request is returned |



### http.put

> Upload the specified URI representation

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | ---------- |
| [url][URL] | string | yes| |
| headers | table | no | request headers |
| data | string | no | submitted data |
| callback | function | no | asynchronous callback |

| Return value type | Description |
| ----------------------- | ----------------------------------------------- |
| table\|java.lang.Thread | If callback parameter is present, the thread of the asynchronous request is returned |



### http.patch

> Submit a request using the PATCH method

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | ---------- |
| [url][URL] | string | yes| |
| headers | table | no | request headers |
| data | string | no | submitted data |
| callback | function | no | asynchronous callback |

| Return value type | Description |
| ----------------------- | ----------------------------------------------- |
| table\|java.lang.Thread | If callback parameter is present, the thread of the asynchronous request is returned |



### http.delete

> Delete the specified resource

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | ---------- |
| [url][URL] | string | yes| |
| headers | table | no | request headers |
| data | string | no | submitted data |
| callback | function | no | asynchronous callback |

| Return value type |
|--------------------------|
| table\|java.lang.Thread |



### http.download

> Download File

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | ------------ |
| [url][URL] | string | yes| |
| headers | table | no | request headers |
| path | string | yes | file save path |
| callback | function | no | asynchronous callback |

| Return value type | Description |
| ----------------------- | ----------------------------------------------- |
| table\|java.lang.Thread | If callback parameter is present, the thread of the asynchronous request is returned |



### http.upload

> Upload File

| Parameter name | Type | Required | Description |
| :--------- | -------- | ---- | ------------ |
| [url][URL] | string | yes| |
| headers | table | no | request headers |
| path | string | yes | local file path |
| callback | function | no | asynchronous callback |

| Return value type | Description |
| ----------------------- | ----------------------------------------------- |
| table\|java.lang.Thread | If callback parameter is present, the thread of the asynchronous request is returned |



[URL]: https://www.runoob.com/html/html-url.html "HTML Uniform Resource Locator (URL) is a web page address. URL can be composed of letters, such as "gg.rlyun.top", or Internet Protocol (IP) address: 114.114.114.114. Most people access the website using the website domain name because the name is easier to remember than the number."



## file

> The file class library supports all java.io.File methods



### file.new

> Create a file object

| Return value type | Class name |
|---------- | ------------ |
| userdata | java.io.File |



### file.getCacheName

> Get the cache file path, the folder is the result of android.content.ContextWrapper#getCacheDir

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------------------------- |
| name | string | yes | Generate a file name based on the hash value of name |

| Return value type | Description |
|----------|--------|
| string | absolute road strength |



### file.checkFile

> Verify that the file is readable and writable, and try to create it if it does not exist
>
> Usually the download function will first call this function to verify the saved file

| Parameter name | Type | Required | Description |
| :------- | ------ | ---- | ------------ |
| filename | string | yes | absolute file path |

| Return value type | Description |
|--------------- | ---- |
| boolean,[error] | |



### file.checkDir

> Verify that the directory is readable and writable, and try to create it if it does not exist

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| dir | string | yes | absolute directory path |

| Return value type | Description |
|--------------- | ---- |
| boolean,[error] | |



### file.checkUrl

> Download URL resources to local cache

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------------------------------------------------------- |
| url | string | yes | If the url is cached, return the cached file, otherwise download the cached file and return it |

| Return value type | Description |
| -------------------- | ---------------- |
| string \| false, err | Absolute path after cache |



### file.download

> Download File

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| url | string | yes |
| path | string | yes |

| Return value type |
| ---------------- |
| boolean, [error] |



### file.getdir

> Get Catalog

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| string |



### file.getdirs

> Get the directory and create it if it does not exist

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| url | string | yes |
| path | string | yes |

| Return value type | Description |
|---------- | ----- |
| string | /end |



### file.type

> The type of path to which

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value | Type | Description |
| ------ | ------ | ---------- |
| directory | string | returns if it is a directory |
| file | string | returns if it is a file |
| nil | nil | Returns if not present |



### file.isDir

> Whether the path points to a directory

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type | Principle |
| ---------- | ---------------- |
| boolean | file.isDirectory |



### file.list

> Get sub-file array

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type | Class name | Principle |
| ---------- | ------------- | --------------- |
| userdata | [java.io.File | file.listFiles |



### file.rmdir

> delete directory

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| boolean |



### file.delete

> Delete File

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| boolean |



### file.remove

> Delete files or directories

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| boolean |



### file.read

> Read file

| Parameter Name | Type | Default | Required |
| :----- | -------------- | ---- | ---- |
| path | string | | is |
| mode | string, number | "*a" | No |

| Return value type |
|----------|
| string |



### file.write

> Write out file

| Parameter name | Type | Required |
| :----- | -------- | ---- |
| path | string | yes |
| data | LuaValue | yes |

| Return value type |
|----------|
| boolean |



### file.writeTmp

> Write out temporary file

| Parameter name | Type | Required |
| :----- | -------- | ---- |
| data | LuaValue | yes |

| Return value | Type | Description |
| ------ | ------ | ---------------- |
| path | string | random cache file name |



### file.lastTime

> Get the last modified timestamp of a file

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type | Description |
|----------|------|
| number | tens digit |



### file.lastModifiedDate

> Get the last modification time of the file

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type | Description |
| ---------- | --------------- |
| string | %Y-%m-%d %H:%M |



### file.length

> Get the size of a file or directory

| Parameter name | Type | Required |
| :----- | ------- | ---- |
| path | string | yes |
| mode | boolean | no |

| Return value | Type | Description |
| -------------------------- | ------ | ------------- |
| size | number | default |
| Size with unit (B, KB, MB, GB,...) | string | When mode is equal to true |



### file.prefix

> Get file prefix

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| string |



### file.suffix

> Get file suffix

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| string |



### file.info

> Get file information

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------------------------------------- |
| path | string | yes | |
| name | string | No | If no name is given, a collection of all information is returned |

| name | type | description |
| -------- | ------ | --------------------- |
| absolute path | string | file.getAbsolutePath |
| directory name | string | file.getParent |
| file name | string | file.getName |
| prefix name | string | file.prefix |
| suffix name | string | file.suffix |
| modification time | string | file.lastModifiedDate |
| filetype | string | file.type |
| file size | string | file.length |



### file.exec

> Use su process (root) to execute binary files

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| string |



### file.sh

> Execute shell file

| Parameter name | Type | Required |
| :----- | ------- | ---- |
| path | string | yes |
| root | boolean | no |

| Return value type |
|----------|
| string |



### file.mv

> Move Files

| Parameter name | Type | Required |
| :------- | ------ | ---- |
| source file | string | yes |
| target file | string | yes |
| root | | |

| Return value type |
|----------|
| string |



### file.chmod

> Modify file permissions

| Parameter name | Type | Required |
| :--------- | ------- | ---- |
| path | string | yes |
| permission | string | yes |
| root | boolean | no |

| Return value type |
|----------|
| string |



### file.rm

> Force delete file

| Parameter name | Type | Required |
| :----- | ------- | ---- |
| path | string | yes |
| root | boolean | no |

| Return value type | Command |
|---------- |----------- |
| string | rm -rf path |



### file.changeName

> Return to change file name

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |
| name | string | yes |

| Return value type |
|----------|
| string |



### file.changeExtension

> Back to Change file extension

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |
| name | string | yes |

| Return value type |
|----------|
| string |



### file.md5

> Get file MD5

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |

| Return value type |
|----------|
| string |



### file.open

> Call system API to open the file

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| path | string | yes |



### file.getAppPath

> Get the software path

| Return value type |
|----------|
| string |



### file.ipairs

> Traverse sub-files

| Parameter name | Type | Required |
| :--------- | -------------------- | ---- |
| path\|file | string\|java.io.File | yes |

> Example

~~~lua
for i, mfile in file.ipairs("/sdcard/") do
	--
end
~~~

| variable name | type | class name |
| ------ | -------- | ---------- |
| i | number | |
| mfile | userdata | java.io.File |





## device

> Some member variables of android.os.Build
>
> For details, please see print(device)



### device.getWidth

> Get the width of the device resolution

| Return value type |
|----------|
| number |



### device.getHeight

> Get the device's high resolution

| Return value type |
|----------|
| number |



### device.getimei

> Get the device's IMEI

| Return value type |
|----------|
| string |





## app

> The app library inherits from android.content.Context



### App properties

> The following are the properties of RLGG itself

| Field Name | Type | Description |
| ----------- | ---------------------------------- | ---------- |
| context | android.content.Context | Application context |
| pm | android.content.pm.PackageManager | Package Manager |
| info | android.content.pm.PackageInfo | Package information |
| name | string | Application name |
| path | string | apk path |
| md5 | string | apk's MD5 |
| sign | string | signature |
| sign_md5 | string | Signature MD5 |
| sign_sha1 | string | Signed SHA1 |
| sign_sha256 | string | Signed SHA256 |





### app.newContext

> Create a context based on the given package name

| Parameter Name | Type | Required | Default |
| :---------- | ------ | ---- | ---- |
| packageName | string | yes | |
| flags | number | no | 2 |

| Return value type | Class name |
| ---------- | ----------------------- |
| userdata | android.app.ContextImpl |



### app.getPackageInfo

> Get package information

| Parameter Name | Type | Required | Default |
| :------------------- | ------ | ---- | ---- |
| packageName\|apkPath | string | yes| |
| flags | number | no | 0 |

| Return value type | Class name |
| ---------- | ------------------------------- |
| userdata | android.content.pm.PackageInfo |



### app.getName

> Get the app name

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------|
| string |



### app.install

> Install the app

| Parameter name | Type | Required | Description |
| :------ | ------- | ---- | ----------------------- |
| apkPath | string | yes | |
| root | boolean | no | Whether to use su command for installation |

| Return value type |
|----------|
| string |



### app.uninstall

> Uninstall App

| Parameter name | Type | Required | Description |
| :---------- | ------- | ---- | ------------------------ |
| packageName | string | yes | |
| root | boolean | no | Whether to use su command to uninstall |



### app.startActivity

> Start the application

| Parameter name | Type | Required |
| :----- | ----------------------- | ---- |
| Intent | android.content.Intent | Yes |



### app.start

> Start the application

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |



### app.intent

> Start android.intent.action.VIEW

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| uri | string | yes |



### app.openUrl

> Open URL

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| url | string | yes |



### app.signatures

> Get app signature

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------|
| string |



### app.getInstalledPackages

> Get a list of installed packages

| Parameter Name | Type | Required | Default |
| :----- | ------ | ---- | ---- |
| flags | number | no | 0 |

| flags | description |
| ----- | ------------------ |
| 0 | Get the normal app |
| 1 | Get system apps |
| 2 | Get common and system apps |

| Return value type |
|----------|
| table |



### app.isSystem

> Determine whether the app is a system application

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------|
| boolean |



### app.isRoot

> Determine whether the current operating environment is ROOT

| Return value type |
|----------|
| boolean |



### app.getPID

> Get the PID of a given package name

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------|
| number |



### app.kill

> Kill process

| Parameter name | Type | Required |
| :--------------- | -------------- | ---- |
| packageName\|PID | string\|number | Yes |

| Return value type |
|----------|
| string |



### app.installSystem

> Install normal apps into system apps

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------|
| boolean |



### app.reboot

> Restart your phone



### app.exit

> Exit application



### app.runList

> Get a list of running packages

| Return value type |
|----------|
| table |



### app.getPath

> Get the apk path of the package name

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------|
| string |



### app.bootTime

> Get system boot time

| Return value type | Description |
| ---------- | ---------------- |
| number | timestamp of length 10 |



### app.loadIcon

> Load application icon

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------------------------------------|
| android.graphics.drawable.BitmapDrawable |



### app.is64

> Determine whether the process is 64-bit (it must be an already running process)

| Parameter name | Type | Required |
| :---------- | ------ | ---- |
| packageName | string | yes |

| Return value type |
|----------|
| boolean |

~~~lua
is64 = app.is64('package name')
is32 = not app.is64('package name')
~~~







## qq



### qq.join

> Jump to the given QQ user interface

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| qq | string | yes |



### qq.joinGroup

> Jump to the given Q group interface

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| qq group | string | yes |



### qq.exist

> Check if the given qq exists in the current environment
>
> Note: This is only valid when running in the same environment as RLGG

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| qq | string | yes |

| Return value type |
|----------|
| boolean |



### qq.existGroup

> Check if the given q group exists in the current environment

| Parameter name | Type | Required |
| :----- | ------ | ---- |
| qq group | string | yes |

| Return value type |
|----------|
| boolean |

> Example

~~~lua
local qun = '694700750'
if not qq.existGroup(qun) then
	if gg.alert(string.format('Please join QQ group %s first', qun), 'Jump', 'Exit') == 1 then
		qq.joinGroup(qun)
	end
	os.exit()
    return
end

~~~





## draw

>Note that after RLGG finishes running, it will automatically execute draw.remove to remove all the drawings generated by draw
>
>When testing, you need to add a delay to ensure that the script does not end immediately



Using draw to draw on Android 12 or above will cause screen touch to fail

You can load draw3 to fix it, for example, add at the beginning of the script

```lua
require('draw3')
```

That's it, no need to change other codes

It is more recommended to use native rlgg drawing, [see example] (demo/RLGG native drawing-example.lua)



### draw.new

> Initialize the old version of DrawTool-drawing tool to the _ENV environment



### draw.line

> Draw a line segment

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------------- |
| startX | number | is | the x-axis of the start of the line segment |
| startY | number | is | the y-axis of the beginning of the line segment |
| endX | number | is | the x-axis of the end of the line segment |
| endY | number | is | the y-axis of the end of the line segment |

| Return value name| Return value type |
|----------|----------|
| ID | number |

> Example

~~~lua
draw.line(100, 100, 100, 200)
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.circle

> Draw a circle

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------- |
| startX | number | is | the x-axis of the circle's center |
| startY | number | is | the y-axis of the circle's center |
| radius | number | is| the radius of the circle |

| Return value name| Return value type |
|----------|----------|
| ID | number |

> Example

~~~lua
draw.circle(200, 200, 100)
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.rect

> Draw a square

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------- |
| startX | number | yes | x coordinate of the upper left corner of the square |
| startY | number | yes | y coordinate of the upper left corner of the square |
| endX | number | is | the x-coordinate of the lower right corner of the square |
| endY | number | yes | y coordinate of the lower right corner of the square |

| Return value name| Return value type |
|----------|----------|
| ID | number |

> For example, refer to draw3





### draw.progress

> Draw a progress bar

| Return value name| Return value type |
|----------|----------|
| ID | number |

> For example, refer to draw3



### draw.picture

> Draw the original scaled image

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| path | string | yes | image file path |
| startX | number | yes | |
| startY | number | yes | |

| Return value name| Return value type |
|----------|----------|
| ID | number |

> Example

~~~lua
draw.picture(file.checkUrl('https://q4.qlogo.cn/headimg_dl?dst_uin=507522729&spec=640'), 0, 0)
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.scaled

> Draw a custom scaled image

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------- |
| path | string | yes | image file path |
| startX | number | yes | |
| startY | number | yes | |
| endX | number | is | |
| endY | number | is | |

| Return value name| Return value type |
|----------|----------|
| ID | number |

> Example

~~~lua
draw.scaled(file.checkUrl('https://q4.qlogo.cn/headimg_dl?dst_uin=507522729&spec=640'), 0, 0,100,100)
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.text

> Draw text/words

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------- |
| text | string | yes | text content |
| startX | number | yes | |
| startY | number | yes | |

| Return value name| Return value type |
|----------|----------|
| ID | number |

> Example

~~~lua
draw.text('RLGG', 200,200)
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.remove

> Remove Draw

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------- |
| ID | number | is | the ID returned by the draw library |



### draw.setColor

> Set the drawing color

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------- |
| color | string | yes | hexadecimal color value |

> Example

~~~lua
draw.setColor("#ff0000")
draw.text('RLGG', 200,200)
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.setOrigin

> Set the origin of the drawing axes

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| startX | number | yes | |
| startY | number | yes | |

> Example

~~~lua
draw.setOrigin(200,300)
~~~



### draw.setRange

> Set the maximum display range of all drawn content (note: set the shape of the display range to a square)

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| startX | number | yes | |
| startY | number | yes | |

> Example

~~~lua
draw.setRange(100,100,300,300)
~~~



### draw.setSize

> Set the size of the drawn text (note: only valid for text drawing)

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| size | number | yes | |

> Example

~~~lua
draw.setSize(20)
~~~



### draw.setStyle

> Set the drawing style to stroke or fill (note: only valid for drawing circles and squares)

| Parameter name | Type | Required | Description |
| :-------- | ------ | ---- | ----------------------- |
| StyleType | string | yes | stroke\|fill\|strokeandfill |

> Example

~~~lua
draw.setStyle('stroke and fill')
~~~



### draw.setWidth

> Set the thickness of the brush (note: invalid for drawing text)

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| size | number | yes | |

> Example

~~~lua
draw.setWidth(5)
~~~



### draw.updateColor

> Update drawn color

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------- |
| ID | number | is | the ID returned by the draw library |
| color | string | yes | hexadecimal color value |

> Example

~~~lua
draw.setColor('#ff0000')
local ID1=draw.text('RLGG', 200,200)
gg.sleep(1000)
draw.updateColor(ID1,'#ffff00')
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.updateText

> Update drawn text

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------------------ |
| ID | number | is the ID returned by | draw.text |
| text | string | is | text |

> Example

~~~lua
draw.setColor("#ff0000")
local ID1=draw.text('RLGG', 200,200)
gg.sleep(1000)
draw.updateText(ID1,'Updated drawing text')
gg.sleep(5000) -- For normal development, delete this line of delay code
~~~



### draw.updateDraw

> Update the drawn content

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ------------------ |
| ID | number | yes | |
| vararg | ... | is | the parameter required by the original method of ID |



## draw3

If there is draw3, is there draw2?

No, draw2 is just a variable name that was occupied a long time ago and has been deprecated.



You need to use require('draw3') to import the module, not "hungry" loading

draw3 contains all draw methods whose return value is an ID

The return value of the draw3 method is table

| Method Name | Parameter Type | Description |
| -------- | ------------------------------------- | -------- |
| setColor | string{\#%06x} \| number{0x0-0xffffff} | Set color |
| update | ... | Update drawing |
| remove | no parameters | remove drawing |



### draw3.text

> Draw text/words

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------- |
| text | string | yes | text content |
| startX | number | yes | |
| startY | number | yes | |

update method

| Parameter Name | Type | Description |
| ------ | ------ | --------------- |
| text | string | The text to be updated |



~~~lua
draw3 = require('draw3')
text1 = draw3.text('0', device.width / 2, device.height / 2)
for i = 1, 100 do
	gg.sleep(50)

	-- Set random colors
	local color = math.random(000000, 0xffffff)
	text1.setColor(color)

	-- Update text
	text1.update(i)
end

~~~



### draw3.rect

> Draw a square

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------- |
| startX | number | yes | x coordinate of the upper left corner of the square |
| startY | number | yes | y coordinate of the upper left corner of the square |
| endX | number | is | the x-coordinate of the lower right corner of the square |
| endY | number | yes | y coordinate of the lower right corner of the square |

update method, the parameters are the same as draw3.rect



~~~lua
draw3 = require('draw3')

-- The width of the block is one tenth of the screen width
width = device.width / 10
-- The block height is one tenth of the screen height
height = device.height / 10

-- Create the drawn object
rect1 = draw3.rect(0, 0, 0, 0)

-- Update drawing content
for y = 1, device.height, height do
	-- Set random colors
	-- local color = math.random(000000, 0xffffff)
	--rect1.setColor(color)

	for x = 1, device.width, width do
		rect1.update(x, y, x + width, y + height)
		gg.sleep(100)
	end
end

~~~





### draw3.progress

> Draw a progress bar

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------- |
| max | number | is| the maximum value of the progress bar |
| startX | number | yes | x coordinate of the upper left corner of the square |
| startY | number | yes | y coordinate of the upper left corner of the square |
| endX | number | is | the x-coordinate of the lower right corner of the square |
| endY | number | yes | y coordinate of the lower right corner of the square |

update method

| Parameter Name | Type | Description |
| ------ | ------ | ---------------- |
| num | number | The current value of the progress bar |



~~~lua
draw3 = require('draw3')

local max = 100
local startX = 0
local startY = device.height / 2
local endX = device.width
local endY = startY + (startY / 10)

-- Create the drawn object
progress1 = draw3.progress(max, startX, startY, endX, endY)

for i = 1, max do
	progress1.update(i)
	gg.sleep(10)
end

~~~





## table

>The parameter name self used by the table library refers to the table



### table.keys

> Get all table keys to a new table

| Parameter name | Type |
| :----- | ----- |
| self | table |

| Return value type |
|----------|
| table |

~~~lua
local t = {aa="a",bb="b",cc="c"}
print(table.keys(t)) --> {"aa","bb","cc"}
~~~



### table.values

> Get all the table values ​​to a new table

| Parameter name | Type |
| :----- | ----- |
| self | table |

| Return value type |
|----------|
| table |

~~~lua
local t = {aa="a",bb="b",cc="c"}
print(table.keys(t)) --> {"a","b","c"}
~~~



### table.indexof

> Find value from array table

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | -------------------- |
| array | table | is | |
| value | LuaValue | is | the value to be searched |
| begin | | no | Start searching from the specified index |

| Return value type |
|------------|
| index\|false |

~~~lua
local t = {"a","b","c"}
print(table.indexof(t,"c")) -->3
~~~



### table.keyof

> Find value from array table

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | -------------------- |
| kv | table | yes | general table |
| value | LuaValue | is | the value to be searched |
| begin | | no | Start searching from the specified index |

| Return value type |
|----------|
| index\|nil |

~~~lua
local t = {"a","b","c"}
print(table.keyof(t,"c")) -->3
~~~



### table.map

> Mapping table

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | --------- |
| kv | table | yes | general table |
| func | function | is | a processing function |

| Return value type |
|----------|
| nil |

Traverse the table, and use the result of the callback function as the new value. The callback parameters are value and key.

~~~lua
local t = {"a","b","c"}
table.map(t, function(v,k) return string.format("Modification-%s",v) end)
print(t)
--[[

{
	"Modify-a",
	"Modify-b",
	"modify-c"
}

]]
~~~



### table.walk

> Traverse table

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | --------- |
| kv | table | yes | general table |
| func | function | is | a processing function |

| Return value type |
|----------|
| nil |

Traverse the table, and each traversal is processed by the callback function. The callback parameters are value and key.

~~~lua
local t = {"a","b","c"}
table.walk(t, print)

--[[

a,1
b,2
c,3

]]
~~~



### table.filter

> Filters

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | --------- |
| kv | table | yes | general table |
| func | function | is | a processing function |

| Return value type |
|----------|
| nil |

Traverse the table, and each traversal is processed by the callback function. The callback parameters are value and key.

If the result of the processing function is not true, the value is discarded.



~~~lua
local t = {"a", "b", "c"}
table.filter(t, function(v, k)
	if v == "c" then
		return false
	end
	return true
end)
print(t)

-- {"a","b"}
~~~



### table.key2val

> key-value conversion, key becomes value, value becomes key

| Parameter name | Type |
| :----- | ----- |
| self | table |

| Return value type |
|----------|
| newtable |

~~~lua
local t = {"a","b","c"}
print(table.key2val(t))
--[[

{
	a=1,
	b=2,
	c=3
}

]]
~~~



### table.clear

> Clear table

| Parameter name | Type |
| :----- | ----- |
| self | table |



### table.removeRepeat

> Delete duplicate Value (shallow)

| Parameter name | Type |
| :----- | ----- |
| self | table |

| Return value type |
|----------|
| self |



### table.removeRepeats

> Delete duplicate Value (depth)

| Parameter name | Type |
| :----- | ----- |
| self | table |

| Return value type |
|----------|
| self |

> Example



```lua
local t1={1,2,3,3,4,{1,1}}
table.removeRepeat(t1) -- shallow

{ -- table(ef347d8)
	[1] = 1,
	[2] = 2,
	[3] = 3,
	[4] = 4,
	[5] = { -- table(7e46bb)
		[1] = 1,
		[2] = 1,
	},
}

local t1={1,2,3,3,4,{1,1}}
table.removeRepeat(t1) -- Deep

{ -- table(ef347d8)
	[1] = 1,
	[2] = 2,
	[3] = 3,
	[4] = 4,
	[5] = { -- table(7e46bb)
		[1] = 1,
	},
}
```



### table.length

> Get the actual length of the table by traversing

| Parameter name | Type |
| :----- | ----- |
| self | table |

| Return value type |
|----------|
| number |



### table.merge

> Merge multiple tables

| Parameter name | Type |
| :----- | ---------- |
| self | table |
| ... | ...(table) |

| Return value type |
|----------|
| self |



### table.copy

> Copy table (deep)

| Parameter name | Type | Required |
| :----- | ----- | ---- |
| to | table | no |
| from | table | is |

| Return value name | Type |
|---------- | ----- |
| to | table |

> Example

~~~lua
local t1 = {1,2,3}
table.copy(t1)
{1,2,3} -- a new table with the same elements

local t1 = {a=1,b=2}
local t2 = {a=100}
table.copy(t1, t2)
{a=100,b=2} == t1
~~~



### table.list

> Convert array to table

| Parameter name | Type |
| :----- | -------------- |
| list | java.util.List |

| Return value name | Type |
|---------- | ----- |
| table |

> Previously, the parameter type of table.list was [, which is wrong. The correct type is java.util.List



### table.array

> Convert array to table

| Parameter name | Type |
| :----- | -------------------------- |
| Array | java.lang.reflect.Array, [ |

| Return value name | Type |
|---------- | ----- |
| table |



### table.find

> Find element (shallow)

| Parameter name | Type |
| :--------- | -------- |
| self | table |
| Value to find | LuaValue |

| Return value name | Type |
|----------|--------|
| Location | index |
| Found value | LuaValue |



### table.finds

> Find element (deep)

| Parameter name | Type |
| :--------- | -------- |
| self | table |
| Value to find | LuaValue |

| Return value name | Type |
|----------|--------|
| Location | index |
| Found value | LuaValue |



### table.pairs

> Same as [pairs](#pairs )



### table.ipairs

> Same as [ipairs ](#ipairs )



### table.json

> Same as [json.decode][]







##math

> This is a library related to numbers



### math.byte2bins

> Decimal to Binary

| Parameter name | Type |
| :----- | ------ |
| byte | number |

| Return value type | Description |
|----------|----------|
| table | binary list |



### math.byte2bin

> Decimal to Binary

| Parameter name | Type |
| :----- | ------ |
| byte | number |

| Return value type | Description |
|----------|--------|
| string | binary string |

> Example

~~~lua
math.byte2bin(0) -- 00000000
math.byte2bin(100) -- 01100100
~~~



### math.bin2byte

> Convert binary to decimal

| Parameter name | Type |
| :------- | ------ |
| binary string | string |

| Return value type |
|----------|
| number |



### math.int

> Convert numeric value to integer

| Parameter name | Type |
| :------- | ------ |
| LuaValue | number |

| Return value type |
|----------|
| number |

> Example

~~~lua
math.int(100.023) -- 100
~~~



### math.float

> Convert numeric value to floating point type

| Parameter name | Type |
| :------- | ------ |
| LuaValue | number |

| Return value type |
|----------|
| number |

> Example

~~~lua
math.int(100) -- 100.0
~~~





## streamUtils

> Class libraries related to input (java.io.InputStream) and output (java.io.OutputStream) streams





### streamUtils.inputStreamWriteFile

> Write the input stream to a file

| Parameter name | Type |
| :----------- | ------------------- |
| Input Stream | java.io.InputStream |
| absolute file path | string |



### streaUtils.fileWriteOutputStream

> Output the file to the output stream

| Parameter name | Type |
| :----------- | ------------------- |
| absolute file path | string |
| Output Stream | java.io.OutputStream |



### streamUtils.stringWriteOutputStream

> Output a string to an output stream

| Parameter name | Type |
| :----- | -------------------- |
| data | string |
| Output Stream | java.io.OutputStream |



### streamUtils.readInputStream

> Read input stream

| Parameter name | Type |
| :----- | ------------------- |
| Input Stream | java.io.InputStream |

| Return value type |
|----------|
| string |



### streamUtils.copy

> Copy the input stream to the output stream

| Parameter name | Type |
| :----- | -------------------- |
| Input Stream | java.io.InputStream |
| Output Stream | java.io.OutputStream |



##dex

> Load external dex interaction



### dex.newInstance

> Create a dex instance. It is recommended to use dex.loadfile. Subsequent loading of a single instance is faster.

| Parameter Name | Required | Type | Description |
| :----------------- | ---- | ------------------------ | ---------------- |
| dexPath | yes | string | absolute path of dex file |
| optimizedDirectory | No | string | Directory for optimized cache |
| librarySearchPath | No | string | lib search path |
| parent | no | java.lang.ClassLoader | parent loader |

| Return value type |
| ---------------------------- |
| dalvik.system.DexClassLoader |



### dex.loadfile

> Load dex files, each file is a singleton, and cached after successful loading
>
> The dex will be added to the import loader, which means that import can get the dex class

| Parameter Name | Required | Type | Description |
| :-------- | ---- | ------ | ------------------- |
| dexPath | yes | string | absolute path of dex file |
| className | No | string | Returns the class name loaded from dex |

| Return value type |
| ----------------------------------------------- |
| dalvik.system.DexClassLoader \| java.lang.Class |



### dex.appendLoader

> Add dexloader to the import loader, and import can get the class of the dex

| Parameter Name | Required | Type | Description |
| :----- | ---- | ---------------------------- | ---- |
| loader | is | dalvik.system.DexClassLoader | |







## functions

> Function-specific class library (basic parameters or return values ​​are function type), the functions class library must use version 2.0.9 or above, otherwise there may be problems



### functions.synchronized

> Get the synchronous callback of the function. In multi-threaded execution, only one will be executed at the same time
>
> Using the Java synchronized keyword

| Parameter Name | Required | Type | Description |
| :------- | ---- | -------- | ---- |
| callback | is | function | |

| Return value type | Description |
|----------|----------|
| function | Support synchronization lock |

~~~lua
local function func(...)
	print(...)

	gg.sleep(50)
end

-- Add synchronization lock to the function
synfunc = functions.synchronized(func)

-- Get the multithreaded callback of the function
synthreadfunc = functions.thread(synfunc)
threadfunc = functions.thread(func)

-- Synchronous lock test
for i = 1, 5, 1 do
	local msg = string.format('Synchronous lock multithreading execution for %s time', i)
	synthreadfunc(msg)
end

-- No sync lock test
for i = 1, 5, 1 do
	local msg = string.format('Multithreaded execution for %s time', i)
	threadfunc(msg)
end

gg.sleep(110)

--[[

After the run is finished, the multithreading of the synchronization lock is only executed 2-3 times, and the others are finished before they have time to execute the script (you need to wait for the execution in progress to be completed before the others can be executed)

]]
~~~



### functions.syncCall

> Synchronous execution function

| Parameter Name | Required | Type | Description |
| :----- | ---- | -------- | ---- |
| func | is | function | |
| vararg | no | ... | |

| Return value type | Description |
| ---------- | ------------- |
| ... | pcall's return value |



### functions.preload

> Get the preload callback of the function
>
> The first time it is executed, the callback is executed. All subsequent executions are the return value of the callback. Therefore, the first execution of the callback needs to return a function

| Parameter Name | Required | Type | Description |
| :------- | ---- | -------- | ---- |
| callback | is | function | |

| Return value type |
|----------|
| function |

~~~lua
local func = functions.preload(function(...)

	-- Initialization, will only be executed once
	local res = math.random(1000, 9999)

	-- Return the actual function
	return function(...)
		return res
	end
end)

func('support parameters')

for i = 1, 10, 1 do

	-- The return value of func is the same
	print(func())
end

~~~



### functions.singleton

> Get the singleton callback of the function
>
> The first execution of the callback will cache the execution result, and the rest of the executions will directly return the cached result

| Parameter Name | Required | Type | Description |
| :------- | ---- | -------- | ---- |
| callback | is | function | |

| Return value type | Description |
| ---------- | ----------------------- |
| function | returns the result of callback |

~~~lua
local function func(...)
	return math.random(1000, 9999)
end

singletonfunc = functions.singleton(func)

threadfunc = functions.thread(function()
	print(singletonfunc())
end)

for i = 1, 10, 1 do
	threadfunc()
end

gg.sleep(50)

-- Each result is the result of the first execution (even in multi-threading)

~~~



### functions.thread

> Get multithreaded callback of function

| Parameter Name | Required | Type | Description |
| :------- | ---- | -------- | ---- |
| callback | is | function | |

| Return value type | Description |
| ---------- | --------------------------------------------------------------- |
| function | Executing this function will automatically switch to multi-threaded execution, support parameters, and the return value is java.lang.Thread |

> For examples, see functions.singleton or functions.synchronized above.



### functions.voidThread

> Get the multi-threaded callback of the function, the callback will not return the result

| Parameter Name | Required | Type | Description |
| :------- | ---- | -------- | ---- |
| callback | is | function | |

| Return value type | Description |
| ---------- | -------------------------------------------------------- |
| function | Executing this function will automatically switch to multi-threaded execution, support parameters, and have no return value |



### functions.closure

> Create a closure

| Parameter Name | Required | Type | Description |
| :----- | ---- | -------- | ---- |
| func | is | function | |
| vararg | no | ... | |

| Return value type | Description |
|---------- | ---- |
| function | |

~~~lua
local f1 = functions.closure(gg.toast, 'Welcome to RLGG')

-- Equivalent to gg.toast('Welcome to RLGG')
f1()
f1()
~~~



### functions.closures

> Create a closure, which can still carry parameters

| Parameter Name | Required | Type | Description |
| :----- | ---- | -------- | ---- |
| func | is | function | |
| vararg | no | ... | |

| Return value type | Description |
|---------- | ---- |
| function | |

~~~lua
local yz_alert = functions.closures(gg.alert2, 'RL Cloud Verification System - Super Invincible Technology')

yz_alert('Login successful', 'ok')
yz_alert('Login failed', 'Log in again')
~~~



## auto

> Automatically click based on accessibility mode



x: screen x coordinate

y: screen y coordinate



[View example](demo/auto/autotest.lua)



### auto.start

> Before using the auto library, you need to start the service first (some initialization work, and determine whether the current user has enabled accessibility)

| Return value type |
|--------------|
| boolean[,error] |

~~~lua
assert(auto.start())
local x = device.x
local y = device.y / 2
gg.setVisible(false)
gg.sleep(500)
auto.swipe(0, y, x, y, 500) -- Slide the screen from left to right
~~~



### auto.click

> Short click on the screen coordinates, fixed duration 100 milliseconds

| Parameter name | Required | Type |
| :----- | ---- | ------ |
| x | is | number |
| y | is | number |



### auto.longClick

> Long press the screen coordinates, fixed time consuming 1000 milliseconds

| Parameter name | Required | Type |
| :----- | ---- | ------ |
| x | is | number |
| y | is | number |



### auto.tap

> Click the screen

| Parameter Name | Required | Type | Description |
| :----- | ---- | ------ | ---------- |
| x | is | number | |
| y | is | number | |
| milli | yes | number | duration (milliseconds) |



### auto.swipe

> Slide screen

| Parameter Name | Required | Type | Description |
| :----- | ---- | ------ | ---------- |
| startX | is | number | starting X coordinate |
| startY | yes | number | starting Y coordinate |
| endX | is | number | ending X coordinate |
| endY | yes | number | ending Y coordinate |
| milli | yes | number | duration (milliseconds) |



### auto.press

> Simulate pressing and holding coordinates

| Parameter Name | Required | Type | Description |
| :----- | ---- | ------ | ---------- |
| x | is | number | |
| y | is | number | |
| milli | yes | number | duration (milliseconds) |



### auto.gesture

> Simulate gesture operation

| Parameter Name | Required | Type | Description |
| :----- | ---- | ------ | ---------- |
| milli | yes | number | duration (milliseconds) |
| xy1 | is | table | coordinate information |
| xy2 | no | table | coordinate information |
| xyn... | | | |

> Coordinate information can have multiple



### auto.gestures

> Simulate multiple gestures simultaneously

| Parameter Name | Required | Type | Description |
| :----- | ---- | ----- | ------------------ |
| xy1 | is the parameter of | table | auto.gesture |
| xy2 | no | table | auto.gesture parameters |
| xyn... | | | |

> Coordinate information can have multiple







## cglib [![Build Status](https://travis-ci.org/cglib/cglib.svg?branch=master)](https://github.com/cglib/cglib)

> cglib is a dynamic proxy operation library. The proxied class does not need to be an interface type.
>
> To use cglib, you need to use require to load it. `local cglib = require('cglib')`



### cglib.createInterceptor

> Use interceptor java proxy, use this method when you need to execute invokeSuper, otherwise it is recommended to use cglib.createProxy
>

| Parameter Name | Required | Type | Description |
| :---------- | ---- | ------------------ | ------------------ |
| superClass | is | class | the class that needs to be proxied |
| proxyMethod | is | table methodName[] | the method to be proxied |
| intercept | is | function | interceptor |
| vararg | no | ... | arguments to create the proxy instance |

| Return value type | Description |
| ---------- | ------------------ |
| userdata | superClass(vararg) |

~~~lua
local cglib = require('cglib')

local o = cglib.createInterceptor(Object, {'toString', 'equals'}, function(thisObject, param, methodProxy)
	print('intercept', methodProxy:getMethodName())

	if methodProxy:getMethodName() == 'toString' then
		return 'cglib.createInterceptor: Modified the return value of toString'
	end

	return methodProxy:invokeSuper(thisObject, param)
end)

print(luajava.instanceOf(o, Object))
print(o:toString())
~~~



### cglib.createProxy

> Use Lua function proxy

| Parameter Name | Required | Type | Description |
| :---------- | ---- | --------------------------- | ------------------ |
| superClass | is | class | the class that needs to be proxied |
| proxyMethod | yes | table<methodName, callback> | method to be proxied |
| vararg | no | ... | arguments to create the proxy instance |

| Return value type | Description |
| ---------- | ------------------ |
| userdata | superClass(vararg) |

~~~lua
local cglib = require('cglib')

local o = cglib.createProxy(Object, {
	toString = function()
		return 'cglib.createProxy: Modified the return value of toString'
	end,
	equals = function(p1)
		return false
	end
})

print(o:toString())
print(o:equals(o), 'intercepted and forced to return false')
~~~















[^src]: src can be a local file or url





[json.decode]: #jsondecode

