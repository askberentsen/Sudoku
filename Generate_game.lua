require "insert"
function generate_game()
	if check_board() then
		for c = 1,(clock_random()*1000) do
			percentage = 89-(61+(math.random(20))) --7 -> 27
		end
		percentage_original = percentage
		generate = 81 - percentage
		while generate > 0 do
			if generate ~= update_percentage then
				os.execute("cls")
				io.write("game generating: "..(100-math.floor((generate/(81-percentage_original))*100)).."%")
			end
			update_percentage = generate
			compare_index()
			for a = 1,9 do
				for b = 1,9 do
					if math.random(81) <= generate and (index_validate[a][b] == 1 or index_validate[a][b] == "1") and math.random(83) == 1 then
						generate = generate - 1
						x[a][b] = 0
					end
				end
			end
		end
		print()
	end
end
function clock_random()
	local out = 0
	if os.clock() >= 1 then
		out = os.clock()-math.floor(os.clock())
	else
		out = os.clock()
	end
	return out
end
