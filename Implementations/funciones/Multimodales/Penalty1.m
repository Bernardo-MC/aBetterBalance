%   PENALTY 1 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -50<=xi<=50, i = 1,2,...,n. 
%   Global minima: Penalty1.Fit(x*) = 0
%   Global solution: x* = (-1,...,-1).
%   Get bounds: Penalty1.Bounds(n);

classdef Penalty1
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Penalty1();
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
            y = 1 + ((x+1)/4);
            termA = 10*sin(pi*y(1));
            termB = 0;
            termC = (y(n)-1)^2;
            termD = 0;
            for i = 1:n-1
                B1 = (y(i)-1)^2;
                B2 = (1 + 10*(sin(pi*y(i+1)))^2);
                termB = termB +(B1*B2);
            end
            for i = 1:n
                D1 = u(x(i),10,100,4);
                termD = termD + D1;
            end
            fit = (pi/30)*(termA + termB + termC) + termD;
        
        function [U] = u(xi,a,k,m)
            if xi > a
                U = k*(xi-a)^m;
            elseif xi < a
                U = k*(-xi-a)^m;
            else
                U = 0;
            end
        end
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-50;
         up=50;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end