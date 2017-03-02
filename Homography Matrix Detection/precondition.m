function [h_precondition,h_new_precondition  ] = precondition( x,y,u,v )

[x,y] = normalization(x,y);
[u,v] = normalization(u,v);

% for h33 = 1
index = 1;
N = size(x,1);
A = zeros(2*N, 8);

for i=1:2:2*N
   
   A(i,1) = x(index);
   A(i,2) = y(index);
   A(i,3) = 1;
   A(i,7) = -1*x(index)*u(index);
   A(i,8) = -1*y(index)*u(index);

   A(i+1,4) = x(index);
   A(i+1,5) = y(index);
   A(i+1,6) = 1;
   A(i+1,7) = -1*x(index)*v(index);
   A(i+1,8) = -1*y(index)*v(index);

   index = index+1;
   
end

b = zeros(2*N,1);
index = 1;
for i=1:2:2*N
    b(i)   = u(index);
    b(i+1) = v(index);
    index = index + 1;
end

h = A\b;
h(size(h)+1,1) = 1;

h = reshape(h,[3,3]);
h_precondition = h';
display(h_precondition);

% if ||h|| = 1;

A_new = A;
col = size(A_new,2);
for i=1:2:size(A_new,1)
    A_new(i,col+1) = -1*u((i+1)/2);
    A_new(i+1,col+1) = -1*v((i+1)/2);
end

[V1,~] = eig(A_new' * A_new);

h_new = V1(:,1);

h_new = reshape(h_new,[3,3]);

h_new_precondition = h_new';

display(h_new_precondition);



end

