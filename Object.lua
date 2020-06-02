--oop
-- https://www.jianshu.com/p/b538e5d9a871
local tool=require('tool')

-- __call
--[[ Ϊʲô��Ҫ���һ��ObjectConstructor����Ҫ����ΪԪ����ֻ�԰���ı�����Ч�����������ֱ����Object��ʵ��__callԪ������Ȼ�����Object()��ʵ�ǲ������õ�
��Ϊ��������Ϊ������ʱ��Ͳ���Ԫ����˲���Ҫ��һ��ObjectConstructor��ΪObject��Ԫ��
--]]
local ObjectConstruct={}
ObjectConstruct.__call=function(type)
	local instance={}
	-- ָ������ʵ�������class����
	instance.class=type
	setmetatable(instance,type.prototype)
	return instance
end



Object={}

-- set __call for Object
--[[����Ҳ����Object._call = ObjectConstructor.__call��Object::subClass()�е�subtype.__call = ObjectConstructor.__call�������ʾ���ͻ���Ҫ����__callԪ�����ģ�Ŀ����Ϊ�˱����໯ʱ������ҲҪ�ܹ��������ù��캯����]]
Object.__call=ObjectConstruct.__call
setmetatable(Object,ObjectConstruct)


--set meta func
Object.__index=Object


-- ����javascript��prototypeģʽ�������ͱ�����ʵ����������
-- ������ʵ�����Ժ�ʵ���������嵽prototype�У����ͱ����б��������Ժͷ���
-- ��̬���ԣ�������
Object.staticCount=0

-- constructor
function Object:create()
	Object.staticCount=Object.staticCount+1

	local instance={}
	-- self.prototype ����instance���ʵ��
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

	-- ���˲�����4��ʵ��
	tool.newLineWithTip('static method')
	print(Object:instancesNumber())
end

-- ��������̳е�ʱ�򲻽���Ҫ��������������Ķ��󣬻���Ҫ��������ʵ�����󣬱ȽϷ��������Ը����ṩ��̬�����û���������
function Object:subClass(typeName)
	--  _G��һ�ű�������lua���õ�����ȫ�ֺ�����ȫ�ֱ���
	_G[typeName]={}
	-- �Դ�������������Ϊȫ�ֱ������ƴ���table
	local subType=_G[typeName]

	-- static
	subType.__index=subType
	-- ����������������һ��super�ؼ��֣���������Ϊ��ǰ��
	subType.super=self
	-- �趨__call������ֱ��Object()����
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
