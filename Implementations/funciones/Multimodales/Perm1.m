%   PERM 1 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -n<=xi<=n, i = 1,2,...,n. 
%   Global minima: Perm1.Fit(x*) = 0
%   Global solution: x* = (1,2,...,n).
%   Get bounds: Perm1.Bounds(n);
%   The variable b can be modified. The recommended value of b is 0.5.

classdef Perm1
   methods(Static)
       
        function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Perm1();
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
            b = 0.5; % Can be modified
            d = length(x);
            outer = 0;
            for i = 1:d
                inner = 0;
                for j = 1:d
                    inner = inner + (j^i+b)*((x(j)/j)^i-1);
                end
                outer = outer + inner^2;
            end
            fit = outer;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-dims;
         up=dims;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end
