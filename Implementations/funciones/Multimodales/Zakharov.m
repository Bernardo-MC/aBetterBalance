%   ZAKHAROV function:
%
%   Number or variables(dimensions): n.
%   Search domain: -5<=xi<=10, i = 1,2,...,n. 
%   Global minima: Zakharov.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Get bounds: Zakharov.Bounds(n);

classdef Zakharov
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Zakharov();
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
            sum1 = 0;
            sum2 = 0;
            for i = 1:d
                xi = x(i);
                sum1 = sum1 + xi^2;
                sum2 = sum2 + 0.5*i*xi;
            end
            fit = sum1 + sum2^2 + sum2^4;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-5;
         up=10;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end
