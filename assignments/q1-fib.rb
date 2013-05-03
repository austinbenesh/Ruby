def fib(n, n1 = 1, n2 = 1)
	memo = Array.new;
	if n > 2
		return fib(n-2,n1,n2) + fib(n-1,n1,n2)
	elsif n == 1
		return n1
	elsif n == 2
		return n2
	end
 end

puts "results:"
puts fib(4,1,1)


