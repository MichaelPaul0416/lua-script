-- for range

function forrange()
	-- ��һ�������ǿ�ʼ�������ڶ�����ѭ���Ľ����������������ǲ���
	for i=10,0,-1 do
		print(i)
	end
end

forrange()


-- ���͵�ѭ��
obj={name='lua',types='script',env='server'}
for k,v in pairs(obj) do
	print(k..'->'..v)
end


-- repeat until
n=1
repeat
	print(n)
	n=n+1
until(n>3)

-- if == 0
if(0) then
	print('0 is true')
else
	print('0 is false')
end

-- if -- elseif
a=9
if(a<3) then
	print('a['..a..'] < 3')
elseif(a<6) then
	print('a['..a..'] between 3 and 6')
else
	print('a['..a..'] > 6')
end
