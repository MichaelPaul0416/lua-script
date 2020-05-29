-- out reference

-- 通过dofile('path')加载lua文件进行使用
--[[dofile('basic.lua')
--showVersionFmt()]]

-- 通过require引入其他文件require(lua文件名，不带后缀)
local basic=require('basic')
if not basic then
	print('failed load other lua script')
	return
end

-- 这里可以使用require后面导出的名字.|:方法名(basic.showVersionFmt,basic:showVersionFmt)
-- 同时，被引入的模块，在导出的方法前面，需要加上模块名
str=basic.showVersionFmt()
print(str)


