function [XX, LL, R] = sket_rect_poly(A, k)
% A =[A_k, A_(k-1), ... , A_0] is a matrix containing the coefficient of the matrix polynomial
% k is the degree of the matrix polynomial
% Using FIRST COMPANION LINEARIZATION and ITO MUROTA
% XX contains the approximation of the eigenvectors as columns
% LL diagonal matrix that contains the eigenvalues on the diagonal
% R vector of the residual of the original polynomial A

[m, s] = size(A);
n =  s/(k+1); 

S = sketching(A, k);

% Construct the first companion for the polynomial in A
[C0,C1] = first_companion(S,k);

%Use ITO_MUROTA on the companion form
[X , L] = eig_ItoMurota(C0, -C1);

%check the residuals on the original matrix polynomial A
X_t = X( end - n +1: end, :);
L_t = diag(L);

XX = [];
LL = [];
R = [];

for i = 1: length(L_t)
    eval = L_t(i).^(k:-1:0);
    
    Res = zeros(m,1);
    for j = 1 : (k+1)
       Res = Res + eval(j)*A(:, (j-1)*n +1: j*n )*X_t(:,i);
    end

    Norm_Res = norm(Res);

    if (Norm_Res <= 2*1e-14)
        R = [R; Norm_Res];
        XX = [XX X_t(:,i)];
        LL(end + 1, end + 1) = L_t(i);
    end

end