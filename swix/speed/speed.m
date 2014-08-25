clc; clear all; close all;

tic;
% project euler 1
    N = 1e6;
    x = 1:N;
    i = find( abs(mod(x, 3)) < 1e-9 & (abs(mod(x,5)) < 1e-9));
    pe1 = toc;

tic;
% project euler 10
    N = 2e6;
    primes = 1:N;
    for i=2:sqrt(N)
        j = (2:N/i) * i;
        primes(j) = primes(j) * 0;
    end
    pe10 = toc;

tic;
% project euler 73
    N = 1e3;
    d = 1:N;
    [n, d] = meshgrid(d, d);
    f = n ./ d;
    f = unique(f);
    i = (f > 1/3) & (f < 1/2);
    pe73 = toc;

tic;
% soft thresholding
    N = 1e2;
    j = linspace(-1, 1, N);
    [x, y] = meshgrid(j, j);
    z = x.^2 + y.^2;
    i = abs(z) < 0.5;
    z(find(i))   = z(find(i)) * 0;
    z(find(1-i)) = z(find(1-i)) - 0.5;
    st = toc;

tic;
% pi approx
    N = 1e6;
    k = 0:N;
    pi_approx = (-1).^k ./ (2*k + 1);
    pi = toc;

display(pe1)
display(pe10)
display(pe73)
display(st)
display(pi)

% On my machine:
%   pe1 =

%       0.1415


%   pe10 =

%       0.5141


%   st =

%       0.0105


%   pi =

%       0.0236

