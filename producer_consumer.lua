-- producer and consumer
-- define a function running in a new coroutine
-- implemention of producer and consumer model by method yield and resume of coroutine
local producer

local number=0

-- producer
function produce()
	while true and number<=10 do
		print('send:'..tostring(number))
		coroutine.yield(number)
	end
end


-- consumer
function consume()
	while true and number < 10 do
		status,value=coroutine.resume(producer)
		if status == 1 then
			print('resume coroutine[producer] failed')
			return
		end
		print('receive:'..value)
		number=number+1
	end
end

producer=coroutine.create(produce)

consume()
