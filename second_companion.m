function [C0 , C1] = second_companion(A, k)
% C0, C1 coefficient of the first companion linearization
% \lambda C1 + C0 
% A =[A_k,
%     A_(k-1),
%     ... ,
%      A_0] is a matrix containing the coefficient of the matrix polynomial
% k is the degree of the matrix polynomial

[s, n] = size(A);
m = s/(k+1);

C0 = zeros(k*m , (k-1)*m + n);
C1 = zeros(k*m , (k-1)*m + n);

%Form the coefficient of the companion linearization
C1(1:m, 1:n) = A(1:m, :);
C1(m+1 : end, n+1 : end) = eye((k-1)*m);

C0(:, 1:n) = A(m+1:end,:);
C0( 1:(k-1)*m, n + 1: end) = - eye((k-1)*m);