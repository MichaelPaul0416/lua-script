-- metatable

other={foo=3}

-- ����/�����󶨵�Ԫ������__indexԪ�����ϣ�����һ��Ԫ�������
-- setmetatable(A,B) ��A����һ��Ŀ�����B����һ��Ԫ��������Ԫ��������һЩԪ���ԣ����ɵĽ��p����ֱ�ӷ���foo����
local p=setmetatable({},{__index=other})
-- ����Ԫ��__indexԪ���Զ�Ӧ��other���foo�ֶ�
print(p.foo)
-- ����������
print(p.aa)


-- 1.�ڱ��в��ң�����ҵ������ظ�Ԫ�أ��Ҳ��������
-- 2.�жϸñ��Ƿ���Ԫ�����û��Ԫ������ nil����Ԫ���������
-- 3.�ж�Ԫ����û�� __index ��������� __index ����Ϊ nil���򷵻� nil����� __index ������һ�������ظ� 1��2��3����� __index ������һ���������򷵻ظú����ķ���ֵ��

print('--------------__index--------------')
tf=setmetatable({key1='hello'},{__index=
	function(tab,key)
		if key == 'key2' then
			return 'value in metatable function'
		end
		return nil
	end
})
print('key in metatable--')
print(tf.key1,tf.key2)


-- __newindex Ԫ������������Ԫ��__index��������Ԫ��
-- define a metatable
mymetatable={}
-- set a table or function to meta attribute -> __newindex

print('--------------__newindex--------------')
mytable=setmetatable({key1='value1'},{__newindex=mymetatable})

print(mytable.key1)

-- ��Ԫ���д���__newindex��ʱ������Ϊ���������ԣ�ת��ȥִ��__newindexָ���ı���ߺ���
-- ��������Ԫ���� __newindex���ڶ�����������newkey����ֵʱ��mytable.newkey = "��ֵ2"���������Ԫ�������������и�ֵ
-- ��������Ѵ��ڵ���������key1���������и�ֵ����������Ԫ���� __newindex��
mytable.newkey='value to metatable'
print(mytable.newkey,mymetatable.newkey)

-- ��mytable����key1���ԣ�����Ԫ����û�У�����Ԫ���key1Ϊnil
mytable.key1='new value1'

print(mytable.key1,mymetatable.key1)

-- rawset���±��ֶ�
print('---------------------rawset---------------------')
mt=setmetatable({key1='value'},{__newindex=
	function(tab,k,v)
		rawset(tab,k,'[\''..v..'\']')
	end
})
-- �������е�keyֱ�Ӹ�ֵ������__newindex�������
mt.key1='new value1'
-- ����û�е�key����__newindexԪ����
mt.key2='new value2'
print(mt.key1,mt.key2)

-- max value of a table
-- __add��ʵ������������������أ����¶���һ��add�Ĳ��������������table��˵
print('------------------merge table------------------')
function maxTableValue(tab)
	local trail=0
	for i,v in pairs(tab) do
		if trail < v then
			trail=v
		end
	end
	return trail
end

-- define merge table
addMetaTable=setmetatable({1,2,3},{__add=
	function(first,second)
		print('merging table size:'..#second)
		for i=1,#second do
			-- insert
			local fi=#first+1
			table.insert(first,fi,second[i])
			local str=''
			for a,b in pairs(first) do
				str=str..string.format('%d\t',b)
			end
			print('first:'..str)
		end
		return first
	end
})
secondTable={7,8,9}
addMetaTable=addMetaTable+secondTable

for k,v in pairs(addMetaTable) do
	print('k:'..k..'/v:'..v)
end


-- rewrite string method
print('---------------------rewrite tostring for table---------------------')
fir=setmetatable({key1='one',key2='two',key3=3},{__tostring=
	function(tab)
		local str=''
		for k,v in pairs(tab) do
			if str == '' and v ~= '' then
				str=k..'='..v
			else
				str=str..k..'='..v
			end
			str=str..';'
		end
		return '['..str..']'
	end
})
-- print specific string for table created by method setmetatable
print(fir)
-- print memory address of table
print({key1='hello',key2='world'})
