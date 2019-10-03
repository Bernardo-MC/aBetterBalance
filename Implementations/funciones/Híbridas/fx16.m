%   GRIEWANK + RASTRINGIN + ROSENBROCK function:
%
%   Number or variables(dimensions): n.
%   Search domain: -100<=xi<=100, i = 1,2,...,n. 
%   Global minima: fx16.Fit(x*) = n-1
%   Global solution: x* = (0,...0).
%   Get bounds: fx16.Bounds(n);

classdef fx16
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=fx16();
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
            z2 = x * (600 /100);
            z3 = x * (1 /100);
            
            f9 = sum(z1.^2-10*cos(2*pi.*z1))+10*dim;
            f11 = sum(z2.^2)/4000-prod(cos(z2./sqrt([1:dim])))+1;
            f5 = sum(100*(z3(2:dim)-(z3(1:dim-1).^2)).^2+(z3(1:dim-1)-1).^2);
            fit = f9 + f11 + f5;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-100;
         up=100;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end