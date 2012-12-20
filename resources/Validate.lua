function get_box(a,b,c)
	local box_array = {0,0,0,0,0,0,0,0,0}
	local full_count = 0
	for j = 0,2 do
		for i = 0,2 do
			full_count = full_count + 1
			cell = x[((a*3)-j)][((b*3)-i)]
			box_array[full_count] = cell
		end
	end
	return box_array
end
function all_boxes(a,print_error)
	local out = 0
	for j = 1,3 do
		for i = 1,3 do
			if not unique(get_box(j,i)) then
				if print_error then
					io.write("Box ",j,".",i,", is wrong"); print()
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
function get_line(a)
	local out = 0
	if a > 9 then
		a = a - 9
		local temp = {x[1][a],x[2][a],x[3][a],x[4][a],x[5][a],x[6][a],x[7][a],x[8][a],x[9][a]}
		out = temp
	else
		out = x[a]
	end
	return out
end
function all_lines(input1,print_error)
	local out = 0
	local a = 0
	while a < 18 do
		a = a + 1
		if not unique(get_line(a),input1) then
			if print_error then
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



function check_board(a,print_error)
	all_lines(a,print_error); all_boxes(a,print_error)
	if all_lines(a) and all_boxes(a) then
		return true
	else
		return false
	end
end
function check_game(print_error)
	if check_board(false) and check_board(1) then --completed game
		if print_error then
			print("This game is completed!")
		end
		return true
	elseif check_board(false) and not check_board(1) then --uncompleted game
		print("This game looks good so far.")
		return true
	elseif not check_board(false) then --faulty game
		check_board(1,print_error)
		return false
	end
end
