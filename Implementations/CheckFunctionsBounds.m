%   GetFunctionBounds function:
%
% * Inputs:
%   x: Particle to ve evaluated
%   obj: Constructor of the function class


function OutSearchSpace=CheckFunctionsBounds(x,obj)
    dims=length(x);
    [low,up,dims] = obj.Bounds(dims);
    OutSearchSpace=0;
    for i=1:dims
        if (x(i)<low(i) || x(i)>up(i))
            OutSearchSpace=1;
            break;
        end
    end
end