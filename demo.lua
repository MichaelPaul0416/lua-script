_name="hello lua"
print(_name)

--变量一般都是全局的
print(b)

-- print type with function
print(type('hello'))
print(type(_name))


-- table
tab1 = {key1 = 'var1',key2 = 'var2'}
print(tab1)
print(type(tab1))
for k,v in pairs(tab1) do
	print(k .. '-' .. v)
end

-- compare with nil
print(type(m) == 'nil')


-- false == nil
if false or nil then
	print('true at least one of false and nil')
else
	print('both false and nil is false')
end

-- 0 == true
if 0 then
	print('0 is true')
else
	print('0 is false')
end

-- string wrapped with double []
str1 = [[hello
world]]
print(str1)
print(type(str1))

-- 1 is start of array
ary = {'one','two','three'}
for k,v in pairs(ary) do
	print('index:' ,k)
end

-- function
function fib(n)
	if n == 0 then
		return 1
	else
		return n * fib(n-1)
	end
end

print(fib(5))

-- set value of function
fib2 = fib
print('result of fib2',fib(5))


-- anonymous func
function outfunc(n,func)
	return n + func(n+2,n-1)
end

o = outfunc(5,
	function(a,b)
		return a * b
	end	);
print(o)
