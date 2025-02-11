## floatingWindowManager



[View example](demo)



### init

> Initialize the floating window frame (required)



### newWindow

> Create Window

| Parameter name | Type | Required | Description |
| :----------- | ------ | ---- | ------------ |
| name | string | yes | window name |
| callbackInfo | table | yes | event callback method |



> callbackInfo

| Field Name | Type | Callback Parameters | Description |
| --------- | -------- | -------------- | -------------------------------- |
| onCreate | function | floatingWindow | This event is triggered after the window is created |
| onStart | function | floatingWindow | This event is triggered after the window is started |
| onPause | function | floatingWindow | This event is triggered after the current window starts another window |
| onResume | function | floatingWindow | This event is triggered when switching back from another window |
| onDestroy | function | floatingWindow | This event is triggered when the window is destroyed |



### start

> Startup Window

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------- |
| name | string | yes | window name |



### error

> Throw exception frame

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | -------- |
| error | string | yes | error message |



### exit

> Exit floating window



### run

> Run floating window frame





## floatingWindow

>Initial components (default)

- Root page (android.widget.FrameLayout)
  - Status bar (android.widget.LinearLayout)
    - Function bar left (android.widget.LinearLayout)
    - Title bar (android.widget.LinearLayout)
    - Function bar right (android.widget.LinearLayout)
  - Main page (android.widget.LinearLayout) **ps: addlayout is added to this control**

> The above controls can be found through findViewByName

~~~lua
local mainView = floatingWindow:findViewByName("main page")
-- ...
~~~





### setTitle

> Set Title

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| text | string | yes | title |



### addView

> Add a View to the main page

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ---- |
| view | userdata | yes | |

| Return value name | Type |
|----------|--------|
| Controls | userdata |



### addlayout

> Load a lualayout layout and add it to the main page

| Parameter name | Type | Required | Description |
| :----- | ----- | ---- | ---- |
| layou | table | is | |

| Return value name | Type |
|----------|--------|
| Controls | userdata |





### setCache

> Save a data to cache, the same window can be retrieved through getCache

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ---- |
| name | string | is | |
| data | LuaValue | no | |



### getCache

> Get the data saved in the same window

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| name | string | is | |

| Return value name | Type |
|----------|--------|
| cache | LuaValue |



### match_parnt

> Windowed full screen mode



### wrap_content

> Window Adaptive Mode



### newId

> Create ID

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| ID name | string | yes | |

| Return value name | Type |
|----------|------|
| id | number |



### getId

> Get ID

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------------------- |
| ID name | string | yes | must be newId created ID name |

| Return value name | Type |
|----------|------|
| id | number |



### findViewByName

> Find the corresponding View control by ID name

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---------------------------- |
| ID name | string | yes | must be newId created ID name |

| Return value name | Type |
|----------|--------|
| Controls | userdata |



### goneViewByName

> Hide a View with an ID name

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| ID name | string | yes | |



### visibleViewByName

> Display a View with an ID name

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | ---- |
| ID name | string | yes | |



### addViewByName

> Add View to the container with ID name

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | --------------- |
| ID name | string | yes | ID name of the parent container |
| child control | userdata | yes | child control |



### loadlayoutByView

> Load the lua layout and add it to the View container

| Parameter name | Type | Required | Description |
| :----- | -------- | ---- | ------------ |
| parent container | userdata | is | parent container |
| layout | table | is | the layout of child controls |



### loadlayoutByName

> Load the lua layout and add it to the container with the ID name

| Parameter name | Type | Required | Description |
| :----- | ------ | ---- | --------------- |
| ID name | string | yes | ID name of the parent container |
| layout | table | is | the layout of child controls |





## Frequently Asked Questions

- Why does the UI get stuck after the callback event starts the function?

  The reason is that the callback event is executed by the main thread. If the main thread is occupied for a long time by time-consuming tasks, it will be stuck.

  How to solve it?

  Use multithreading to execute time-consuming tasks in callback events

  

  Error demonstration

  ```lua
  --Callback event
  onClick = function()
  	-- Other codes
  
  	-- Time-consuming tasks
  	gg.searchNumber(0)
  
  	-- Other codes
  end
  
  ```

  

  Correct demonstration

  ```lua
  --Callback event
  onClick = function()
  
  	function func()
  		-- Other codes
  
  		-- Time-consuming tasks
  		gg.searchNumber(0)
  
  		-- Other codes
  	end
  
  	-- Use multithreaded execution function
  	luajava.startThread(func)
  end
  
  ```

  

  Correct demonstration

  ```lua
  function AAA1()
  	-- Other codes
  
  	-- Time-consuming tasks
  	gg.searchNumber(0)
  
  	-- Other codes
  end
  
  
  --Callback event
  onClick = function()
  
  	-- Use multithreading to execute AAA1
  	luajava.startThread(AAA1)
  end
  
  ```

  

  How to understand what is a time-consuming task?

  The execution cycle is too long

  For example, the `gg.searchNumber` function takes a very long time to search.

  For example, the `gg.sleep` function makes the current thread sleep for a period of time, which is also time-consuming.

  As long as you can feel the lag, it is considered a time-consuming task

  

-

