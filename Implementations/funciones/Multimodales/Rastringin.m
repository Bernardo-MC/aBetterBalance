%   RASTRINGIN function:
%
%   Number or variables(dimensions): n.
%   Search domain: -5.12<=xi<=5.12, i = 1,2,...,n. 
%   Global minima: Rastringin.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Get bounds: Rastringin.Bounds(n);

classdef Rastringin
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Rastringin();
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
            n = size(x,2);
            sum = 0;
            for i = 1:n
                sum = sum+(x(i)^2-10*cos(2*pi*x(i)));
            end
            fit = 10*n+sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-5.12;
         up=5.12;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end