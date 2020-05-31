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
	-- �Ը��ӵķ�ʽ��ֻд�ļ������ļ������ڣ���Ὠ�����ļ�������ļ����ڣ�д������ݻᱻ�ӵ��ļ�β�����ļ�ԭ�ȵ����ݻᱻ��������EOF��������
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
			io.read(arg):arg�Ĳ���ֵ
			*n:��ȡһ�����ֲ��ҷ���
			*a:��ǰλ�ö�ȡ�����ļ�
			*l:��ȡһ�У��ļ�β(EOF)����nil
			number:����ָ���ַ������ַ�������EOF����nil

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
-- ��ͬһʱ����Ҫ�������ļ���ʹ��file:func����io.func��Ӧ�ķ���
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

-- simple action,��ֻ���ķ�ʽ���ļ��������ļ��������
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
