function ndgrid{T}(v1::AbstractVector{T}, v2::AbstractVector{T})
    m, n = length(v1), length(v2)
    v1 = reshape(v1, m, 1)
    v2 = reshape(v2, 1, n)
    (repmat(v1, 1, n), repmat(v2, m, 1))
end


function pe1()
    N = 1e6
    sum = 0
    for i=1:N
        if i % 3 == 0 || i % 5 == 0
            sum += i
        end
    end
end

function pe10()
    N = 2e6
    primes = [1:N]
    for i in 2:sqrt(N)
        j = (2:N/i)*i
        primes[j] = 0
    end
end

function pe73()
    N = 1e3
    di = [1:N]
    ni = [1:N]
    (n, d) = ndgrid(ni, di)

    f = n ./ d

    f = unique(f)
    f = sort(f)
    f = f[f .< 1/2]
    f = f[f .> 1/3]
end

function soft_threshold()
    N = 1e2
    j = linspace(-1.0, 1.0, convert(Int64, N))
    x, y = ndgrid(j, j)
    z = x.^2 + y.^2
    i = abs(z) .< 0.5
    z[i] = 0
    z[!i] -= 0.5
end

function pi_approx()
    N = 1e6
    pie = 1.0
    for k in 1:N
        pie += (-1)^k / (2*k + 1)
    end
end

# timing
pe1()
pe10()
pe73()
soft_threshold()
pi_approx()

print("pe1: ")
println(@elapsed pe1())
print("pe10: ")
println(@elapsed pe10())
print("pe73: ")
println(@elapsed pe73())
print("st_time: ")
println(@elapsed soft_threshold())
print("pi_approx: ")
println(@elapsed pi_approx())

