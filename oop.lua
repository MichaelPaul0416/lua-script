-- oop
-- Ԫ��
Rectangle={area=0,length=0,width=0}

--������ķ���new
function Rectangle:new(o,length,width)
	print(type(o))
	-- o�����nil�Ļ�����false�ķ�֧��ֻ��o���ǿգ�����true
	-- �����if-else��Ч����[--o=o or {}]Ч��һ��
	if o then
		print('not nil is true')
		o=o
	else
		print('nil is false')
		o={}
	end

	m=setmetatable(o,self)
	-- m��Ԫ��self���ɵ��ӱ�
	print(m,self)
	-- ���÷����������������Լ�����
	self.__index=self
	self.length=length or 0
	self.width=width or 0
	self.area=length*width
	return o
end

function Rectangle:printArea()
	-- self ����ʵ������
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
