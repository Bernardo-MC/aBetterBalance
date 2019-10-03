%   INFINITY function:
%
%   Number or variables(dimensions): n.
%   Search domain: -1<=xi<=1, i = 1,2,...,n. 
%   Global minima: Infinity.Fit(x*) = 0
%   Global solution: x* = (0,...0).
%   Get bounds: Infinity.Bounds(n);

classdef Infinity
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Infinity();
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
                sum = sum + (xi^6*(sin(1/xi)+2));
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-1;
         up=1;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end