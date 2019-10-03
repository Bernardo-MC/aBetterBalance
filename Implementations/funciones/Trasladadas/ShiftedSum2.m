%   Shifted SUM2 function:
%
%   Number or variables(dimensions): n.
%   Search domain: 20<=xi<=40, i = 1,2,...,n. 
%   Global minima: ShiftedSum2.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (30,...,30).
%   Get bounds: ShiftedSum2.Bounds(n);

classdef ShiftedSum2
   methods(Static)
       
      function [fit] = Fit(x)
            n = size(x,2);
            sum = 0;
            for i = 1:n  
                sum = sum+i*(x(i)-30)^2; 
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=20;
         up=40;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end