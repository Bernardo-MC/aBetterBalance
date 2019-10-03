%   ROSENBROCK function:
%
%   Number or variables(dimensions): n.
%   Search domain: -5<=xi<=10, i = 1,2,...,n. 
%   Global minima: Rosenbrock.Fit(x*) = 0
%   Global solution: x* = (1,...,1).
%   Get bounds: Rosenbrock.Bounds(n);

classdef Rosenbrock
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Rosenbrock();
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
            sum = 0;
            n = size(x,2);
            for i = 1:n-1
                sum = sum + 100*(x(i+1)-x(i)^2)^2+(x(i)-1)^2;
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-5;
         up=10;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end