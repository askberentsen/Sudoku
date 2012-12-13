require "Unique"
require "Index"
require "socket"
function get_box(a,b)
	local box_array = {0,0,0,0,0,0,0,0,0}
	local full_count = 0
	for count = 0,2 do
		for count2 = 0,2 do
			full_count = full_count + 1
			cell = x[(a*3)-count][(b*3)-count2]
			if cell ~= " " then
				box_array[full_count] = 0 + cell
			end
		end

	end
	return unique(box_array)
end
function all_boxes()
	local out = 0
	for j = 1,3 do
		for i = 1,3 do
			if not get_box(j,i) then
				io.write("box "..j.."."..i.." is wrong"); print()
				out = out + 1
			end
		end
	end
	if out > 0 then
		return false
	else
		return true
	end
end
function get_line(a)
	local out = 0
	if a > 9 then
		a = a - 9
		local temp = {x[1][a],x[2][a],x[3][a],x[4][a],x[5][a],x[6][a],x[7][a],x[8][a],x[9][a]}
		out = unique(temp)
	else
		out = unique(x[a])
	end
	return out
end
function all_lines()
	local out = 0
	local a = 0
	while a < 18 do
		a = a + 1
		if not get_line(a) then
			io.write("line "..a.." is wrong"); print()
			out = out + 1
		end
	end
	if out  >= 1 then
		return false
	else
		return true
	end
end



function check_board()
	if all_lines() and all_boxes() then
		return true
	else
		return false
	end
end
time_start = os.clock()
print_board()
if check_board() then
	print("The sudoku board is complete!")
else
	print("The board is incomplete or faulty.")
end
--print(get_line(1));print(get_line(10))
print(os.clock()-time_start)
