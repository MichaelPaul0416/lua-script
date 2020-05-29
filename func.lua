-- function

-- compare function

function max(num1,num2)
	if num1 > num2 then
		result = num1
	else
		result = num2
	end
	return result
end


print('compare 10 with 9:'..max(10,9))


-- function as a argument into func

function addDouble(num1,func)
	return num1 + func(num1,num1-2)
end

print('addDouble:'..addDouble(3,
	function(a,b)
		return a * b
	end
	))

-- multi return value
function multi(num,ary)
	for index,value in pairs(ary) do
		if value == num then
			match = true
			break
		end

	end

	if match then
		return true,num
	else
		return false,-1
	end
end

ary={1,2,3,4,5}
print(multi(3,ary))

print('\n')

-- changable parameter list
function apply(...)
	local s=0

	-- pairs(...) can alse be replaced with ipairs{...}
	for i,v in pairs(...) do
		s = s+v
	end
	return s
end

print(apply({1,2,3,4}))


-- set changable param list to a temp argument
function avg(...)
	rs=0
	local tmp={...}
	for k,v1 in ipairs(tmp) do
		rs=rs+v1
	end

	-- [[#tmp means count of param list]]
	print('#tmp\'s count ->('..#tmp..')')
	-- get count of changable param list wuth func select("#",...)
	print('select("#",...)->'..select("#",...))
	return rs/#tmp
end

print(avg(1,2,3,4,5))

-- both parameter and changable parameter list
function bothParam(num1,...)
	local tmp=num1
	for i,v in pairs(...) do
		tmp=tmp+v
	end
	return tmp
end

-- {2,3,4,5} as a table not changable param list, and so select('#',{2,3,4,5})=1 not 4
print('sum:'..bothParam(1,{2,3,4,5}))

--[[
	select('#',...):return length of changable param list's length
	select(n,...):return ...[n] -> ...[select('#',...)]
--]]
function subArray(n,tab)
	-- length of table:table.getn
	p=table.getn(tab)
	print('length:'..p)
	if n<= 0 or n >p then
		print('illegal parameter n['..n..'] and it should between [1] and ['..p..']')
		return nil
	end

	tmp={}
	for i,v in ipairs(tab) do
		if i>= n then
			tmp[i]=v
		end
	end
	return tmp
end


function printTable(tab)

	if type(tab) == 'nil' then
		print('empty table')
		return
	end

	for k,v in pairs(tab) do
		print('key->'..k..'/value->'..v)
	end
end

local sa=subArray(3,{1,2,3,4,5})

print(printTable(sa))
