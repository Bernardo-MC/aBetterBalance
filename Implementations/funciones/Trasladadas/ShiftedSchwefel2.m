%   Shifted SCHWEFEL2 function:
%
%   Number or variables(dimensions): n.
%   Search domain: 0<=xi<=200, i = 1,2,...,n. 
%   Global minima: ShiftedSchwefel2.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (100,...,100).
%   Get bounds: ShiftedSchwefel2.Bounds(n);

classdef ShiftedSchwefel2
   methods(Static)
       
      function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Schwefel2();
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
            n = length(x);
            sum = 0;

            for i = 1:n
                in_sum = 0;
                for j = 1:i
                    in_sum = in_sum + (x(i)-100);
                end
                sum = sum + in_sum^2;
            end
            fit = sum;
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=0;
         up=200;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end