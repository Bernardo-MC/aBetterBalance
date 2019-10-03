%   Shifted RASTRINGIN function:
%
%   Number or variables(dimensions): n.
%   Search domain: 9.88<=xi<=20.12, i = 1,2,...,n. 
%   Global minima: ShiftedRastringin.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (15,...,15).
%   Get bounds: ShiftedRastringin.Bounds(n);

classdef ShiftedRastringin
   methods(Static)
       
      function [fit] = Fit(x)
            n = size(x,2);
            sum = 0;
            for i = 1:n
                sum = sum+((x(i)-15)^2-10*cos(2*pi*(x(i)-15))); 
            end
            fit = 10*n+sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=9.88;
         up=20.12;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end