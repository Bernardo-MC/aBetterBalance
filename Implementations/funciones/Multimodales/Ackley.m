%   ACKLEY function:
%
%   Number or variables(dimensions): n.
%   Search domain: -30<=xi<=30, i = 1,2,...,n.
%   Global minima: Ackley.Fit(x*) = 0
%   Global solution: x* = (0,...0).
%   Get bounds: Ackley.Bounds(n);

classdef Ackley
    methods(Static)
        function [fit] = Fit(x,checkBounds)
            if nargin==1
                checkBounds=0;
            else
                obj=Ackley();
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
            d = size(x,2);
            fit = -20*exp(-0.2*sqrt(1/d*sum(x.^2)))-exp(1/d*sum(cos(2*pi*x)))+exp(1)+20;    %Fitness
        end
        
        function [low,up,dims] = Bounds(dims) %Get dimensions
            low=-30;
            up=30;
            low=repmat(low,dims,1);
            up=repmat(up,dims,1);
        end
    end
end