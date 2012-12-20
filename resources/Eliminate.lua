function get_loc_from_field(a,b)
	local temp = x
	local temp_field = x[a][b]
	local possibilities = {0,0,0, 0,0,0, 0,0,0}
	if validate_field(a,b) then
		for j = 1,9 do
			x[a][b] = j
			if unique(get_box(math.ceil(a/3),math.ceil(b/3))) and unique(get_line(a)) and unique(get_line(9+b)) then
				possibilities[force_common(x[a][b])] = force_common(x[a][b])
			end
		end
	else
		possibilities[force_common(x[a][b])] = x[a][b]
	end
	x[a][b] = temp_field
	return possibilities
end
function print_possibilities(a,b,c)
	for j = 1,9 do
		if force_common(a[j]) == 0 then
			a[j] = " "
		end
	end
	print()
	io.write("+----------------------+#===========#");print()
	io.write("| Box ",math.ceil(b/3),".",math.ceil(c/3),"              |I ",a[1]," | ",a[2]," | ",a[3]," I");print()
	io.write("| Line ",b,"               |I---+---+---I");print()
	io.write("| Line ",c+9,"              |I ",a[4]," | ",a[5]," | ",a[6]," I");print()
	io.write("|                      |I---+---+---I");print()
	io.write("|                      |I ",a[7]," | ",a[8]," | ",a[9]," I");print()
	io.write("+----------------------+#===========#");print()
end
function count_possibilities(a)
	local count = 0
	for j = 1,9 do
		if force_common(a[j]) == j then
			count = count + 1
		end
	end
	return count
end
function get_n(a)
	local out = 0
	if count_possibilities(a) == 1 then
		for j = 1,9 do
			if force_common(a[j]) == j then
				out = j
			end
		end
	end
	return out
end
function replace_if_single(a,b)
	if x[a][b] == 0 then
		local temp = get_loc_from_field(a,b)
		if count_possibilities(temp) == 1 then
		x[a][b] = get_n(temp)
		end
	end
end
function eliminate_from_box()
end
function eliminate_from_line()
end
