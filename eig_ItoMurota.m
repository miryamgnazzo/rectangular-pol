function [X , L] =eig_ItoMurota(A,B)
% X = stores the eigenvectors (it is a rectangular matrix)
% L = stores the eigenvalues (it is a diagonal matrix)
% A,B rectangular matrices, size m x n, with m > n
% Solves the generalized egienvalue problem Ax=\lambda B x by the Ito-Murota
% approach (SIMAX 2016)

if (size(A) ~= size(B))
    error('inconsistent dimension') 
end

[m , n] = size(A);

sing_B = svd(B);
[~, sing_BA, V] = svd([B A]);

if (sing_B(n) <= sing_BA(n+1,n+1))
    error('hyphoteses not satisfied') 
end

%Select the submatrices of V
V_21 = V( n+1 : end, 1 :n);
V_11 = V( 1 : n, 1 : n);

%computes the eigenvalues of the pencil V_21* -\lambda V_11^*
[X_V, L_V] = eig(V_21', V_11');

%Normalization on order to have unit 2-norm of the column
X_V = X_V ./ vecnorm(X_V);

X = [];
L = [];

%Check the residual of the original pencil
for i = 1 : n
  r = norm(A*X_V(:,i) -  B*X_V(:,i)*L_V(i,i)); 
  %keyboard
   if (r <= 1e-13)
       X = [ X , X_V(:,i)]; 
       L(end + 1, end + 1) = L_V(i,i); 
   end
end

