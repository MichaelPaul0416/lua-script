-- coroutine

-- 最重要的一点：所有的coroutine在一个时刻只有一个coroutine在执行

-- 通过create创建的coroutine需要通过coroutine.resume(c,arg1,arg2...)执行
-- 通过wrap方法创建的coroutine可以直接通过方法调用的方式func(arg1,arg2...)执行

-- 引用了其他lua的话，如果被引用的lua修改了的话，那么需要被引用的lua先编译一遍，然后再跑这个lua
-- 否则引用的lua还是旧的lua
local tool=require("tool")

-- create a coroutine
tool.newLineWithTip('coroutine.create/resume')
co=coroutine.create(
		function(a,b)
			print('input arg:['..a..','..b..']')
		return a + b
	end
)

-- restart a coroutine and result multi value
result,value=coroutine.resume(co,1,2)
print('coroutine result status:'..tostring(result)..' and value is :'..value)


-- wrapper a function to a coroutine and the coroutine will run when call this function
tool.newLineWithTip('coroutine.wrap')
wrapper=coroutine.wrap(
	function(a,b)
		print('a['..a..']-b['..b..']')
		return a+b
	end
)

print(wrapper(1,2))

tool.newLineWithTip('print table')
print(tool.printTable({key='1',mode='hello',script='lua'}))

tool.newLineWithTip('coroutine.create multi time')
mc_1=coroutine.create(
	function(i)
		print('i='..i)
		for m=1,i do
			print('m='..m)
			if m==3 then
				-- 如果coroutine.status的参数对应的coroutine不存在，那么这个coroutine就会停在这里，后面就不会再执行了
				print('state:'..coroutine.status(mc_1))
				print('thread:'..tostring(coroutine.running()))
				-- suspend current coroutine
				coroutine.yield()
			end
		end
	end
)
-- resume一个coroutine的时候，第一个参数是coroutine，后面参数的个数必须严格按照创建coroutine的时候指定的，否则会不对
coroutine.resume(mc_1,5)
-- 重复起一个running的coroutine，后面的操作无效
-- 但是如果resume的参数coroutine被挂起的话，这里会启动挂起的coroutine
-- 如果mc_1是挂起了的话，那么resume方法返回true，
print(coroutine.resume(mc_1,6))


tool.newLineWithTip('coroutine.yield')
-- yield的参数都会作为resume的额外参数返回，resume成功返回true，不成功返回false
co1=coroutine.create(
	function(m)
		print('running coroutine['..m..']')
		-- 这里yield会将入参的两个参数返回唤醒它(resume)的coroutine
		-- 这里用e1，e2接收外部唤醒因为yield而挂起的coroutine，如果此时外部传入了新的参数进来，那么这里yield方法的返回值就是外部在resume的时候传入的参数
		local e1,e2=coroutine.yield(m+2,'extra msg')
		print('after resume and out param:'..tostring(e1)..';'..tostring(e2))
		coroutine.yield(e1..'>',e2..'<')
		print('end current coroutine')
	end
)
-- 5传给coroutine，然后代码遇到coroutine.yield的时候，接收从yield的入参，作为resume的额外返回参数(resume的第一个返回参数代表唤醒coroutine的结果[true/false])
-- start the coroutine
print(coroutine.resume(co1,5))
print('main resume suspend coroutine')
-- resume the first yield
print('resume for the first suspend casused by the first yield;',coroutine.resume(co1,'hello','world'))
-- resume the second yield
print('resume for the second suspend casued by the second yield;',coroutine.resume(co1))
-- call resume for dead coroutine
print(coroutine.resume(co1))

-- coroutine内部执行完了之后，才从resume处获得return的结果(如果coroutine有结果值返回的话)
tool.newLineWithTip('the order of method resume and coroutine\'s inner function')
co2=coroutine.create(
	function(m)
		print('inner sql:'..m)
		-- 返回结果1，由resume()方法调用后接收
		return 1
	end
)
-- n负责接收co2中函数的返回
-- 同时3作为参数传给coroutine
b,n=coroutine.resume(co2,3)
print('end call coroutine')
print(b,n)
