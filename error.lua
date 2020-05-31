-- error

local tool=require('tool')

function add(a,b)
	assert(type(a)=='number','a must be a number')
	assert(type(b)=='number','b must be a number')

	return a+b
end

function dealWithError(a,b)
	-- error方法的第二个参数
	-- 1[默认]：为调用error位置(文件+行号)
	-- 2：指出哪个调用error的函数的函数
	-- 0:不添加错误位置信息
	error('error deal',1)
end


function pcallWithError(num,b)
	-- 如果pcall内部发生了error，pcall会将其捕捉，返回参数第一个是false，第二个是具体的错误(包含行号)
	status,v=pcall(
		function(arg)
			print('input:'..arg)
			if b then
				error('throw error')
			end
			-- 返回值作为pcall的第二个参数，第一个返回参数是true/false，表示函数内部是否发生错误
			return num*2
		end
	,num)
	print('status:'..tostring(status)..'->'..v)
end

function xpcallWithError(arg,b)
	--xpcall接收第二个参数——一个错误处理函数，当错误发生时，Lua会在调用桟展开（unwind）前调用错误处理函数，于是就可以在这个函数中使用debug库来获取关于错误的额外信息了。
	print(xpcall(
		function()
			print('argument:'..arg)
			if b then
				error('need error')
			end
			return arg+2
		end,
		function(msg)
			-- deal error
			print('debug deal:'..msg)
			print(debug.traceback())
		end
	))
end
-- error code
tool.newLineWithTip('assert for check')
--print('sum:'..add(1,'2'))
print('sum:'..add(1,2))

-- pcall
tool.newLineWithTip('pcall')
pcallWithError(10,false)

-- xpcall+debug
tool.newLineWithTip('xpcall and deal with debug')
xpcallWithError(10,true)

tool.newLineWithTip('error deal')
print(dealWithError(1,2))
