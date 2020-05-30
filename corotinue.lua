-- coroutine

-- create a coroutine
co=coroutine.create(
		function(a,b)
			print('input arg:['..a..','..b..']')
		return a + b
	end
)

result,value=coroutine.resume(co,1,2)
print('coroutine result status:'..tostring(result)..' and value is :'..value)

