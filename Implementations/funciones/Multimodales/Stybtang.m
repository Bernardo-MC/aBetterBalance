%   STYBLINSKI-TANG function:
%
%   Number or variables(dimensions): n.
%   Search domain: -5<=xi<=5, i = 1,2,...,n. 
%   Global minima: Stybtang.Fit(x*) = -39.16599*n
%   Global solution: x* = (-2.903534,...,-2.903534).
%   Get bounds: Stybtang.Bounds(n);

classdef Stybtang
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Stybtang();
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
            for i = 1:d
                xi = x(i);
                new = xi^4 - 16*xi^2 + 5*xi;
                sum = sum + new;
            end
            fit = sum/2;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-5;
         up=5;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end