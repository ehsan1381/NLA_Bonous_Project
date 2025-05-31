function [eigenVal, eigenVec] = powermethod(inputMat, inputVec, tolerance)
  V1 = inputMat * inputVec;
  miu1 = largestelement(V1);
  V1 = 1/miu1 * V1;

  V2 = inputMat * V1;
  miu2 = largestelement(V2);
  V2 = 1/miu2 * V2;


  while abs(miu2 - miu1) > tolerance
    V1 = inputMat * V2;
    miu1 = largestelement(V1);
    V1 = 1/miu1 * V1;

    V2 = inputMat * V1;
    miu2 = largestelement(V2);
    V2 = 1/miu2 * V2;
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

end % function largestelement
