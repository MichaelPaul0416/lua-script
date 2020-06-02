--oop
-- https://www.jianshu.com/p/b538e5d9a871
local tool=require('tool')

-- __call
--[[ 为什么需要多出一个ObjectConstructor？主要是因为元方法只对绑定其的变量有效，所以如果你直接在Object中实现__call元方法，然后调用Object()其实是不起作用的
因为它自身作为变量的时候就不是元表。因此才需要有一个ObjectConstructor作为Object的元表
--]]
local ObjectConstruct={}
ObjectConstruct.__call=function(type)
	local instance={}
	-- 指定生成实例对象的class属性
	instance.class=type
	setmetatable(instance,type.prototype)
	return instance
end



Object={}

-- set __call for Object
--[[我们也看到Object._call = ObjectConstructor.__call和Object::subClass()中的subtype.__call = ObjectConstructor.__call，这里表示类型还是要定义__call元方法的，目的是为了被子类化时，子类也要能够正常调用构造函数。]]
Object.__call=ObjectConstruct.__call
setmetatable(Object,ObjectConstruct)


--set meta func
Object.__index=Object


-- 采用javascript的prototype模式，将类型变量和实例变量分离
-- 把所有实例属性和实例方法定义到prototype中，类型变量中保留类属性和方法
-- 静态属性，属于类
Object.staticCount=0

-- constructor
function Object:create()
	Object.staticCount=Object.staticCount+1

	local instance={}
	-- self.prototype 就是instance这个实例
	setmetatable(instance,self.prototype)
	return instance
end

-- static method
function Object:instancesNumber()
	return Object.staticCount
end


-- instance area
Object.prototype={}

Object.prototype.__index=Object.prototype

Object.prototype.__gc=function(instance)
	print(instance,'destroy')
end

-- set instance attribute which initialized with value 123
Object.prototype.tag=123

-- tostring(instance method)
function Object.prototype:toString()
	-- print memory address of current instance
	return tostring(self)
end


local function innerTest()
	local obj=Object:create()
	print(obj:toString())
	tool.newLineWithTip('instance attribute')
	print(obj.tag)

	tool.newLineWithTip('static method')
	print(Object:instancesNumber())

	for i=1,3 do
		Object:create()
	end

	-- 至此产生了4个实例
	tool.newLineWithTip('static method')
	print(Object:instancesNumber())
end

-- 由于子类继承的时候不仅需要设置子类类自身的对象，还需要设置子类实例对象，比较繁琐，所以父类提供静态方法用户创建子类
function Object:subClass(typeName)
	--  _G是一张表，保存了lua所用的所有全局函数和全局变量
	_G[typeName]={}
	-- 以传入类型名称作为全局变量名称创建table
	local subType=_G[typeName]

	-- static
	subType.__index=subType
	-- 给子类的类对象设置一个super关键字，引用设置为当前类
	subType.super=self
	-- 设定__call，方便直接Object()调用
	subType.__call=ObjectConstruct.__call
	setmetatable(subType,self)

	-- instance
	subType.prototype={}
	subType.prototype.__index=subType.prototype
	-- call super class
	subType.prototype.__gc=self.prototype.__gc
	setmetatable(subType.prototype,self.prototype)

	return subType
end

return Object
