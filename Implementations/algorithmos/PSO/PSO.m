%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA102
% Project Title: Implementation of Particle Swarm Optimization in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = pso(FName,iterations,dims,bounds)
%% Problem Definition

nVar= dims;            % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin= bounds(:,1);             % Lower Bound of Decision Variables
VarMax= bounds(:,2);            % Upper Bound of Decision Variables

%% PSO Parameters

MaxIt= iterations;      % Maximum Number of Iterations

nPop= 50;        % Population Size (Swarm Size)

% PSO Parameters
% w=1;            % Inertia Weight
% wdamp=0.99;     % Inertia Weight Damping Ratio
% c1=1.5;         % Personal Learning Coefficient
% c2=2.0;         % Global Learning Coefficient
w=.9;
wMax=.9;
wMin=.4;
c1=2;
c2=2;

% If you would like to use Constriction Coefficients for PSO,
% uncomment the following block and comment the above set of parameters.

% % Constriction Coefficients
% phi1=2.05;
% phi2=2.05;
% phi=phi1+phi2;
% chi=2/(phi-2+sqrt(phi^2-4*phi));
% w=chi;          % Inertia Weight
% wdamp=1;        % Inertia Weight Damping Ratio
% c1=chi*phi1;    % Personal Learning Coefficient
% c2=chi*phi2;    % Global Learning Coefficient

% Velocity Limits
%VelMax=VarMax;
% VelMax=0.1*(VarMax-VarMin);
% VelMin=-VelMax;

%% Initialization

BestIndIter=zeros(MaxIt,dims);
BestFitIter=ones(MaxIt,1)*Inf;
FAccessIter=zeros(MaxIt,1);
FAccess=0;

empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);

GlobalBest.Cost=inf;

for i=1:nPop
    
    % Initialize Position
    for ard=1:nVar
        particle(i).Position(ard)=unifrnd(VarMin(ard),VarMax(ard));
    end
    
    % Initialize Velocity
    particle(i).Velocity=zeros(VarSize);
    
    % Evaluation
    particle(i).Cost=GetFitness(FName,particle(i).Position);
    FAccess = FAccess + 1;
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    
    % Update Global Best
    if particle(i).Best.Cost<GlobalBest.Cost
        
        GlobalBest=particle(i).Best;
        
    end
    
end

%% PSO Main Loop

for it=1:MaxIt
    
    for i=1:nPop
        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        
        % Apply Velocity Limits
%         particle(i).Velocity = max(particle(i).Velocity,VelMin');
%         particle(i).Velocity = min(particle(i).Velocity,VelMax');
        
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
        % Velocity Mirror Effect
        %IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        %particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        
        % Apply Position Limits
        particle(i).Position = max(particle(i).Position,VarMin');
        particle(i).Position = min(particle(i).Position,VarMax');
        
        % Evaluation
        particle(i).Cost = GetFitness(FName,particle(i).Position);
        FAccess = FAccess + 1;
        
        % Update Personal Best
        if particle(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            
            % Update Global Best
            if particle(i).Best.Cost<GlobalBest.Cost
                
                GlobalBest=particle(i).Best;
                
            end
            
        end
        
    end
    
    BestFitIter(it)=GlobalBest.Cost;
    BestIndIter(it,:)=GlobalBest.Position;
    FAccessIter(it) = FAccess;
    
    %% Rate
    for r=1:nPop
        PopulationHistoric{it,r} = particle(r).Position;
    end
    %% Rate
    %disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    %w=w*wdamp;
    w = wMax-(wMax-wMin)*it/MaxIt;
    %w =((MaxIt-it)*(wMax-wMin))/(MaxIt-1) + wMin;
end

bestFit = GlobalBest.Cost;
bestInd = GlobalBest.Position;
% 
% %% Rate
% if exist('PopPSO.mat','file') == 2
%     load('PopPSO.mat');
%     emptyCell = min(find(cellfun('isempty',cellPop)));
%     emptyCell = (emptyCell/2)+.5;
%     cellPop{1,emptyCell} = FName;
%     cellPop{2,emptyCell} = PopulationHistoric;
%     save('PopPSO','cellPop');
% else
%     cellPop = cell(2,43);
%     cellPop{1,1} = FName;
%     cellPop{2,1} = PopulationHistoric;
%     save('PopPSO','cellPop');
% end
% 
% %% Rate

%% Results

% figure;
% %plot(BestCost,'LineWidth',2);
% semilogy(BestCost,'LineWidth',2);
% xlabel('Iteration');
% ylabel('Best Cost');
% grid on;
