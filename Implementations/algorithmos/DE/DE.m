%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA107
% Project Title: Implementation of Differential Evolution (DE) in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = DE(FName,iterations,dims,bounds)
%% Problem Definition

nVar=dims;            % Number of Decision Variables

VarSize=[1 nVar];   % Decision Variables Matrix Size

VarMin= bounds(:,1);             % Lower Bound of Decision Variables
VarMax= bounds(:,2);            % Upper Bound of Decision Variables

%% DE Parameters

MaxIt=iterations;      % Maximum Number of Iterations

nPop=50;        % Population Size

%beta_min=0.2;   % Lower Bound of Scaling Factor
%beta_max=0.8;   % Upper Bound of Scaling Factor
F = 0.75;

pCR=0.2;        % Crossover Probability

%% Initialization

BestIndIter=zeros(MaxIt,dims);
BestFitIter=ones(MaxIt,1)*Inf;
FAccessIter=zeros(MaxIt,1);
FAccess=0;

empty_individual.Position=[];
empty_individual.Cost=[];

BestSol.Cost=inf;

pop=repmat(empty_individual,nPop,1);

for i=1:nPop
    for ard=1:nVar
        pop(i).Position(ard)=unifrnd(VarMin(ard),VarMax(ard));
    end
    pop(i).Cost=GetFitness(FName,pop(i).Position);
    FAccess = FAccess + 1;
    
    if pop(i).Cost<BestSol.Cost
        BestSol=pop(i);
    end
    
end

%% DE Main Loop

for it=1:MaxIt
    
    for i=1:nPop
        
        x=pop(i).Position;
        
        A=randperm(nPop);
        
        A(A==i)=[];
        
        a=A(1);
        b=A(2);
        c=A(3);
        
        % Mutation
        %beta=unifrnd(beta_min,beta_max);
        %beta=unifrnd(beta_min,beta_max,VarSize);
        beta = F;
        y=pop(a).Position+beta.*(pop(b).Position-pop(c).Position);
        
        
        y = max(y, VarMin');
		y = min(y, VarMax');
		
        % Crossover
        z=zeros(size(x));
        j0=randi([1 numel(x)]);
        for j=1:numel(x)
            if j==j0 || rand<=pCR
                z(j)=y(j);
            else
                z(j)=x(j);
            end
        end
        
        NewSol.Position=z;
        NewSol.Cost=GetFitness(FName,NewSol.Position);
        FAccess = FAccess + 1;
        
        if NewSol.Cost<pop(i).Cost
            pop(i)=NewSol;
            
            if pop(i).Cost<BestSol.Cost
               BestSol=pop(i);
            end
        end
        
    end
    
    % Update Best Cost
    BestFitIter(it)=BestSol.Cost;
    BestIndIter(it,:)=BestSol.Position;
    FAccessIter(it) = FAccess;
    
    %% Rate
    for l=1:nPop
        PopulationHistoric{it,l} = pop(l).Position;
    end
    %% Rate
    
    % Show Iteration Information
    %disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
end

bestFit = BestSol.Cost;
bestInd = BestSol.Position;

% %% Rate
% if exist('PopDE.mat','file') == 2
%     load('PopDE.mat');
%     emptyCell = min(find(cellfun('isempty',cellPop)));
%     emptyCell = (emptyCell/2)+.5;
%     cellPop{1,emptyCell} = FName;
%     cellPop{2,emptyCell} = PopulationHistoric;
%     save('PopDE','cellPop');
% else
%     cellPop = cell(2,43);
%     cellPop{1,1} = FName;
%     cellPop{2,1} = PopulationHistoric;
%     save('PopDE','cellPop');
% end
% 
% %% Rate

%% Show Results

% figure;
% %plot(BestCost);
% semilogy(BestCost, 'LineWidth', 2);
% xlabel('Iteration');
% ylabel('Best Cost');
% grid on;
