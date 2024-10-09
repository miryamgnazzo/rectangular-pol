function S = sketching(A, k)
% A =[A_k, A_(k-1), ... , A_0] is a matrix containing the coefficient of the matrix polynomial
% k is the degree of the matrix polynomial

[m , s] = size(A);
n = s/(k+1);

% Construct Sketching Matrix
%rng(5)
G = randn(2*n, m);

S = G*A;


