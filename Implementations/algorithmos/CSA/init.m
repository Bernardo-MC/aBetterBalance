
% [- PAPA
%function [x l u]=init(N,pd) % Function for initialization
% -] PAPA
% [+ PAPA
function [x]=init(N,pd,l,u) % Function for initialization
% +] PAPA

%l=-100; u=100; % Lower and upper bounds

for i=1:N % Generation of initial solutions (position of crows)
    for j=1:pd
        % [- PAPA
        %x(i,j)=l-(l-u)*rand; % Position of the crows in the space
        % -] PAPA
        % [+ PAPA
        x(i,j)=l(pd)-(l(pd)-u(pd))*rand; % Position of the crows in the space.
        % +] PAPA
    end
end
