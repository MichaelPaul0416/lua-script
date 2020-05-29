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

-- string.char(...) ����������ת�����ַ���Ȼ������
print('string.char->'..string.char(97,98,99))


-- string.byte(arg[,int]) ת���ַ�Ϊ������Ĭ���ǵ�һ����int����ָ�������������Ļ��Ӻ���ǰȡ
print('string.byte->'..string.byte('ABC',3))


-- string.len(str) length of string
print('string.len->'..string.len('abc'))

-- string.rep(str,n) return repeat string for 3 times
print('string.rep->'..string.rep('abc',3))

-- string.gmatch(str,pattern) ����һ��������������ÿ�ε����������������һ�����ַ���str�ҵ�����һ������pattern�������ִ������û���ҵ�������nil
function findEach(str)
	for word in string.gmatch(str,'%a+') do
		print('each word:'..word)
	end
end
findEach('hello world lua')

-- string.match(str,patten,init) ���ַ�����init�±꿪ʼѰ�ҷ���patternҪ����ַ����ִ������ص�һ�����
print('string.match->'..string.match('i have 2 question for you.','%d+ %a+'))

-- %2d ��ʽ��Ϊ��λ����������
print(string.format('date forma %02d%02d%03d',2,1,2020))


print(string.match('hello$world$lua','%$',1))
