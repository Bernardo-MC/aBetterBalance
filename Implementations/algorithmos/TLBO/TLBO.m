%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA111
% Project Title: Implementation of TLBO in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = TLBO(FName,iterations,dims,bounds)

%% Problem Definition

nVar= dims;            % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin= bounds(:,1)';             % Lower Bound of Decision Variables
VarMax= bounds(:,2)';            % Upper Bound of Decision Variables

%% TLBO Parameters

MaxIt = iterations;        % Maximum Number of Iterations

nPop = 50;           % Population Size

%% Initialization 

BestIndIter=zeros(MaxIt,dims);
BestFitIter=ones(MaxIt,1)*Inf;
FAccessIter=zeros(MaxIt,1);
FAccess=0;

% Empty Structure for Individuals
empty_individual.Position = [];
empty_individual.Cost = [];

% Initialize Population Array
pop = repmat(empty_individual, nPop, 1);

% Initialize Best Solution
BestSol.Cost = inf;

% Initialize Population Members
for i=1:nPop
    pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
    pop(i).Cost = GetFitness(FName,pop(i).Position);
    FAccess = FAccess + 1;
    
    if pop(i).Cost < BestSol.Cost
        BestSol = pop(i);
    end
end

%% TLBO Main Loop

for it=1:MaxIt
    
    % Calculate Population Mean
    Mean = 0;
    for i=1:nPop
        Mean = Mean + pop(i).Position;
    end
    Mean = Mean/nPop;
    
    % Select Teacher
    Teacher = pop(1);
    for i=2:nPop
        if pop(i).Cost < Teacher.Cost
            Teacher = pop(i);
        end
    end
    
    % Teacher Phase
    for i=1:nPop
        % Create Empty Solution
        newsol = empty_individual;
        
        % Teaching Factor
        TF = randi([1 2]);
        
        % Teaching (moving towards teacher)
        newsol.Position = pop(i).Position ...
            + rand(VarSize).*(Teacher.Position - TF*Mean);
        
        % Clipping
        newsol.Position = max(newsol.Position, VarMin);
        newsol.Position = min(newsol.Position, VarMax);
        
        % Evaluation
        newsol.Cost = GetFitness(FName,newsol.Position);
        FAccess = FAccess + 1;
        
        % Comparision
        if newsol.Cost<pop(i).Cost
            pop(i) = newsol;
            if pop(i).Cost < BestSol.Cost
                BestSol = pop(i);
            end
        end
    end
    
    % Learner Phase
    for i=1:nPop
        
        A = 1:nPop;
        A(i)=[];
        j = A(randi(nPop-1));
        
        Step = pop(i).Position - pop(j).Position;
        if pop(j).Cost < pop(i).Cost
            Step = -Step;
        end
        
        % Create Empty Solution
        newsol = empty_individual;
        
        % Teaching (moving towards teacher)
        newsol.Position = pop(i).Position + rand(VarSize).*Step;
        
        % Clipping
        newsol.Position = max(newsol.Position, VarMin);
        newsol.Position = min(newsol.Position, VarMax);
        
        % Evaluation
        newsol.Cost = GetFitness(FName,newsol.Position);
        FAccess = FAccess + 1;
        
        % Comparision
        if newsol.Cost<pop(i).Cost
            pop(i) = newsol;
            if pop(i).Cost < BestSol.Cost
                BestSol = pop(i);
            end
        end
    end
    
    % Store Record for Current Iteration
    BestFitIter(it)=BestSol.Cost;
    BestIndIter(it,:)=BestSol.Position;
    FAccessIter(it) = FAccess;
    
    %% Rate
    for r=1:nPop
        PopulationHistoric{it,r} = pop(r).Position;
    end
    %% Rate
    
end
% %% Rate
% if exist('PopTLBO.mat','file') == 2
%     load('PopTLBO.mat');
%     emptyCell = min(find(cellfun('isempty',cellPop)));
%     emptyCell = (emptyCell/2)+.5;
%     cellPop{1,emptyCell} = FName;
%     cellPop{2,emptyCell} = PopulationHistoric;
%     save('PopTLBO','cellPop');
% else
%     cellPop = cell(2,43);
%     cellPop{1,1} = FName;
%     cellPop{2,1} = PopulationHistoric;
%     save('PopTLBO','cellPop');
% end
% 
% %% Rate
bestFit = BestSol.Cost;
bestInd = BestSol.Position;

