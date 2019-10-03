%   TRID function:
%
%   Number or variables(dimensions): n.
%   Search domain: -n^2<=xi<=n^2, i = 1,2,...,n. 
%   Global minima: Trid.Fit(x*) -n(n+4)(n-1)/6.
%   Global solution: xi* = i(n+1-i), i = 1,2,...,n. 
%   Get bounds: Trid.Bounds(n);

classdef Trid
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Trid();
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
            sum1 = (x(1)-1)^2;
            sum2 = 0;
            for i = 2:d
                xi = x(i);
                xold = x(i-1);
                sum1 = sum1 + (xi-1)^2;
                sum2 = sum2 + xi*xold;
            end
            fit = sum1 - sum2;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-(dims^2);
         up=(dims^2);
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end