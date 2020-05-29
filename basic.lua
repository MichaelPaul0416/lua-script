-- basic module

basic={}

basic.version=1.0

basic.desc='basic module for lua'

-- private func and only can be called in current module
local function beforeCall()
	print(string.format('os dateTime:%s',os.date("%Y-%m-%d %H:%M:%S")))
end


-- public function named like module_name.module_function
-- 被导出的方法，前面必须跟上导出的模块名
function basic.showVersionFmt()
	-- call private function
	beforeCall()
	return string.format('this version is %d and it\'s %s',basic.version,basic.desc)
end


--print(showVersionFmt())

-- 作为被引入的模块，需要return
return basic
