-- simple oop

local tool=require('tool')

ori={key='world'}

meta=setmetatable(ori,{
	__newindex=function(tab,k,v)
		print('current value:'..v)
		rawset(tab,k,v)
	end,
	__index=function(t,k)
		print('visit value not existed in origin table:'..k)
		return '['..tostring(k)..']'
	end,
	__call=function(...)
		-- convert to table
		local t={...}
		local c=#t
		local sum=0
		for i,v in ipairs(t) do
			if type(v) ~= 'num' then
				err=string.format('index[%d]\'s value must be a number but find[%s] now',i,v)
				error(err)
			end

			sum=sum+v
		end
		print('array\'s length:'..tostring(c))
		return v
	end
})

-- 如果原来的表中已经存在key，然后赋值的话，是不会走元表的__newindex方法，只有没有的时候，才会走
meta.key='new value'
meta.newkey='first value'
print(ori.key,ori.newkey)

meta.sum=0
meta.sum(1)

