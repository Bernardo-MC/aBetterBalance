%   QUINTIC function:
%
%   Number or variables(dimensions): n.
%   Search domain: -10<=xi<=10, i = 1,2,...,n. 
%   Global minima: Quintic.Fit(x*) = 0
%   Global solution: x* = (-1,...,-1).
%   Get bounds: Quintic.Bounds(n);

classdef Quintic
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Quintic();
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
            for i = 1:n
                xi = x(i);
                sum = sum + abs(xi^5-3*xi^4+4*xi^3+2*xi^2-10*xi-4);
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-10;
         up=10;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end