-- out reference

-- ͨ��dofile('path')����lua�ļ�����ʹ��
--[[dofile('basic.lua')
--showVersionFmt()]]

-- ͨ��require���������ļ�require(lua�ļ�����������׺)
local basic=require('basic')
if not basic then
	print('failed load other lua script')
	return
end

-- �������ʹ��require���浼��������.|:������(basic.showVersionFmt,basic:showVersionFmt)
-- ͬʱ���������ģ�飬�ڵ����ķ���ǰ�棬��Ҫ����ģ����
str=basic.showVersionFmt()
print(str)


