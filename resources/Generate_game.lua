function generate_game(a)
	math.randomseed( tonumber(tostring(os.time()*os.clock()+seed()):reverse():sub(1,6)) )
	if check_board(true) then
		local seed_generate = seed()
		local seed_percentage = 0
		if seed_percentage > 20 then
			while seed_percentage > 20 do
				seed_percentage = seed_percentage/10
			end
		end
		for c = 1,(seed()/1000) do
			percentage = 93-(61+(math.random(20))) --7 -> 27
		end
		local percentage_original = percentage
		local generate = 81 - percentage
		local update_percentage = 0
		while generate > 0 do
			if generate ~= update_percentage then
				if a then
					os.execute("cls")
					io.write("game generating: "..(100-math.floor((generate/(81-percentage_original))*100)).."%")
				end
			end
			update_percentage = generate
			compare_index()
			for a = 1,9 do
				for b = 1,9 do
					if math.random(81) <= generate and (index_validate[a][b] == 1 or index_validate[a][b] == "1") and math.random(seed_generate) <= 101 then
						generate = generate - 1
						x[a][b] = 0
					end
				end
			end
		end
		print()
	end
end
function seed()
	local t1 = os.clock()
	local out = 0
	while true do
		if os.clock() - t1 >= 1/32 then
			break
		end
		out = out + 1
	end
	while out > 100000 do
		out = out / 10
	end
	while out < 1000 do
		out = out * 10
	end
	return out
end
function write_index(a)
	local file = io.open("sudoku_index.txt","r")
	local file_read = file:read()
	local file_size = file_read:len()
	local index = index_count(file_size,112)
	local exist = false
	for o = 1,index do				--This method is inneficient. Please revisit the code later.
		local count = 0
		local index_array = read_index(o)
		for j = 1,9 do
			for i = 1,9 do
				--print(a[j][i],  index_array[j][i])
				if 0+a[j][i] == force_common(index_array[j][i]) then
					count = count + 1
				end
			end
		end
		if count == 81 then
			exist = true
			break
		end
	end
	file:close()
	if not exist then
		local game = io.open("resources/sudoku_index.txt","a")
		local new_array = (file_size/112)+1
		game:write("#",new_array)
		for j = 1,9 do
			game:write("&",j,">")
			for i = 1,9 do
				game:write(a[j][i])
			end
		end
		game:write("%",new_array)
		game:close()
	end
end
function force_common(a)
	out = 0
	if a =="1" then
		out = 1
	elseif a == "2" then
		out = 2
	elseif a == "3" then
		out = 3
	elseif a == "4" then
		out = 4
	elseif a == "5" then
		out = 5
	elseif a == "6" then
		out = 6
	elseif a == "7" then
		out = 7
	elseif a == "8" then
		out = 8
	elseif a == "9" then
		out = 9
	else
		out = a
	end
	return out
end
function read_index(a)
	local file = io.open("resources/sudoku_index.txt")
	local file_read = file:read()
	local file_size = file_read:len()
	local out = false
	if (file_size%112) == 0 then
		array_count = index_count(file_size,112)
		if a > array_count then
			a = array_count
		elseif a < 1 then
			a = 1
		end
		local array_pos = file_read:sub(((a-1)*112)+1)
		local array_full = array_pos:sub(1, 112)
		local temporary_array = {{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}
						  ,{0,0,0, 0,0,0, 0,0,0}}
		for j = 1,9 do
			local line = ("&"..j..">")
			local array_line_start = array_full:find(line)+3
			local array_line_full = array_full:sub(array_line_start,array_line_start+8)
			for i = 1,9 do
				local array_field = array_line_full:sub(i,i)
				temporary_array[j][i] = array_field
			end
		end
		out = temporary_array
	else
		print("malformed file")
	end
	file:close()
	return out
end
function index_count(a,b)
	local out = 0
	while a >= b do
		out = out + 1
		a = a - b
	end
	return out
end
function import(a)
	x = a
end
function index_all()
	local file = io.open("resources/sudoku_index.txt")
	local size = file:read()
	local length = (size:len())/112
	return length
end

function import_random()
	math.randomseed( tonumber(tostring(os.time()*os.clock()+seed()):reverse():sub(1,6)) )
	local count = index_all()
	math.random()
	local file = math.random(count)
	import(read_index(file))
end
