%   Shifted ROSENBROCK function:
%
%   Number or variables(dimensions): n.
%   Search domain: 96<=xi<=111, i = 1,2,...,n. 
%   Global minima: ShiftedRosenbrock.Fit(x*) = 0
%   Global solution: x* = (1,...,1).
%   Shifted global solution to: x* = (101,...,101).
%   Get bounds: ShiftedRosenbrock.Bounds(n);

classdef ShiftedRosenbrock
   methods(Static)
       
      function [fit] = Fit(x)
            sum = 0;
            n = size(x,2);
            for i = 1:n-1
                sum = sum + 100*((x(i+1)-100)-(x(i)-100)^2)^2+((x(i)-100)-1)^2;
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=96;
         up=111;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end