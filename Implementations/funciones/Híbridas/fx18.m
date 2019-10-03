%   ACKLEY + GRIEWANK + RASTRINGIN + ROSENBROCK + SCHWEFEL22 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -100<=xi<=100, i = 1,2,...,n. 
%   Global minima: fx18.Fit(x*) = n-1
%   Global solution: x* = (0,...0).
%   Get bounds: fx18.Bounds(n);

classdef fx18
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=fx18();
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
            z1 = x * (5.12 / 100);
            z2 = x * (32 /100);
            z3 = x * (600 /100);
            z4 = x * (1/100);
            z5 = x * (10 /100);
            
            
            f9 = sum(z1.^2-10*cos(2*pi.*z1))+10*dim;
            f10 = 	-20*exp(-.2*sqrt(sum(z2.^2)/dim))-exp(sum(cos(2*pi.*z2))/dim)+20+exp(1);
            f11 = sum(z3.^2)/4000-prod(cos(z3./sqrt([1:dim])))+1;
            f5 = sum(100*(z4(2:dim)-(z4(1:dim-1).^2)).^2+(z4(1:dim-1)-1).^2);
            f2 = sum(abs(z5))+prod(abs(z5));
            fit = f9 + f10  + f11 + f5  +f2;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-100;
         up=100;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end