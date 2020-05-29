-- string
str1='str1'
str2="str2"
str3=[["str3"]]

print(str1,str2,str3,'\a')

str4='ABC'
print('upper->'..string.upper(str1))
print('lower->'..string.lower(str4))

-- string.gsub(main,find,replace,num) num means replace times when macthing str
str5='hello world'
print('string.gsub->'..string.gsub(str5,'o','0',1))

-- string.find(str,substr,[from,[to]])
print('string.find->'..string.find(str5,'o',1))

-- string.reverse
print('string.reverse->'..string.reverse('lua'))

-- string.char(...) 将整型数字转换成字符串然后链接
print('string.char->'..string.char(97,98,99))


-- string.byte(arg[,int]) 转换字符为整数，默认是第一个，int可以指定索引，负数的话从后往前取
print('string.byte->'..string.byte('ABC',3))


-- string.len(str) length of string
print('string.len->'..string.len('abc'))

-- string.rep(str,n) return repeat string for 3 times
print('string.rep->'..string.rep('abc',3))

-- string.gmatch(str,pattern) 返回一个迭代器函数，每次调用这个函数，返回一个在字符串str找到的下一个符合pattern描述的字串，如果没有找到，返回nil
function findEach(str)
	for word in string.gmatch(str,'%a+') do
		print('each word:'..word)
	end
end
findEach('hello world lua')

-- string.match(str,patten,init) 从字符串的init下标开始寻找符合pattern要求的字符串字串，返回第一个配对
print('string.match->'..string.match('i have 2 question for you.','%d+ %a+'))

-- %2d 格式化为两位，不足左补零
print(string.format('date forma %02d%02d%03d',2,1,2020))


print(string.match('hello$world$lua','%$',1))
