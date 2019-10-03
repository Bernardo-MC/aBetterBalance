%   Shifted SCHWEFEL 2.22 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -75<=xi<=125, i = 1,2,...,n. 
%   Global minima: ShiftedSchwefel22.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (25,...,25).
%   Get bounds: ShiftedSchwefel22.Bounds(n);

classdef ShiftedSchwefel22
   methods(Static)
       
      function [fit] = Fit(x)
            n = length(x);
            A = 0;
            B = 1;
            for i = 1:n
                xi = x(i)-25;
                A = A + abs(xi);
                B = B*abs(xi);
            end
            fit = A + B;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-75;
         up=125;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end