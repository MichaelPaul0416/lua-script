-- extends
local Object=require('Object')

-- define sub class
Person={}
-- ��������������
Person.__index=Person
setmetatable(Person,Object)

-- ����ʵ�������
Person.prototype={}
Person.prototype.__index=Person.prototype
setmetatable(Person.prototype,Object.prototype)

Person.prototype.name=''

Person.prototype.age=0

function Person.prototype:toString()
	return string.format('Person[name:%s,age:%d]\n',self.name,self.age)
end

-- ���������û�п���Person���Ͷ���create�����������ܹ����������ò����ɶ����������Object��create������Ԫ��Ĳ���ʹ�õ���self������ָ������
local person=Person:create()
-- �����tool�����ǹ�����Ԫ������ʹ�õ��Ƿ���Object��tool
tool.newLineWithTip('���ʸ���ĳ�Ա����')
print(person.tag)
tool.newLineWithTip('���ʸ���������')
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
	-- ͨ��TypeName.super.prototype.method�����ø���ʵ���ķ���
	local ss=Animal.super.prototype.toString(self)
	print('super\'s toString:'..ss)
	return string.format('Animal[name=%s,belong=%s]\n',self.name,self.belong)
end


local animal=Animal:create()
animal.name='tiger'
animal.belong='������'
print(animal:toString())

tool.newLineWithTip('call Constructor directive')
-- ͨ��ָ��һ��ObjectConstructor={}��Ԫ����Ϊ��__call�󶨴�������ķ�����Ȼ��Object�󶨵����Ԫ����ʵ��
print(Object().tag)
