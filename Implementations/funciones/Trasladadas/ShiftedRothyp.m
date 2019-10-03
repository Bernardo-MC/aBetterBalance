%   ROTATED HYPER-ELLIPSOID function:
%
%   Number or variables(dimensions): n.
%   Search domain: -45.536<=xi<=85.536, i = 1,2,...,n. 
%   Global minima: ShiftedRothyp.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (20,...,20).
%   Get bounds: ShiftedRothyp.Bounds(n);

classdef ShiftedRothyp
   methods(Static)
       
      function [fit] = Fit(x)
            d = length(x);
            outer = 0;
            for ii = 1:d
                inner = 0;
                for jj = 1:ii
                    xj = (x(jj)-20);
                    inner = inner + xj^2;
                end
                outer = outer + inner;
            end
            fit = outer;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-45.536;
         up=85.536;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end