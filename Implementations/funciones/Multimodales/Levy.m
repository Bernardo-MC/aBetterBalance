%   LEVY function:
%
%   Number or variables(dimensions): n.
%   Search domain: -10<=xi<=10, i = 1,2,...,n. 
%   Global minima: Levy.Fit(x*) = 0
%   Global solution: x* = (1,...,1).
%   Get bounds: Levy.Bounds(n);

classdef Levy
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Levy();
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
            for i = 1:n
                z(i) = 1+(x(i)-1)/4;
            end
            sum = sin(pi*z(1))^2;
            
            for i = 1:n-1
                sum = sum+(z(i)-1)^2*(1+10*(sin(pi*z(i)+1))^2);
            end
            
            fit = sum+(z(n)-1)^2*(1+(sin(2*pi*z(n)))^2);
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-10;
         up=10;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end