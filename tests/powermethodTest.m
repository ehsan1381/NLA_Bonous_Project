%% Case_1_Example_from_the_book
A = [-100 3 5; 7  6 5; 7 8 9];
v = [1;1;1];
tolerance = 1e-5;
[estimatedEigenVal, estimatedEigenVec] = powermethod(A, v, tolerance);
delta = A * estimatedEigenVec - estimatedEigenVal * estimatedEigenVec;
assert(norm(delta) < tolerance);


%% Case_2_Another_one_from_the_book
n = 10;
A = zeros(n);
v = [1:n].';
for i=1:n
  for j=1:n
    A(i, j) = i+j-1;
  end
end
tolerance = 1e-5;
[estimatedEigenVal, estimatedEigenVec] = powermethod(A, v, tolerance);
delta = A * estimatedEigenVec - estimatedEigenVal * estimatedEigenVec;
assert(norm(delta) < tolerance);



