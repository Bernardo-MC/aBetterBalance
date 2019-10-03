%   PERM 2 function:
%
%   Number or variables(dimensions): n.
%   Search domain: -n<=xi<=n, i = 1,2,...,n. 
%   Global minima: Perm2.Fit(x*) = 0
%   Global solution: x* = (1,1/2,...,1/n).
%   Get bounds: Perm2.Bounds(n);
%   The variable b can be modified. The recommended value of b is 10.

classdef Perm2
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Perm2();
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
     
            b = 10; % Can be changed
            d = length(x);
            outer = 0;
            for ii = 1:d
                inner = 0;
                for jj = 1:d
                    xj = x(jj);
                    inner = inner + (jj+b)*(xj^ii-(1/jj)^ii);
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