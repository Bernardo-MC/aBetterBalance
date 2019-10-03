%   ROTATED HYPER-ELLIPSOID function:
%
%   Number or variables(dimensions): n.
%   Search domain: -65.536<=xi<=65.536, i = 1,2,...,n. 
%   Global minima: Rothyp.Fit(x*) = 0
%   Global solution: x* = (0,...0).
%   Get bounds: Rothyp.Bounds(n);

classdef Rothyp
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Rothyp();
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
            d = length(x);
            outer = 0;
            for ii = 1:d
                inner = 0;
                for jj = 1:ii
                    xj = x(jj);
                    inner = inner + xj^2;
                end
                outer = outer + inner;
            end
            fit = outer;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-65.536;
         up=65.536;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end