-- metatable

other={foo=3}

-- 将表/函数绑定到元表对象的__index元属性上，代表一个元表的索引
-- setmetatable(A,B) 表A代表一个目标表，表B代表一个元表，可以在元表中设置一些元属性，生成的结果p可以直接访问foo属性
local p=setmetatable({},{__index=other})
-- 访问元表__index元属性对应的other表的foo字段
print(p.foo)
-- 不存在属性
print(p.aa)


-- 1.在表中查找，如果找到，返回该元素，找不到则继续
-- 2.判断该表是否有元表，如果没有元表，返回 nil，有元表则继续。
-- 3.判断元表有没有 __index 方法，如果 __index 方法为 nil，则返回 nil；如果 __index 方法是一个表，则重复 1、2、3；如果 __index 方法是一个函数，则返回该函数的返回值。

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


-- __newindex 元方法用来更新元表，__index用来访问元表
-- define a metatable
mymetatable={}
-- set a table or function to meta attribute -> __newindex

print('--------------__newindex--------------')
mytable=setmetatable({key1='value1'},{__newindex=mymetatable})

print(mytable.key1)

-- 当元表中存在__newindex的时候，跳过为表设置属性，转而去执行__newindex指定的表或者函数
-- 表设置了元方法 __newindex，在对新索引键（newkey）赋值时（mytable.newkey = "新值2"），会调用元方法，而不进行赋值
-- 而如果对已存在的索引键（key1），则会进行赋值，而不调用元方法 __newindex。
mytable.newkey='value to metatable'
print(mytable.newkey,mymetatable.newkey)

-- 表mytable中有key1属性，但是元表中没有，所以元表的key1为nil
mytable.key1='new value1'

print(mytable.key1,mymetatable.key1)

-- rawset更新表字段
print('---------------------rawset---------------------')
mt=setmetatable({key1='value'},{__newindex=
	function(tab,k,v)
		rawset(tab,k,'[\''..v..'\']')
	end
})
-- 对于已有的key直接赋值，不走__newindex这个函数
mt.key1='new value1'
-- 对于没有的key，走__newindex元函数
mt.key2='new value2'
print(mt.key1,mt.key2)

-- max value of a table
-- __add其实就是类似于运算符重载，重新定义一个add的操作，相对于两个table来说
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
