function [eigenVal, eigenVec] = powermethod(inputMat, inputVec, tolerance, MAXITER)
  arguments
    inputMat double {mustBeNonempty, mustBeFinite}
    inputVec {mustBeNonempty, mustBeFinite, mustBeVector}
    tolerance (1, 1) double {mustBeFloat}
    MAXITER (1, 1) int64 {mustBeNumeric} = 1e3
  end % argyments


  V1 = inputMat * inputVec;
  miu1 = largestelement(V1);
  V1 = 1/miu1 * V1;

  V2 = inputMat * V1;
  miu2 = largestelement(V2);
  V2 = 1/miu2 * V2;

  counter = 1;
  while (abs(miu2 - miu1) > tolerance) & (counter <= MAXITER)
    V1 = inputMat * V2;
    miu1 = largestelement(V1);
    V1 = 1/miu1 * V1;

    V2 = inputMat * V1;
    miu2 = largestelement(V2);
    V2 = 1/miu2 * V2;

    counter = counter + 1;
  end % while
  eigenVal = miu2;
  eigenVec = V2;

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
