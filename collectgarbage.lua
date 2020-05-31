-- collectgarbage
mytable={'apple','pear','peach','grape','melon','banana','orange','water melon'}

-- print memory with K
print(collectgarbage('count'))

--set nil
mytable=nil

print(collectgarbage('count'))

-- collectgarbage
print(collectgarbage('collect'))

-- print again
print(collectgarbage('count'))
