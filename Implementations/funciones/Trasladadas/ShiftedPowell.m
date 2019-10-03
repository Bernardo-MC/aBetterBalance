%   Shifted POWELL function:
%
%   Number or variables(dimensions): n.
%   Search domain: 1<=xi<=10, xi = 1,...,n.  
%   Global minima: ShiftedPowell.Fit(x*) = 0.
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (5,...,5).
%   Get bounds: ShiftedPowell.Bounds(n);

classdef ShiftedPowell
   methods(Static)
       
      function [fit] = Fit(x)
          n = length(x);
          sum = 0;
          for i = 1:(n/4)
              sum = sum + (((x(4*i-3)-5)+10*(x(4*i-2)-5))^2) + (5*((x(4*i-1)-5)-(x(4*i)-5))^2) + (((x(4*i-2)-5)-2*(x(4*i-1)-5))^4) + (10*((x(4*i-3)-5)-(x(4*i)-5))^4);
          end
          fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=1;
         up=10;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end