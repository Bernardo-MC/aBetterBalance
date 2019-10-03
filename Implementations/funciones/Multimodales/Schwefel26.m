%   SCHWEFEL 2.26 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -500<=xi<=500, i = 1,2,...,n. 
%   Global minima: Schwefel26.Fit(x*) = -418.982887272433799807913601398*n
%   Global solution: x* = (420.9687,...,420.9687).
%   Get bounds: Schwefel26.Bounds(n);

classdef Schwefel26
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Schwefel26();
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
            fit = sum(-x.*sin(sqrt(abs(x))));
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-500;
         up=500;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end