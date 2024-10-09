function [C0 , C1] = first_companion(A, k)
% C0, C1 coefficient of the first companion linearization
% \lambda C1 + C0 
% A =[A_k, A_(k-1), ... , A_0] is a matrix containing the coefficient of the matrix polynomial
% k is the degree of the matrix polynomial

[m, s] = size(A);
n = s/(k+1);

C0 = zeros(m + (k-1)*n, k*n);
C1 = zeros(m + (k-1)*n, k*n);

%Form the coefficient of the companion linearization
C1(1:m, 1:n) = A(:, 1:n);
C1(m+1 : end, n+1 : end) = eye((k-1)*n);

C0(1:m, :) = A(:, n+1:end);
C0(m+1: end, 1: (k-1)*n) = - eye((k-1)*n);