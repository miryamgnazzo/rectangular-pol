%Script Generate rectangular polynomial

k = 3; % degree
m = 100; n = 4; % size m x n

rng(3)

%square matrix polyn deg 3
A_3 = randn(m,m);
A_2 = randn(m,m);
A_1 = randn(m,m);
A_0 = randn(m,m);

%rectangular matrix with orthon columns
[QQ , ~] = qr(randn(m,n));

Q = QQ(:,1:n);

% Final Rectangular matrix polynomial

AA_3 = A_3*Q;
AA_2 = A_2*Q;
AA_1 = A_1*Q;
AA_0 = A_0*Q;

A = [AA_3, AA_2, AA_1, AA_0];

[C0 , C1] = first_companion(A, k);