-- basic module

basic={}

basic.version=1.0

basic.desc='basic module for lua'

-- private func and only can be called in current module
local function beforeCall()
	print(string.format('os dateTime:%s',os.date("%Y-%m-%d %H:%M:%S")))
end


-- public function named like module_name.module_function
-- �������ķ�����ǰ�������ϵ�����ģ����
function basic.showVersionFmt()
	-- call private function
	beforeCall()
	return string.format('this version is %d and it\'s %s',basic.version,basic.desc)
end


--print(showVersionFmt())

-- ��Ϊ�������ģ�飬��Ҫreturn
return basic
