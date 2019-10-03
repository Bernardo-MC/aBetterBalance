%   GRIEWANK function:
%
%   Number or variables(dimensions): n.
%   Search domain: -600<=xi<=600, i = 1,2,...,n. 
%   Global minima: Griewank.Fit(x*) = 0
%   Global solution: x* = (0,...0).
%   Get bounds: Griewank.Bounds(n);

classdef Griewank
   methods(Static)
       
        function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Griewank();
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
            d = length(x);
            sum = 0;
            prod = 1;
            
            for ii = 1:d
                xi = x(ii);
                sum = sum + xi^2/4000;
                prod = prod * cos(xi/sqrt(ii));
            end
            
            fit = sum - prod + 1;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-600;
         up=600;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end