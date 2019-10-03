%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YOEA112
% Project Title: Implementation of Firefly Algorithm (FA) in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = FA(FName,iterations,dims,bounds)
%% Problem Definition

nVar=dims;                 % Number of Decision Variables

VarSize=[1 nVar];       % Decision Variables Matrix Size

VarMin= bounds(:,1);             % Lower Bound of Decision Variables
VarMax= bounds(:,2);            % Upper Bound of Decision Variables

%% Firefly Algorithm Parameters

MaxIt=iterations;         % Maximum Number of Iterations

nPop=50;            % Number of Fireflies (Swarm Size)

gamma=1;            % Light Absorption Coefficient

beta0=2;            % Attraction Coefficient Base Value

alpha=0.2;          % Mutation Coefficient

alpha_damp=0.98;    % Mutation Coefficient Damping Ratio


delta=0.05*(VarMax-VarMin);     % Uniform Mutation Range


m=2;

if isscalar(VarMin) && isscalar(VarMax)
    dmax = (VarMax-VarMin)*sqrt(nVar);
else
    dmax = norm(VarMax-VarMin);
end

%% Initialization

BestIndIter=zeros(MaxIt,dims);
BestFitIter=ones(MaxIt,1)*Inf;
FAccessIter=zeros(MaxIt,1);
FAccess=0;

% Empty Firefly Structure
firefly.Position=[];
firefly.Cost=[];

% Initialize Population Array
pop=repmat(firefly,nPop,1);

% Initialize Best Solution Ever Found
BestSol.Cost=inf;

% Create Initial Fireflies
for i=1:nPop
    for ard=1:nVar
        pop(i).Position(ard)=unifrnd(VarMin(ard),VarMax(ard));
    end
    pop(i).Cost=GetFitness(FName,pop(i).Position);
    FAccess = FAccess + 1;
   
    if pop(i).Cost<=BestSol.Cost
        BestSol=pop(i);
    end
end

% Array to Hold Best Cost Values
BestCost=zeros(MaxIt,1);

%% Firefly Algorithm Main Loop

for it=1:MaxIt
    
    newpop=repmat(firefly,nPop,1);
    for i=1:nPop
        newpop(i).Cost = inf;
        for j=1:nPop
            if pop(j).Cost < pop(i).Cost
                rij=norm(pop(i).Position-pop(j).Position)/dmax;
                beta=beta0*exp(-gamma*rij^m);
                
                for ard=1:nVar
                    e=delta(ard)*unifrnd(-1,+1,VarSize);
                end
                
                newsol.Position = pop(i).Position + beta*rand(VarSize).*(pop(j).Position-pop(i).Position) + alpha*e;

                newsol.Position=max(newsol.Position,VarMin');
                newsol.Position=min(newsol.Position,VarMax');
                
                newsol.Cost=GetFitness(FName,newsol.Position);
                FAccess = FAccess + 1;
                if newsol.Cost <= newpop(i).Cost
                    newpop(i) = newsol;
                    if newpop(i).Cost<=BestSol.Cost
                        BestSol=newpop(i);
                    end
                end
                
            end
        end
    end
    
    % Merge
    pop=[pop
         newpop];  %#ok
    
    % Sort
    [~, SortOrder]=sort([pop.Cost]);
    pop=pop(SortOrder);
    
    % Truncate
    pop=pop(1:nPop);
    
    % Store Best Cost Ever Found
    BestFitIter(it) = BestSol.Cost;
    BestIndIter(it,:) = BestSol.Position;
    FAccessIter(it) = FAccess;
    
    %% Rate
    for l=1:nPop
        PopulationHistoric{it,l} = pop(l).Position;
    end
    %% Rate
    % Show Iteration Information
    %disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    % Damp Mutation Coefficient
    alpha = alpha*alpha_damp;
    
end

bestFit = BestSol.Cost;
bestInd = BestSol.Position;

% %% Rate
% if exist('PopFA.mat','file') == 2
%     load('PopFA.mat');
%     emptyCell = min(find(cellfun('isempty',cellPop)));
%     emptyCell = (emptyCell/2)+.5;
%     cellPop{1,emptyCell} = FName;
%     cellPop{2,emptyCell} = PopulationHistoric;
%     save('PopFA','cellPop');
% else
%     cellPop = cell(2,43);
%     cellPop{1,1} = FName;
%     cellPop{2,1} = PopulationHistoric;
%     save('PopFA','cellPop');
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
