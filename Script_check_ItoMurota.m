%Script for checking the code Ito_Murota
% EXAMPLE 1
% S = [1 0;
%     0 1;
%     1 1; 
%     -1 1];
% 
% T = [1.0001 1;
%      1 0.9999];
% 
% % T = [1.0001 -1;
% %    1 0.9999];
% 
% A = S*[1 0; 0 -1]*T;
% B = S*T;

% EXAMPLE 2
rng(3)

A = randn(5,5);
B = randn(5,5);

QQ = randn(300,5);
[Q,~] = qr(QQ);

Q = Q(:,1:5);

A0 = Q*A;
B0 = Q*B;

