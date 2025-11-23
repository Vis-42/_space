function sum_of_square(n)
    sum=0
    for i in 1:n
        sum+=i*i
    end
    sum
end
println(sum_of_square(2^50))