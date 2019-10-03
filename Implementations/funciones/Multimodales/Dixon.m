%   DIXON-PRICE function:
%
%   Number or variables(dimensions): n.
%   Search domain: -10<=xi<=10, i = 1,2,...,n. 
%   Global minima: Dixon.Fit(x*) = 0
%   Global solution: xi = 2^(-([2^i-2]/[2^i]), for i = 1,2,...,n.
%   Get bounds: Dixon.Bounds(n);

classdef Dixon
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Dixon();
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
            for i = 2:d
                xi = x(i);
                xold = x(i-1);
                new = i * (2*xi^2 - xold)^2;
                sum = sum + new;
            end
            fit = ((x(1)-1)^2) + sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-10;
         up=10;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end