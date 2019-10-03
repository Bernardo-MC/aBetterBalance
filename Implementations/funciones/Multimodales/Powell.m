%   POWELL function:
%
%   Number or variables(dimensions): n.
%   Search domain: -4<=xi<=5, i = 1,2,...,n. 
%   Global minima: Powell.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Get bounds: Powell.Bounds(n);

classdef Powell
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Powell();
            end
            [f, c]= size(x);
            if f > c
                x=x';
            end
            if checkBounds==true
                if (CheckFunctionsBounds(x,obj)==1)
                    fit=1e+300;
                    return;
                end
            end
            n = length(x);
            sum = 0;
            for i = 1:(n/4)
                sum = sum + ((x(4*i-3)+10*x(4*i-2))^2) + (5*(x(4*i-1)-x(4*i))^2) + ((x(4*i-2)-2*x(4*i-1))^4) + (10*(x(4*i-3)-x(4*i))^4);
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-4;
         up=5;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end