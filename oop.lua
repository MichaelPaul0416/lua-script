-- oop
-- 元类
Rectangle={area=0,length=0,width=0}

--派生类的方法new
function Rectangle:new(o,length,width)
	print(type(o))
	-- o如果是nil的话，走false的分支，只有o不是空，才是true
	-- 下面的if-else的效果和[--o=o or {}]效果一样
	if o then
		print('not nil is true')
		o=o
	else
		print('nil is false')
		o={}
	end

	m=setmetatable(o,self)
	-- m是元表self生成的子表
	print(m,self)
	-- 设置访问索引，引导到自己这里
	self.__index=self
	self.length=length or 0
	self.width=width or 0
	self.area=length*width
	return o
end

function Rectangle:printArea()
	-- self 代表实例本身
	print('the area is:'..self.area)
end

r=Rectangle:new({},1,2)

print(r.area)
r:printArea()

-- extend

-- defina a subtype of Rectangle named Square
Square=Rectangle:new(nil,0,0)

-- define Square\'s function
function Square:new(o,l,w)
	o=o or Rectangle:new(o,l,w)
	setmetatable(o,self)
	self.__index=self
	return o
end

function Square:printArea()

	print('area:'..self.area)
end

zfx=Square:new(nil,2,2)
zfx:printArea()
