-- array

function isArray(ary)
	return type(ary) == 'table'
end


a1={'lua','script','dynamic'}
function printArray(ary)
	if not isArray(ary) then
		print('input must be type table')
		return nil
	end

	for i=0,table.getn(ary) do
		print(ary[i])
	end
end

printArray(a1)

-- nagtive index for array
function negativeIndex(n,ary)
	a,b=0
	if n>=0 then
		a,b=-n,n
	else
		a,b=n,-n
	end

	if not isArray(ary) then
		print('input must be table')
		return
	end

	print(a,b)
	for i=a,b do
		ary[i]=i*i
	end

	for m=a,b do
		print(ary[m])
	end
end

negativeIndex(3,{})

-- iterator with status which recording index of current time
array={'google','lua','golang'}
function elementIterator(ary)
	local index=0
	local count=#ary

	return function()
		index=index+1
		if index <= count then
			return ary[index]
		end
	end
end

function echoArray(tab)
	for element in elementIterator(tab) do
		print(element)
	end
end

echoArray(array)
