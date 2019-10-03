%   ACKLEY + PENALTY2 + ROSENBROCK + SCHWEFEL2 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -100<=xi<=100, i = 1,2,...,n. 
%   Global minima: fx17.Fit(x*) = (1.1*n)-1
%   Global solution: x* = (0,...0).
%   Get bounds: fx17.Bounds(n);

classdef fx17
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=fx17();
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
            z2 = x * (32 /100);
            z3 = x * (1/100);
            z4 = x * (50 /100);
            
            
            f3=0;
            for i=1:dim
                f3=f3+sum(z1(1:i))^2;
            end
            
            f10 = 	-20*exp(-.2*sqrt(sum(z2.^2)/dim))-exp(sum(cos(2*pi.*z2))/dim)+20+exp(1);
            f5 = sum(100*(z3(2:dim)-(z3(1:dim-1).^2)).^2+(z3(1:dim-1)-1).^2);
            f13 = .1*((sin(3*pi*z4(1)))^2+sum((z4(1:dim-1)-1).^2.*(1+(sin(3.*pi.*z4(2:dim))).^2))+...
                ((z4(dim)-1)^2)*(1+(sin(2*pi*z4(dim)))^2))+sum(fx17.Ufun(z4,5,100,4));
            
            fit = f3 + f10 + f5 + f13;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-100;
         up=100;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
      function y=Ufun(x,a,k,m)
        y=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
      end
      
   end
end