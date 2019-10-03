%   Shifted SPHERE function:
%
%   Number or variables(dimensions): n.
%   Search domain: 14.88<=xi<=25.12, i = 1,2,...,n. 
%   Global minima: ShiftedSphere.Fit(x*) = 0
%   Global solution: x* = (0,...,0).
%   Shifted global solution to: x* = (20,...,20).
%   Get bounds: ShiftedSphere.Bounds(n);

classdef ShiftedSphere
   methods(Static)
       
      function [fit] = Fit(x)
            fit = sum((x-20).^2);    %Fitness
      end
      
      function [low,up,dims] = Bounds(dims) %Get dimensions
         low=14.88;
         up=25.12;
         low=repmat(low,dims,1);
         up=repmat(up,dims,1);
      end
      
   end
end