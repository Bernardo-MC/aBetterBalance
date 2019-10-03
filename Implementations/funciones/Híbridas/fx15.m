%   RASTRINGIN + SCHWEFEL22 + SPHERE function:
%
%   Number or variables(dimensions): n.
%   Search domain: -100<=xi<=100, i = 1,2,...,n. 
%   Global minima: fx15.Fit(x*) = 0
%   Global solution: x* = (0,...0).
%   Get bounds: fx15.Bounds(n);

classdef fx15
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=fx15();
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
            
            dim=length(x);

                z1 = x;
                z2 = x * (5.12 / 100); 
                z3 = x * (10 /100);

                f1 = sum(z1.^2);
                f9 = sum(z2.^2-10*cos(2*pi.*z2))+10*dim;
                f2 = sum(abs(z3))+prod(abs(z3));
                fit = f1 + f9 + f2;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-100;
         up=100;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end