%   Shifted ACKLEY function:
%
%   Number or variables(dimensions): n.
%   Search domain: -20<=xi<=40, i = 1,2,...,n. 
%   Global minima: ShiftedAckley.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (10,...,10).
%   Get bounds: ShiftedAckley.Bounds(n);

classdef ShiftedAckley
   methods(Static)
       
      function [fit] = Fit(x)
            d = size(x,2);
            fit = -20*exp(-0.2*sqrt(1/d*sum((x-10).^2)))-exp(1/d*sum(cos(2*pi*(x-10))))+exp(1)+20;    %Fitness
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=-20;
         up=40;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end