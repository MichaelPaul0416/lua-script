-- file i/o

local tool=require('tool')

local file

local function closeFile(f,simple)
	if tool.checkNil(f) then
		print('nil file')
	else
		if simple then
			io.close(f)
		else
			file:close()
		end
	end
end

function simple(file,module)
	file=io.open(file,module)


	-- set input
	io.input(file)


	-- print the first line
	print(io.read())

	closeFile(file,true)
end


function simpleAppendFile(f)
	-- not nil
	if tool.checkNil(file) == 1 then
		io.close(file)
		file=nil
	end

	-- a means append
	-- 以附加的方式打开只写文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾，即文件原先的内容会被保留。（EOF符保留）
	fp=io.open(f,'a')

	-- set output
	io.output(fp)

	-- write
	io.write('\na script which is like C language and running on the server')

	closeFile(fp,true)
end

function readFullFile(f)
	if tool.checkNil(f) == 1 then
		io.close(file)
		file=nil
	end

	fp=io.open(f,'r')

	io.input(fp)

	local str
	num=0
	while true do
		--[[
			io.read(arg):arg的参数值
			*n:读取一个数字并且返回
			*a:当前位置读取整个文件
			*l:读取一行，文件尾(EOF)返回nil
			number:返回指定字符数的字符串，在EOF返回nil

		--]]
		str=io.read('*l')
		if type(str)=='nil' then
			break
		end
		num=num+1
		print('line['..num..']:'..str)
	end

	closeFile(fp,true)
end

-- full module
-- 在同一时间需要处理多个文件，使用file:func代替io.func对应的方法
function fullModule(f)
	if tool.checkNil(file) == 1 then
		file:close()
		file=nil
	end

	file=io.open(f,'r+')

	-- print first line
	print(file:read())

	closeFile(file,false)
end

-- auto read file line by line
function autoReadFile(fp)
	if tool.checkNil(file) == 1 then
		file:close()
		file=nil
	end

	file=io.open(fp,'r')
	for line in file:lines(fp) do
		print('--'..line..'--')
	end
	closeFile(file,false)
end

-- simple action,以只读的方式打开文件，并且文件必须存在
tool.newLineWithTip('read file with simple module')
simple('info.txt','r')

-- append module
tool.newLineWithTip('append content to file')
simpleAppendFile('info.txt')

-- read the hold file by line
tool.newLineWithTip('read the hole file line by line')
readFullFile('info.txt')

-- full module
tool.newLineWithTip('full module')
fullModule('info.txt')

-- io.lines
tool.newLineWithTip('io.lines')
autoReadFile('info.txt')
