require "Unique"
require "Index"
function get_box(a,b,c)
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
	return unique(box_array,c)
	--a[(x*3)-2][(y*3)-2]
	--
end
function all_boxes(a,b)
	local out = 0
	for j = 1,3 do
		for i = 1,3 do
			if not get_box(j,i,a) then
				if b then
					io.write("box "..j.."."..i.." is wrong"); print()
				end
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
function get_line(a,b)
	local out = 0
	if a > 9 then
		a = a - 9
		local temp = {x[1][a],x[2][a],x[3][a],x[4][a],x[5][a],x[6][a],x[7][a],x[8][a],x[9][a]}
		out = unique(temp,b)
	else
		out = unique(x[a],b)
	end
	return out
end
function all_lines(input1, input2)
	local out = 0
	local a = 0
	while a < 18 do
		a = a + 1
		if not get_line(a,input1) then
			if input2 then
				io.write("line "..a.." is wrong"); print()
			end
			out = out + 1
		end
	end
	if out  >= 1 then
		return false
	else
		return true
	end
end



function check_board(a,b)
	if all_lines(a,b) and all_boxes(a,b) then
		return true
	else
		return false
	end
end
function check_game(a)
	if check_board() and not check_board(true) then
		if a then
			print("Looks good so far.")
		end
		return true
	elseif check_board() and check_board(true) then
		if a then
			print("The game is completed!")
		end
		return true
	else
		if a then
			check_board(true,true)
		end
		return false
	end
end
