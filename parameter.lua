a = 5
-- declare a local parameter
local b = 5
function joke()
	c = 5
	local d = 6
	-- 函数内可以看到外部的局部变量b
	print(a,b,d)
end

joke()

-- 此时看不到局部变量d，因为作用域是函数joke内部
print(c,d)

do
	local a = 6 -- 局部变量
	b = 6 -- 对外面的局部变量赋值
	print(a,b)
end

-- 打印外部的局部变量
print(a,b)


-- 变量赋值  [..的作用是将前后两个字符串拼接]
str1 = 'hello'..'world'
print(str1)

-- 也可以和golang一样多个字段一块赋值
str1,str2 = 'hello','world'
print(str1..'->'..str2)

-- swap
x,y=1,2
x,y=y,x
print(x..'-'..y)

-- 变量个数和等号右边的值的个数不一样的时候，以等号左边的变量的个数为准
a,b = 1,2,3
print(a,b)
a,b,c=1
print(a,b,c)

-- 索引访问table
t1={name='tom',address='cat',full='web'}
-- 下面两种访问方式效果一样
print(t1['name'],t1.name)
