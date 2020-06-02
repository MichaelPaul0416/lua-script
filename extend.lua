-- extends
local Object=require('Object')

-- define sub class
Person={}
-- 子类类对象自身绑定
Person.__index=Person
setmetatable(Person,Object)

-- 子类实例对象绑定
Person.prototype={}
Person.prototype.__index=Person.prototype
setmetatable(Person.prototype,Object.prototype)

Person.prototype.name=''

Person.prototype.age=0

function Person.prototype:toString()
	return string.format('Person[name:%s,age:%d]\n',self.name,self.age)
end

-- 下面代码中没有看到Person类型定义create方法，但是能够正常被调用并生成对象，这得益于Object的create方法绑定元表的操作使用的是self而不是指定类型
local person=Person:create()
-- 这里的tool由于是关联了元表，所以使用的是符类Object的tool
tool.newLineWithTip('访问父类的成员变量')
print(person.tag)
tool.newLineWithTip('访问父类的类变量')
print(Person:instancesNumber())
tool.newLineWithTip('self tostring')

person.name='michael'
person.age=1
-- instance:method() <-> instance.method(instance)
print(person:toString())


-- create instance by super:subclass
tool.newLineWithTip('define a new sub class with super method Object:subClass')
Object:subClass('Animal')
Animal.prototype.name=''
Animal.prototype.belong=''


function Animal.prototype:toString()
	-- 通过TypeName.super.prototype.method来调用父类实例的方法
	local ss=Animal.super.prototype.toString(self)
	print('super\'s toString:'..ss)
	return string.format('Animal[name=%s,belong=%s]\n',self.name,self.belong)
end


local animal=Animal:create()
animal.name='tiger'
animal.belong='哺乳类'
print(animal:toString())

tool.newLineWithTip('call Constructor directive')
-- 通过指定一个ObjectConstructor={}的元表并且为其__call绑定创建对象的方法，然后将Object绑定到这个元表上实现
print(Object().tag)
