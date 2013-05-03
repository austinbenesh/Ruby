def sort(arr)
	curIndex = 0
	while curIndex < arr.length do
		minIndex = curIndex
		for i in curIndex+1...arr.length
			if arr[i] < arr[minIndex]
				minIndex = i
			end
		end
		tmp = arr[curIndex]
		arr[curIndex] = arr[minIndex]
		arr[minIndex] = tmp
		curIndex = curIndex + 1
	end
	return arr
end

puts "results:"
puts sort(["a","c","b","e"])
puts sort([3,1,2,7])

