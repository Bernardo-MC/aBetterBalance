%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA114
% Project Title: Implementation of Artificial Bee Colony in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = ABC(FName,iterations,dims,bounds)

%% Problem Definition

nVar=dims;             % Number of Decision Variables

VarSize=[1 nVar];   % Decision Variables Matrix Size

VarMin= bounds(:,1);             % Lower Bound of Decision Variables
VarMax= bounds(:,2);            % Upper Bound of Decision Variables

%% ABC Settings

MaxIt=iterations;              % Maximum Number of Iterations

nPop=124;               % Population Size (Colony Size)

nFood = nPop/2;       % Number of Onlooker Bees
nScout=1;

L=100; % Abandonment Limit Parameter (Trial Limit)

a=1;                    % Acceleration Coefficient Upper Bound

%% Initialization

BestIndIter=zeros(MaxIt,dims);
BestFitIter=ones(MaxIt,1)*Inf;
FAccessIter=zeros(MaxIt,1);
FAccess=0;

% Empty Bee Structure
empty_bee.Position=[];
empty_bee.Cost=[];

% Initialize Population Array
pop=repmat(empty_bee,nFood,1);

% Initialize Best Solution Ever Found
BestSol.Cost=inf;

% Create Initial Population
for i=1:nFood
    for ard=1:nVar
        pop(i).Position(ard)=unifrnd(VarMin(ard),VarMax(ard));
    end
    pop(i).Cost=GetFitness(FName,pop(i).Position);
    FAccess = FAccess + 1;
    if pop(i).Cost<=BestSol.Cost
        BestSol=pop(i);
    end
end

% Abandonment Counter
C=zeros(nFood,1);

%% ABC Main Loop

for it=1:MaxIt
    
    % Recruited Bees
    for i=1:nFood
        
        % Choose k randomly, not equal to i
        K=[1:i-1 i+1:nFood];
        if numel(K) == 1
            k = 1;
        else
            k=K(randi([1 numel(K)]));
        end
        
        % Define Acceleration Coeff.
        phi=a*unifrnd(-1,+1,VarSize);
        
        % New Bee Position
        newbee.Position=pop(i).Position+phi.*(pop(i).Position-pop(k).Position);
        
        % Evaluation
        newbee.Cost=GetFitness(FName,newbee.Position);
        FAccess = FAccess + 1;
        
        % Comparision
        if newbee.Cost<=pop(i).Cost
            pop(i)=newbee;
        else
            C(i)=C(i)+1;
        end
        
    end
    
    % Calculate Fitness Values and Selection Probabilities
    F=zeros(nFood,1);
    MeanCost = mean([pop.Cost]);
    for i=1:nFood
        F(i) = exp(-pop(i).Cost/MeanCost); % Convert Cost to Fitness
    end
    P=F/sum(F);
    
    % Onlooker Bees
    for m=1:nFood
        
        % Select Source Site
        i=RouletteWheelSelection(P);
        
        % Choose k randomly, not equal to i
        K=[1:i-1 i+1:nFood];
        if numel(K) == 1 
            k = 1;
        else
            k=K(randi([1 numel(K)]));
        end
        % Define Acceleration Coeff.
        phi=a*unifrnd(-1,+1,VarSize);
        
        % New Bee Position
        newbee.Position=pop(i).Position+phi.*(pop(i).Position-pop(k).Position);
        
        % Evaluation
        newbee.Cost=GetFitness(FName,newbee.Position);
        FAccess = FAccess + 1;
        
        % Comparision
        if newbee.Cost<=pop(i).Cost
            pop(i)=newbee;
        else
            C(i)=C(i)+1;
        end
        
    end
    
    % Scout Bees

    [~, ind] = sort(C,'descend');
    if C(ind(1))>=L
        for j=1:nVar
            pop(ind(1)).Position(j)=unifrnd(VarMin(j),VarMax(j));
        end
        pop(ind(1)).Cost=GetFitness(FName,pop(ind(1)).Position);
        FAccess = FAccess + 1;
        C(ind(1))=0;
    end

    
    % Update Best Solution Ever Found
    for i=1:nFood
        if pop(i).Cost<=BestSol.Cost
            BestSol=pop(i);
        end
    end
    
    % Store Best Cost Ever Found
    BestFitIter(it)=BestSol.Cost;
    BestIndIter(it,:)=BestSol.Position;
    FAccessIter(it) = FAccess;
    
    %% Rate
    for l=1:nFood
        PopulationHistoric{it,l} = pop(l).Position;
    end
    %% Rate
    
    % Display Iteration Information
    %disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
end

% %% Rate
% if exist('PopABC.mat','file') == 2
%     load('PopABC.mat');
%     emptyCell = min(find(cellfun('isempty',cellPop)));
%     emptyCell = (emptyCell/2)+.5;
%     cellPop{1,emptyCell} = FName;
%     cellPop{2,emptyCell} = PopulationHistoric;
%     save('PopABC','cellPop');
% else
%     cellPop = cell(2,43);
%     cellPop{1,1} = FName;
%     cellPop{2,1} = PopulationHistoric;
%     save('PopABC','cellPop');
% end
% 
% %% Rate

bestFit = BestSol.Cost;
bestInd = BestSol.Position;
    
%% Results
 
% figure;
% %plot(BestCost,'LineWidth',2);
% semilogy(BestCost,'LineWidth',2);
% xlabel('Iteration');
% ylabel('Best Cost');
% grid on;
