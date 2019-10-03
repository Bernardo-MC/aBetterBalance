%   QUARTIC function:
%
%   Number or variables(dimensions): n.
%   Search domain: -1.28<=xi<=1.28, i = 1,2,...,n. 
%   Global minima: Quartic.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Get bounds: Quartic.Bounds(n);

classdef Quartic
   methods(Static)    
     function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Quartic();
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
                sum = sum + (i*(x(i))^4 + rand);
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-1.28;
         up=1.28;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end  
   end
end