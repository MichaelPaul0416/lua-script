-- table

tab={'hello','coding','script','lua'}

function printTable(tab)
	if type(tab) ~= 'table' then
		print('need table')
		return
	end

	s=''
	for k,v in pairs(tab) do
		if s == '' then
			s=v
		else
			s=s..'->'..v
		end
	end

	return s
end

-- table.concat
print(table.concat(tab,'_'))
print(printTable(tab))


-- table.insert(tablle,[position],value) position可选，默认是table末尾
table.insert(tab,3,'dynamic')
print(table.concat(tab,'_'))
print(printTable(tab))

-- table.remove(tab,[postion]) position可选，默认为table的长度，也就是最后一个
table.remove(tab,4)
print(table.concat(tab))
print(printTable(tab))


-- table.sort(table)
table.sort(tab)
print(printTable(tab))
