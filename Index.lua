if true then	--The x[][] grid.
x = {}

x = {{5, 3, 4, 6, 7, 8, 9, 1, 2}
	,{6, 7, 2, 1, 9, 5, 3, 4, 8}
	,{1, 9, 8, 3, 4, 2, 5, 6, 7}
	,{8, 5, 9, 7, 6, 1, 4, 2, 3}
	,{4, 2, 6, 8, 5, 3, 7, 9, 1}
	,{7, 1, 3, 9, 2, 4, 8, 5, 6}
	,{9, 6, 1, 5, 3, 7, 2, 8, 4}
	,{2, 8, 7, 4, 1, 9, 6, 3, 5}
	,{3, 4, 5, 2, 8, 6, 1, 7, 9}
	}

end
function print_row(a)
	y = {}
	for i = 1, 9 do
		y[i] = x[a][i]
		if y[i] == 0 then
			y[i] = " "
		end
	end
	io.write("I "..y[1].." | "..y[2].." | "..y[3].." I "..y[4].." | "..y[5].." | "..y[6].." I "..y[7].." | "..y[8].." | "..y[9].." I");
	print()
end
function print_row_spec(a)
	if a == 0 then
		print("I---+---+---I---+---+---I---+---+---I")
	else
		print("#===========#===========#===========#")
	end
end
function print_box_row(a)
	print_row_spec(1)
	print_row(1+(3*(a-1)))
	print_row_spec(0)
	print_row(2+(3*(a-1)))
	print_row_spec(0)
	print_row(3+(3*(a-1)))
end
function print_board()
	os.execute("cls")
	print_box_row(1)
	print_box_row(2)
	print_box_row(3)
	print_row_spec(1)
end
