function is_full(a,b)
	if b then
		if (table.getn(a) == 9) and not has_empty(a) then
			return true
		else
			return false
		end
	else
		if (table.getn(a) == 9) then
			return true
		else
			return false
		end
	end
end
function has_empty(a)
	local out = 0
	for x = 0,9 do
		if a[x] == 0 or a[x] == "0" then
			out = out + 1
		end
	end
	if out > 0 then
		return true
	else
		return false
	end
end
function unique(a,b)
	--First Unique checks with index_condition() if the input given (a), has both 9 numbers, no less, no more. And if a[] is equeal to " ". if any of these
	--conditions is forfilled, unique stops the operation, and returns false.
	--Unique() works out the answer by going through all nine numbers in (), and comparing them to a all numbers from 1 to 9.
	--Then if unique() finds a connection, it adds 1 to a new index. A binary index is created.
	--If unique() finds two numbers who are the same, the binary index is broken. and later Unique() revisits this binary index. and if it is now broken
	--The output is false.
	if is_full(a,b) then
		local out = 0
		local count_unique = {0,0,0,0,0,0,0,0,0}
		for count = 1,9 do	--This method is ineffective, please revisit this code later.
			for j = 1,9 do
				if a[count] == j then
					count_unique[j] = count_unique[j] + 1
				end
			end
			if count >= 9 then
				break
			end
		end
		for count = 1,9 do
			if count_unique[count] > 1 then
				out = out + 1
			end
		end
		if out > 0 then
			return false
		else
			return true
		end
	else
		return false
	end
end
