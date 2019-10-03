% ======================================================== % 
% Files of the Matlab programs included in the book:       %
% Xin-She Yang, Nature-Inspired Metaheuristic Algorithms,  %
% Second Edition, Luniver Press, (2010).   www.luniver.com %
% ======================================================== %    

% -------------------------------------------------------- %
% Bat-inspired algorithm for continuous optimization (demo)%
% Programmed by Xin-She Yang @Cambridge University 2010    %
% -------------------------------------------------------- %
% Usage: bat_algorithm([20 1000 0.5 0.5]);                 %


% -------------------------------------------------------------------
% This is a simple demo version only implemented the basic          %
% idea of the bat algorithm without fine-tuning the parameters,     % 
% Then, though this demo works very well, it is expected that       %
% this demo is much less efficient than the work reported in        % 
% the following papers:                                             %
% (Citation details):                                               %
% 1) Yang X.-S., A new metaheuristic bat-inspired algorithm,        %
%    in: Nature Inspired Cooperative Strategies for Optimization    %
%    (NISCO 2010) (Eds. J. R. Gonzalez et al.), Studies in          %
%    Computational Intelligence, Springer, vol. 284, 65-74 (2010).  %
% 2) Yang X.-S., Nature-Inspired Metaheuristic Algorithms,          %
%    Second Edition, Luniver Presss, Frome, UK. (2010).             %
% 3) Yang X.-S. and Gandomi A. H., Bat algorithm: A novel           %
%    approach for global engineering optimization,                  %
%    Engineering Computations, Vol. 29, No. 5, pp. 464-483 (2012).  %
% -------------------------------------------------------------------


% Main programs starts here
function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = BA(FName,iterations,dims,bounds)
n=50;      % Population size, typically 10 to 40
N_gen=iterations;  % Number of generations
A=rand(n,1);            %loudness for each BAT
r=rand(n,1);            %pulse emission rate for each BAT
alpha=0.9;              %constant for loudness update
gamma=0.2;              %constant for emission rate update
ro=r;   
% This frequency range determines the scalings
% You should change these values if necessary
Qmin=0;         % Frequency minimum
Qmax=1;         % Frequency maximum
% Iteration parameters
N_iter=0;       % Total number of function evaluations
% Dimension of the search variables
d=dims;           % Number of dimensions 
% Lower limit/bounds/ a vector
Lb = bounds(:,1)';             % Lower Bound of Decision Variables
Ub = bounds(:,2)';             % Upper Bound of Decision Variables
% Initializing arrays
Q=zeros(n,1);   % Frequency
v=zeros(n,d);   % Velocities
% Initialize the population/solutions
BestIndIter=zeros(N_gen,dims);
BestFitIter=ones(N_gen,1)*Inf;
FAccessIter=zeros(N_gen,1);
FAccess=0;

for i=1:n
  Sol(i,:)=Lb+(Ub-Lb).*rand(1,d);
  Fitness(i)=GetFitness(FName,Sol(i,:));
  FAccess = FAccess + 1;
end

% Find the initial best solution
[fmin,I]=min(Fitness);
best=Sol(I,:);
% ======================================================  %
% Note: As this is a demo, here we did not implement the  %
% reduction of loudness and increase of emission rates.   %
% Interested readers can do some parametric studies       %
% and also implementation various changes of A and r etc  %
% ======================================================  %

% Start the iterations -- Bat Algorithm (essential part)  %
for t=1:N_gen, 
% Loop over all bats/solutions
        for i=1:n
          Q(i)=Qmin+(Qmin-Qmax)*rand;
          v(i,:)=v(i,:)+(Sol(i,:)-best)*Q(i);
          S(i,:)=Sol(i,:)+v(i,:);
          % Apply simple bounds/limits
          Sol(i,:)=simplebounds(Sol(i,:),Lb,Ub);
          % Pulse rate
          if rand>r(i)
          % The factor 0.001 limits the step sizes of random walks 
              S(i,:)=best++0.001*randn(1,d);
          end

     % Evaluate new solutions
           Fnew=GetFitness(FName,S(i,:));
           FAccess = FAccess + 1;
     % Update if the solution improves, or not too loud
           if (Fnew<=Fitness(i)) && (rand<A(i))
               Sol(i,:)=S(i,:);
               Fitness(i)=Fnew;
               A(i)=alpha*A(i);
               r(i)=ro(i)*(1-exp(-gamma*t));
           end

          % Update the current best solution
          if Fnew<=fmin
                best=S(i,:);
                fmin=Fnew;
          end
        end
        N_iter=N_iter+n;

        BestFitIter(t)=fmin;
        BestIndIter(t,:)=best;
        FAccessIter(t) = FAccess;
        
        %% Rate
        for l=1:n
            PopulationHistoric{t,l} = Sol(l,:);
        end
        %% Rate
end
bestInd = best;
bestFit = fmin;

% %% Rate
% if exist('PopBA.mat','file') == 2
%     load('PopBA.mat');
%     emptyCell = min(find(cellfun('isempty',cellPop)));
%     emptyCell = (emptyCell/2)+.5;
%     cellPop{1,emptyCell} = FName;
%     cellPop{2,emptyCell} = PopulationHistoric;
%     save('PopBA','cellPop');
% else
%     cellPop = cell(2,43);
%     cellPop{1,1} = FName;
%     cellPop{2,1} = PopulationHistoric;
%     save('PopBA','cellPop');
% end
% 
% %% Rate

%disp(['Number of evaluations: ',num2str(N_iter)]);
%disp(['Best =',num2str(best),' fmin=',num2str(fmin)]);

% Application of simple limits/bounds
function s=simplebounds(s,Lb,Ub)
  % Apply the lower bound vector
  ns_tmp=s;
  I=ns_tmp<Lb;
  ns_tmp(I)=Lb(I);
  
  % Apply the upper bound vector 
  J=ns_tmp>Ub;
  ns_tmp(J)=Ub(J);
  % Update this new move 
  s=ns_tmp;

%%%%% ============ end ====================================


