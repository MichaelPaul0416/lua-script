-- basic tool

tool={}

function tool.newLineWithTip(tip)
	local line='----------------------'
	if tip == 'nil' or tip == '' then
		print(line..line)
	else
		print(line..'['..tip..']'..line)
	end
end

-- whether nil or not
function tool.checkNil(obj)
	return type(obj)=='nil'
end

-- whether table or not
function tool.checkTable(tab)
	if tool.checkNil(tab) == 0 then
		print('empty table')
		return false,nil
	end

	return type(tab)=='table',type(tab)
end


-- print table
function tool.printTable(tab)
	b,t=tool.checkTable(tab)
	if b==1 then
		print('argument must be table but find type:'..t)
		return
	end

	local s=''
	for k,v in pairs(tab) do
		if s=='' and v ~= '' then
			s=k..'/'..v
		else
			s=s..';'..k..'/'..v
		end
	end
	return '['..s..']'
end




return tool
