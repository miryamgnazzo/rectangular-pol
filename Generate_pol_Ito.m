%Script Generated polynomial -- as in ITO MUROTA
 
n = 5;
m = 300;

k = 2;

rng(3)

A_2 = randn(5,5);
A_1 = randn(5,5);
A_0 = randn(5,5);

QQ = randn(300,5);
[Q, ~] = qr(QQ);

Q = Q(:,1:5);

A0 = Q*A_0;
A1 = Q*A_1;
A2 = Q*A_2;

A = [A2, A1, A0];

[C0 , C1] = first_companion(A, k);


