%   SCHWEFEL 2.21 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -100<=xi<=100, i = 1,2,...,n. 
%   Global minima: Schwefel21.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Get bounds: Schwefel21.Bounds(n);

classdef Schwefel21
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Schwefel21();
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
            fit = max(abs(x), [], 2);
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-100;
         up=100;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end