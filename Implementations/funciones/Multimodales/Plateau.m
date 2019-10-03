%   PLATEAU function:
%
%   Number or variables(dimensions): n.
%   Search domain: -5.12<=xi<=5.12, i = 1,2,...,n. 
%   Global minima: Plateau.Fit(x*) = 30
%   Global solution: x* = (0,...,0).
%   Get bounds: Plateau.Bounds(n);

classdef Plateau
   methods(Static)
       
        function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Plateau();
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
            term = sum(abs(floor(x)));
            fit = 30 + term;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-5.12;
         up=5.12;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end