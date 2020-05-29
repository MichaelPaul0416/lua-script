-- for range

function forrange()
	-- 第一个参数是开始条件，第二个是循环的结束条件，第三个是步长
	for i=10,0,-1 do
		print(i)
	end
end

forrange()


-- 泛型的循环
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
