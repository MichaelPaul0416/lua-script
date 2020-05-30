-- coroutine

-- ����Ҫ��һ�㣺���е�coroutine��һ��ʱ��ֻ��һ��coroutine��ִ��

-- ͨ��create������coroutine��Ҫͨ��coroutine.resume(c,arg1,arg2...)ִ��
-- ͨ��wrap����������coroutine����ֱ��ͨ���������õķ�ʽfunc(arg1,arg2...)ִ��

-- ����������lua�Ļ�����������õ�lua�޸��˵Ļ�����ô��Ҫ�����õ�lua�ȱ���һ�飬Ȼ���������lua
-- �������õ�lua���Ǿɵ�lua
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
				-- ���coroutine.status�Ĳ�����Ӧ��coroutine�����ڣ���ô���coroutine�ͻ�ͣ���������Ͳ�����ִ����
				print('state:'..coroutine.status(mc_1))
				print('thread:'..tostring(coroutine.running()))
				-- suspend current coroutine
				coroutine.yield()
			end
		end
	end
)
-- resumeһ��coroutine��ʱ�򣬵�һ��������coroutine����������ĸ��������ϸ��մ���coroutine��ʱ��ָ���ģ�����᲻��
coroutine.resume(mc_1,5)
-- �ظ���һ��running��coroutine������Ĳ�����Ч
-- �������resume�Ĳ���coroutine������Ļ�����������������coroutine
-- ���mc_1�ǹ����˵Ļ�����ôresume��������true��
print(coroutine.resume(mc_1,6))


tool.newLineWithTip('coroutine.yield')
-- yield�Ĳ���������Ϊresume�Ķ���������أ�resume�ɹ�����true�����ɹ�����false
co1=coroutine.create(
	function(m)
		print('running coroutine['..m..']')
		-- ����yield�Ὣ��ε������������ػ�����(resume)��coroutine
		-- ������e1��e2�����ⲿ������Ϊyield�������coroutine�������ʱ�ⲿ�������µĲ�����������ô����yield�����ķ���ֵ�����ⲿ��resume��ʱ����Ĳ���
		local e1,e2=coroutine.yield(m+2,'extra msg')
		print('after resume and out param:'..tostring(e1)..';'..tostring(e2))
		coroutine.yield(e1..'>',e2..'<')
		print('end current coroutine')
	end
)
-- 5����coroutine��Ȼ���������coroutine.yield��ʱ�򣬽��մ�yield����Σ���Ϊresume�Ķ��ⷵ�ز���(resume�ĵ�һ�����ز���������coroutine�Ľ��[true/false])
-- start the coroutine
print(coroutine.resume(co1,5))
print('main resume suspend coroutine')
-- resume the first yield
print('resume for the first suspend casused by the first yield;',coroutine.resume(co1,'hello','world'))
-- resume the second yield
print('resume for the second suspend casued by the second yield;',coroutine.resume(co1))
-- call resume for dead coroutine
print(coroutine.resume(co1))

-- coroutine�ڲ�ִ������֮�󣬲Ŵ�resume�����return�Ľ��(���coroutine�н��ֵ���صĻ�)
tool.newLineWithTip('the order of method resume and coroutine\'s inner function')
co2=coroutine.create(
	function(m)
		print('inner sql:'..m)
		-- ���ؽ��1����resume()�������ú����
		return 1
	end
)
-- n�������co2�к����ķ���
-- ͬʱ3��Ϊ��������coroutine
b,n=coroutine.resume(co2,3)
print('end call coroutine')
print(b,n)
