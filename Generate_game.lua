require "insert"
function generate_game()
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
				os.execute("cls")
				io.write("game generating: "..(100-math.floor((generate/(81-percentage_original))*100)).."%")
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
--seed() is system depentant. Debugging is apreciated.
--reset_board();generate_game();print_board()
