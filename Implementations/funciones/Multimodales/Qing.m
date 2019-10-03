%   QING function:
%
%   Number or variables(dimensions): n.
%   Search domain: -500<=xi<=500, i = 1,2,...,n. 
%   Global minima: Qing.Fit(x*) = 0
%   Global solution: x* = (+-sqrt(i),...,+-sqrt(i)).
%   Get bounds: Qing.Bounds(n);

classdef Qing
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Qing();
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
                sum = sum + (x(i)^2 - i)^2;
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-500;
         up=500;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end