a = 5
-- declare a local parameter
local b = 5
function joke()
	c = 5
	local d = 6
	-- �����ڿ��Կ����ⲿ�ľֲ�����b
	print(a,b,d)
end

joke()

-- ��ʱ�������ֲ�����d����Ϊ�������Ǻ���joke�ڲ�
print(c,d)

do
	local a = 6 -- �ֲ�����
	b = 6 -- ������ľֲ�������ֵ
	print(a,b)
end

-- ��ӡ�ⲿ�ľֲ�����
print(a,b)


-- ������ֵ  [..�������ǽ�ǰ�������ַ���ƴ��]
str1 = 'hello'..'world'
print(str1)

-- Ҳ���Ժ�golangһ������ֶ�һ�鸳ֵ
str1,str2 = 'hello','world'
print(str1..'->'..str2)

-- swap
x,y=1,2
x,y=y,x
print(x..'-'..y)

-- ���������͵Ⱥ��ұߵ�ֵ�ĸ�����һ����ʱ���ԵȺ���ߵı����ĸ���Ϊ׼
a,b = 1,2,3
print(a,b)
a,b,c=1
print(a,b,c)

-- ��������table
t1={name='tom',address='cat',full='web'}
-- �������ַ��ʷ�ʽЧ��һ��
print(t1['name'],t1.name)
