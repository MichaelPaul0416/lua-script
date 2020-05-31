-- error

local tool=require('tool')

function add(a,b)
	assert(type(a)=='number','a must be a number')
	assert(type(b)=='number','b must be a number')

	return a+b
end

function dealWithError(a,b)
	-- error�����ĵڶ�������
	-- 1[Ĭ��]��Ϊ����errorλ��(�ļ�+�к�)
	-- 2��ָ���ĸ�����error�ĺ����ĺ���
	-- 0:����Ӵ���λ����Ϣ
	error('error deal',1)
end


function pcallWithError(num,b)
	-- ���pcall�ڲ�������error��pcall�Ὣ�䲶׽�����ز�����һ����false���ڶ����Ǿ���Ĵ���(�����к�)
	status,v=pcall(
		function(arg)
			print('input:'..arg)
			if b then
				error('throw error')
			end
			-- ����ֵ��Ϊpcall�ĵڶ�����������һ�����ز�����true/false����ʾ�����ڲ��Ƿ�������
			return num*2
		end
	,num)
	print('status:'..tostring(status)..'->'..v)
end

function xpcallWithError(arg,b)
	--xpcall���յڶ�����������һ��������������������ʱ��Lua���ڵ��×Cչ����unwind��ǰ���ô������������ǾͿ��������������ʹ��debug������ȡ���ڴ���Ķ�����Ϣ�ˡ�
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
