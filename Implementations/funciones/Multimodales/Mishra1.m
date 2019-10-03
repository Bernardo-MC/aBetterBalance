%   MISHRA 1 function:
%
%   Number or variables(dimensions): n.
%   Search domain: 0<=xi<=1, i = 1,2,...,n. 
%   Global minima: Mishra1.Fit(x*) = 2
%   Global solution: x* = (1,...,1).
%   Get bounds: Mishra1.Bounds(n);

classdef Mishra1
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Mishra1();
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
            for i = 1:n-1
                sum = sum + x(i);
            end
            xn = n - sum;
            fit = (1+xn)^xn;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=0;
         up=1;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end