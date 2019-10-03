%   RunAlgorithm function:
%
%   Inputs:
%   aname: algorithm name in string ex: 'cmaes'
%   FName: function name in string ex: 'Ackley'
%   iterations: Number of iterations to run
%   dims: Number of dimensions
%   bounds: Bounds in each dimension
%
%   Outputs:
%   bestFit: Fitness of the best individual
%   bestInd: Position of the best individual
%   BestFitIter: Best fitness each iteration
%   BestIndIter: Best positions each iteration
%   FAccessIter: # of Function access each iteration

function [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter] = RunAlgorithm(aname,FName,iterations,dims,bounds)
    switch(aname)
        case 'ABC'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=ABC(FName,iterations,dims,bounds);
        case 'BA'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=BA(FName,iterations,dims,bounds);
        case 'CMAES'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=CMAES(FName,iterations,dims,bounds);
        case 'CSA'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=CSA(FName,iterations,dims,bounds);
        case 'DE'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=DE(FName,iterations,dims,bounds);
        case 'FA'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=FA(FName,iterations,dims,bounds);
        case 'HS'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=HS(FName,iterations,dims,bounds);
        case 'LS'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=LS(FName,iterations,dims,bounds);
        case 'MFO'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=MFO(FName,iterations,dims,bounds);
        case 'PSO'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=PSO(FName,iterations,dims,bounds);
        case 'SA'
            %[bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=RS(FName,iterations,dims,bounds);%RS
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=SA(FName,iterations,dims,bounds);
        case 'SSO'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=SSO(FName,iterations,dims,bounds);
        case 'TLBO'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=TLBO(FName,iterations,dims,bounds);
        case 'WOA'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=WOA(FName,iterations,dims,bounds);
        case 'GWO'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=GWO(FName,iterations,dims,bounds);
        case 'YSGA'
            [bestFit,bestInd,BestFitIter,BestIndIter,FAccessIter]=YSGA(FName,iterations,dims,bounds);
        otherwise
            fprintf('\nAlgoritmo Inválido\n');
            bestFit=NaN;
            bestInd=NaN;
            BestFitIter=NaN;
            BestIndIter=NaN;
            FAccessIter=NaN;
    end
end
