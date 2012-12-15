require "Validate"
index_validate = {{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 ,{0,0,0, 0,0,0, 0,0,0}
				 }
function compare_field(a,b)
	if x[a][b] == 0 or x[a][b] == "0" then
		index_validate[a][b] = 0
	else
		index_validate[a][b] = 1
	end
end
function compare_index()
	for j = 1,9 do
		for i = 1,9 do
			compare_field(j,i)
		end
	end
end
function validate_field(a,b)
	if index_validate[a][b] == 1 then
		return false
	else
		return true
	end
end
function insert_field(a,b,c)
	if validate_field(a,b) then
		x[a][b] = c
	else
		print("You cannot change this field")
	end
end

