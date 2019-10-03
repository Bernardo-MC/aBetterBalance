% Obtained from https://la.mathworks.com/matlabcentral/fileexchange/56127-crow-search-algorithm

% PAPA comments
% changed l and u for VarMin,VarMax
% VarMin,VarMax are vectors of bounds instead of one bound
% New for on the section of "Update position and memory" to iterate each dimension


% -------------------------------------------------
% Citation details:
% Alireza Askarzadeh, Anovel metaheuristic method for solving constrained
% engineering optimization problems: Crow search algorithm, Computers &
% Structures, Vol. 169, 1-12, 2016.

% Programmed by Alireza Askarzadeh at Kerman Graduate %
% University of Advanced Technology (KGUT) %
% Date of programming: September 2015 %
% -------------------------------------------------
% This demo only implements a standard version of CSA for minimization of
% a standard test function (Sphere) on MATLAB 7.6.0 (R2008a).
% -------------------------------------------------
% Note:
% Due to the stochastic nature of meta-heuristc algorithms, different runs
% may lead to slightly different results.
% -------------------------------------------------

function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = CSA(FName,iterations,dims,bounds)

    format long;
    BestIndIter=zeros(iterations,dims);
    BestFitIter=ones(iterations,1)*Inf;
    FAccessIter=zeros(iterations,1);
    FAccess=0;
    
    pd=dims; % Problem dimension (number of decision variables) % * PAPA 
    N=50; % Flock (population) size % * PAPA Original 20
    AP=0.1; % Awareness probability
    fl=2; % Flight length (fl)


    VarMin= bounds(:,1); % Lower Bound of Decision Variables % + PAPA
    VarMax= bounds(:,2); % Upper Bound of Decision Variables % + PAPA

    %[x VarMin VarMax]=init(N,pd); % Function for initialization % - PAPA
    [x]=init(N,pd,VarMin,VarMax); % Function for initialization % + PAPA

    xn=x; %Population
    
    for i=1:N
        ft(i)=GetFitness(FName,xn(i,:));
    end
    FAccess = FAccess + 1;
    %ft=fitness(xn,N,pd); % Function for fitness evaluation

    mem=x; % Memory initialization
    fit_mem=ft; % Fitness of memory positions

    tmax=iterations; % Maximum number of iterations (itermax) %Original 5000
    

    
    for t=1:tmax

        num=ceil(N*rand(1,N)); % Generation of random candidate crows for following (chasing)
        for i=1:N
            if rand>AP
                xnew(i,:)= x(i,:)+fl*rand*(mem(num(i),:)-x(i,:)); % Generation of a new position for crow i (state 1)
            else
                for j=1:pd
                    xnew(i,j)=VarMin(pd)-(VarMin(pd)-VarMax(pd))*rand; % Generation of a new position for crow i (state 2)
                end
            end
            xn=xnew(i,:);
            ft(i)=GetFitness(FName,xn);
            FAccess = FAccess + 1;
        end


        %ft=fitness(xn,N,pd); % Function for fitness evaluation of new solutions

        for i=1:N % Update position and memory
            for j=1:pd
                if xnew(i,pd)>=VarMin(pd) && xnew(i,pd)<=VarMax(pd)
                    x(i,pd)=xnew(i,pd); % Update position
                    if ft(i)<fit_mem(i)
                        mem(i,pd)=xnew(i,pd); % Update memory
                        fit_mem(i)=ft(i);
                    end
                end
            end
        end
        
        %% Rate
        for l=1:N
            PopulationHistoric{t,l} = x(l,:);
        end
        %% Rate

        BestFitIter(t)=min(fit_mem); % Best found value until iteration t
        BestIndIter(t,:) = xn;
        FAccessIter(t) = FAccess;
        

    end

    ngbest=find(fit_mem== min(fit_mem));
    bestInd=mem(ngbest(1),:); % Solution of the problem
    bestFit=fit_mem(ngbest(1));
    
%     %% Rate
%     if exist('PopCSA.mat','file') == 2
%         load('PopCSA.mat');
%         emptyCell = min(find(cellfun('isempty',cellPop)));
%         emptyCell = (emptyCell/2)+.5;
%         cellPop{1,emptyCell} = FName;
%         cellPop{2,emptyCell} = PopulationHistoric;
%         save('PopCSA','cellPop');
%     else
%         cellPop = cell(2,43);
%         cellPop{1,1} = FName;
%         cellPop{2,1} = PopulationHistoric;
%         save('PopCSA','cellPop');
%     end
%     
%     %% Rate
end

