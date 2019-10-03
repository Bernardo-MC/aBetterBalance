%   SCHWEFEL 2.22 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -100<=xi<=100, i = 1,2,...,n. 
%   Global minima: Schwefel22.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Get bounds: Schwefel22.Bounds(n);

classdef Schwefel22
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Schwefel22();
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
            A = 0;
            B = 1;
            for i = 1:n
                xi = x(i);
                A = A + abs(xi);
                B = B*abs(xi);
            end
            fit = A + B;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-100;
         up=100;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end