function [eigenVal, eigenVec, miuApproxVec] = powermethod(inputMat, inputVec, tolerance, MAXITER)
  % argument validation
  arguments
    inputMat double {mustBeNonempty, mustBeFinite}
    inputVec {mustBeNonempty, mustBeFinite, mustBeVector}
    tolerance (1, 1) double {mustBeFloat, mustBePositive}
    MAXITER (1, 1) int64 {mustBeNumeric} = 5e1
  end % argyments

  % more argument validation
  [nRows, nColumns] = size(inputMat);
  assert(nRows == nColumns, "Matrix is not square");

  [vecSize, ~] = size(inputVec);
  assert(nRows == vecSize, "Vector and matrix do not match");

  V1 = inputMat * inputVec;
  miu1 = largestelement(V1);
  V1 = 1/miu1 * V1;

  V2 = inputMat * V1;
  miu2 = largestelement(V2);
  V2 = 1/miu2 * V2;

  % initializing some variables
  miuApproxVec = zeros([MAXITER + 1, 1]);
  lastMiuDiff = abs(miu2 - miu1);

  miuApproxVec([1, 2]) = [miu1, miu2];

  counter = 3;
  while (abs(miu2 - miu1) > tolerance) & (counter <= MAXITER)
    V1 = inputMat * V2;
    miu1 = largestelement(V1);
    V1 = 1/miu1 * V1;

    V2 = inputMat * V1;
    miu2 = largestelement(V2);
    V2 = 1/miu2 * V2;

    % assigning here so that if algorithm
    % fails passed this point, progress is not list
    eigenVal = miu2;
    eigenVec = V2;

    miuApproxVec([counter, counter + 1]) = [miu1, miu2];
    assert(abs(miu2 - miu1) <= lastMiuDiff, "Algorithm is not converging");
    lastMiuDiff = abs(miu2 - miu1);

    counter = counter + 2;
  end % while

end % function powermethod


function [miu] = largestelement(inputVec)
  miu = 0;

  [~, length] = size(inputVec);
  for i=1:length
    if abs(inputVec(i)) > abs(miu)
      miu = inputVec(i);
    end % if
  end % for

  % to prevent overflow, underflow, division by zero errors
  assert(miu ~= 0, "Miu is 0");
  if abs(miu) < eps
    warning("Mu is too small, results may be inaccurate");
  elseif abs(miu) > (1/eps)
    warning("Mu is too large, results may be inaccurate");
  end % if
end % function largestelement
