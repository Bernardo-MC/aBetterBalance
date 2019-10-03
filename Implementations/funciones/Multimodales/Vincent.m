%   VINCENT function:
%
%   Number or variables(dimensions): n.
%   Search domain: 0.25<=xi<=10, i = 1,2,...,n. 
%   Global minima: Vincent.Fit(x*) = -n.
%   Global solution: x* = (7.70628098,...,7.70628098).
%   Get bounds: Vincent.Bounds(n);

classdef Vincent
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Vincent();
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
                sum = sum + sin(10*log(x(i)));
            end
            fit = -sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=0.25;
         up=10;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end