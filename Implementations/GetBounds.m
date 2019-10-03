%   GetBounds function:
%
% * Inputs:
%   I1: function name in string ex: 'Ackley'
%   I2: number of dimensions ex: 4
%
% * Outputs:
%   O1: colum vector of lower bounds ex: [-30;-30;-30;-30]
%   O2: colum vector of upper bounds ex: [30;30;30;30;]
%   O3: number of dimensions ex: 4
%   O3 overwrites the dimension number if the problem is not n dimensional

%   Inputs:
%   I1: function name in string ex: 'Ackley'
%   I2: vector to be evaluated ex: [0,.05,0.02]
%   Outputs:
%   O1: fitness  ex: 0.1750


function [low,up,dims] = GetBounds(funcName,dims)

switch(funcName)
    %% ROTB 1
    case 'ROTB'
        [low,up,dims]=ROTB.Bounds(dims);
        
    %% Multimodales 1:28
    case 'Ackley'
        [low,up,dims]=Ackley.Bounds(dims);
    case 'Dixon'
        [low,up,dims]=Dixon.Bounds(dims);
    case 'Griewank'
        [low,up,dims]=Griewank.Bounds(dims);
    case 'Infinity'
        [low,up,dims]=Infinity.Bounds(dims);
    case 'Levy'
        [low,up,dims]=Levy.Bounds(dims);
    case 'Mishra1'
        [low,up,dims]=Mishra1.Bounds(dims);
    case 'Mishra2'
        [low,up,dims]=Mishra2.Bounds(dims);
    case 'Mishra11'
        [low,up,dims]=Mishra11.Bounds(dims);
    case 'MultiModal'
        [low,up,dims]=MultiModal.Bounds(dims);
    case 'Penalty1'
        [low,up,dims]=Penalty1.Bounds(dims);
    case 'Penalty2'
        [low,up,dims]=Penalty2.Bounds(dims);
    case 'Perm1'
        [low,up,dims]=Perm1.Bounds(dims);
    case 'Perm2'
        [low,up,dims]=Perm2.Bounds(dims);
    case 'Plateau'
        [low,up,dims]=Plateau.Bounds(dims);
    case 'Powell'
        [low,up,dims]=Powell.Bounds(dims);
    case 'Qing'
        [low,up,dims]=Qing.Bounds(dims);
    case 'Quartic'
        [low,up,dims]=Quartic.Bounds(dims);
    case 'Quintic'
        [low,up,dims]=Quintic.Bounds(dims);
    case 'Rastringin'
        [low,up,dims]=Rastringin.Bounds(dims);
    case 'Rosenbrock'
        [low,up,dims]=Rosenbrock.Bounds(dims);
    case 'Schwefel21'
        [low,up,dims]=Schwefel21.Bounds(dims);
    case 'Schwefel22'
        [low,up,dims]=Schwefel22.Bounds(dims);
    case 'Schwefel26'
        [low,up,dims]=Schwefel26.Bounds(dims);
    case 'Step'
        [low,up,dims]=Step.Bounds(dims);
    case 'Stybtang'
        [low,up,dims]=Stybtang.Bounds(dims);
    case 'Trid'
        [low,up,dims]=Trid.Bounds(dims);
    case 'Vincent'
        [low,up,dims]=Vincent.Bounds(dims);
    case 'Zakharov'
        [low,up,dims]=Zakharov.Bounds(dims);
        
    %% Unimodales 29:33
    case 'Rothyp'
        [low,up,dims]=Rothyp.Bounds(dims);
    case 'Schwefel2'
        [low,up,dims]=Schwefel2.Bounds(dims);
    case 'Sphere'
        [low,up,dims]=Sphere.Bounds(dims);
    case 'Sum2'
        [low,up,dims]=Sum2.Bounds(dims);
    case 'Sumpow'
        [low,up,dims]=Sumpow.Bounds(dims);
        
    %% Trasladadas 
    case 'ShiftedAckley'
        [low,up,dims]=ShiftedAckley.Bounds(dims);
    case 'ShiftedPowell'
        [low,up,dims]=ShiftedPowell.Bounds(dims);
    case 'ShiftedRastringin'
        [low,up,dims]=ShiftedRastringin.Bounds(dims);
    case 'ShiftedRosenbrock'
        [low,up,dims]=ShiftedRosenbrock.Bounds(dims);
    case 'ShiftedRothyp'
        [low,up,dims]=ShiftedRothyp.Bounds(dims);
    case 'ShiftedSchwefel2'
        [low,up,dims]=ShiftedSchwefel2.Bounds(dims);
    case 'ShiftedSchwefel22'
        [low,up,dims]=ShiftedSchwefel22.Bounds(dims);
    case 'ShiftedSphere'
        [low,up,dims]=ShiftedSphere.Bounds(dims);
    case 'ShiftedSum2'
        [low,up,dims]=ShiftedSum2.Bounds(dims);        
                
    %% Híbridas 34:37
    case 'fx15'
        [low,up,dims]=fx15.Bounds(dims);
    case 'fx16'
        [low,up,dims]=fx16.Bounds(dims);
    case 'fx17'
        [low,up,dims]=fx17.Bounds(dims);
    case 'fx18'
        [low,up,dims]=fx18.Bounds(dims);
        
    %% CEC2017 2DIM 38:52
    case 'CEC17F1D2' %Shifted and Rotated Bent Cigar Function
        [low,up,dims]=CEC17F1D2.Bounds(dims);
    case 'CEC17F2D2' %Shifted and Rotated Sum of Different Power Function
        [low,up,dims]=CEC17F2D2.Bounds(dims);
    case 'CEC17F3D2' %Shifted and Rotated Zakharov Function 
        [low,up,dims]=CEC17F3D2.Bounds(dims);
    case 'CEC17F4D2' %Shifted and Rotated Rosenbrock’s Function 
        [low,up,dims]=CEC17F4D2.Bounds(dims);
    case 'CEC17F5D2' %Shifted and Rotated Rastrigin’s Function 
        [low,up,dims]=CEC17F5D2.Bounds(dims);
    case 'CEC17F6D2' %Shifted and Rotated Expanded Scaffer’s F6 Function
        [low,up,dims]=CEC17F6D2.Bounds(dims);
    case 'CEC17F7D2' %Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [low,up,dims]=CEC17F7D2.Bounds(dims);
    case 'CEC17F8D2' %Shifted and Rotated Non-Continuous Rastrigin’s Function
        [low,up,dims]=CEC17F8D2.Bounds(dims);
    case 'CEC17F9D2' %Shifted and Rotated Levy Function 
        [low,up,dims]=CEC17F9D2.Bounds(dims);
    case 'CEC17F23D2' %Composition Function 3 (N=4)
        [low,up,dims]=CEC17F23D2.Bounds(dims);
    case 'CEC17F24D2' %Composition Function 4 (N=4)
        [low,up,dims]=CEC17F24D2.Bounds(dims);
    case 'CEC17F25D2' %Composition Function 5 (N=5)
        [low,up,dims]=CEC17F25D2.Bounds(dims);
    case 'CEC17F26D2' %Composition Function 6 (N=5)
        [low,up,dims]=CEC17F26D2.Bounds(dims);
    case 'CEC17F27D2' %Composition Function 7 (N=6)
        [low,up,dims]=CEC17F27D2.Bounds(dims);
    case 'CEC17F28D2' %Composition Function 8 (N=6)
        [low,up,dims]=CEC17F28D2.Bounds(dims);
        
    %% CEC2017 10DIM 53:82
    case 'CEC17F1D10' %Shifted and Rotated Bent Cigar Function
        [low,up,dims]=CEC17F1D10.Bounds(dims);
    case 'CEC17F2D10' %Shifted and Rotated Sum of Different Power Function
        [low,up,dims]=CEC17F2D10.Bounds(dims);
    case 'CEC17F3D10' %Shifted and Rotated Zakharov Function 
        [low,up,dims]=CEC17F3D10.Bounds(dims);
    case 'CEC17F4D10' %Shifted and Rotated Rosenbrock’s Function 
        [low,up,dims]=CEC17F4D10.Bounds(dims);
    case 'CEC17F5D10' %Shifted and Rotated Rastrigin’s Function 
        [low,up,dims]=CEC17F5D10.Bounds(dims);
    case 'CEC17F6D10' %Shifted and Rotated Expanded Scaffer’s F6 Function
        [low,up,dims]=CEC17F6D10.Bounds(dims);
    case 'CEC17F7D10' %Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [low,up,dims]=CEC17F7D10.Bounds(dims);
    case 'CEC17F8D10' %Shifted and Rotated Non-Continuous Rastrigin’s Function
        [low,up,dims]=CEC17F8D10.Bounds(dims);
    case 'CEC17F9D10' %Shifted and Rotated Levy Function 
        [low,up,dims]=CEC17F9D10.Bounds(dims);
    case 'CEC17F10D10' %Shifted and Rotated Schwefel’s Function 
        [low,up,dims]=CEC17F10D10.Bounds(dims);
    case 'CEC17F11D10' %Hybrid Function 1 (N=3)
        [low,up,dims]=CEC17F11D10.Bounds(dims);
    case 'CEC17F12D10' %Hybrid Function 2 (N=3)
        [low,up,dims]=CEC17F12D10.Bounds(dims);
    case 'CEC17F13D10' %Hybrid Function 3 (N=3)
        [low,up,dims]=CEC17F13D10.Bounds(dims);
    case 'CEC17F14D10' %Hybrid Function 4 (N=4) 
        [low,up,dims]=CEC17F14D10.Bounds(dims);
    case 'CEC17F15D10' %Hybrid Function 5 (N=4) 
        [low,up,dims]=CEC17F15D10.Bounds(dims);
    case 'CEC17F16D10' %Hybrid Function 6 (N=4) 
        [low,up,dims]=CEC17F16D10.Bounds(dims);
    case 'CEC17F17D10' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F17D10.Bounds(dims);
    case 'CEC17F18D10' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F18D10.Bounds(dims);
    case 'CEC17F19D10' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F19D10.Bounds(dims);
    case 'CEC17F20D10' %Hybrid Function 6 (N=6) 
        [low,up,dims]=CEC17F20D10.Bounds(dims);
    case 'CEC17F21D10' %Composition Function 1 (N=3) 
        [low,up,dims]=CEC17F21D10.Bounds(dims);
    case 'CEC17F22D10' %Composition Function 2 (N=3) 
        [low,up,dims]=CEC17F22D10.Bounds(dims);
    case 'CEC17F23D10' %Composition Function 3 (N=4)
        [low,up,dims]=CEC17F23D10.Bounds(dims);
    case 'CEC17F24D10' %Composition Function 4 (N=4)
        [low,up,dims]=CEC17F24D10.Bounds(dims);
    case 'CEC17F25D10' %Composition Function 5 (N=5)
        [low,up,dims]=CEC17F25D10.Bounds(dims);
    case 'CEC17F26D10' %Composition Function 6 (N=5)
        [low,up,dims]=CEC17F26D10.Bounds(dims);
    case 'CEC17F27D10' %Composition Function 7 (N=6)
        [low,up,dims]=CEC17F27D10.Bounds(dims);
    case 'CEC17F28D10' %Composition Function 8 (N=6)
        [low,up,dims]=CEC17F28D10.Bounds(dims);
    case 'CEC17F29D10' %Composition Function 9 (N=3)
        [low,up,dims]=CEC17F29D10.Bounds(dims);
    case 'CEC17F30D10' %Composition Function 10 (N=2)
        [low,up,dims]=CEC17F30D10.Bounds(dims);

    %% CEC2017 30DIM 83:112
    case 'CEC17F1D30' %Shifted and Rotated Bent Cigar Function
        [low,up,dims]=CEC17F1D30.Bounds(dims);
    case 'CEC17F2D30' %Shifted and Rotated Sum of Different Power Function
        [low,up,dims]=CEC17F2D30.Bounds(dims);
    case 'CEC17F3D30' %Shifted and Rotated Zakharov Function 
        [low,up,dims]=CEC17F3D30.Bounds(dims);
    case 'CEC17F4D30' %Shifted and Rotated Rosenbrock’s Function 
        [low,up,dims]=CEC17F4D30.Bounds(dims);
    case 'CEC17F5D30' %Shifted and Rotated Rastrigin’s Function 
        [low,up,dims]=CEC17F5D30.Bounds(dims);
    case 'CEC17F6D30' %Shifted and Rotated Expanded Scaffer’s F6 Function
        [low,up,dims]=CEC17F6D30.Bounds(dims);
    case 'CEC17F7D30' %Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [low,up,dims]=CEC17F7D30.Bounds(dims);
    case 'CEC17F8D30' %Shifted and Rotated Non-Continuous Rastrigin’s Function
        [low,up,dims]=CEC17F8D30.Bounds(dims);
    case 'CEC17F9D30' %Shifted and Rotated Levy Function 
        [low,up,dims]=CEC17F9D30.Bounds(dims);
    case 'CEC17F10D30' %Shifted and Rotated Schwefel’s Function 
        [low,up,dims]=CEC17F10D30.Bounds(dims);
    case 'CEC17F11D30' %Hybrid Function 1 (N=3)
        [low,up,dims]=CEC17F11D30.Bounds(dims);
    case 'CEC17F12D30' %Hybrid Function 2 (N=3)
        [low,up,dims]=CEC17F12D30.Bounds(dims);
    case 'CEC17F13D30' %Hybrid Function 3 (N=3)
        [low,up,dims]=CEC17F13D30.Bounds(dims);
    case 'CEC17F14D30' %Hybrid Function 4 (N=4) 
        [low,up,dims]=CEC17F14D30.Bounds(dims);
    case 'CEC17F15D30' %Hybrid Function 5 (N=4) 
        [low,up,dims]=CEC17F15D30.Bounds(dims);
    case 'CEC17F16D30' %Hybrid Function 6 (N=4) 
        [low,up,dims]=CEC17F16D30.Bounds(dims);
    case 'CEC17F17D30' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F17D30.Bounds(dims);
    case 'CEC17F18D30' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F18D30.Bounds(dims);
    case 'CEC17F19D30' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F19D30.Bounds(dims);
    case 'CEC17F20D30' %Hybrid Function 6 (N=6) 
        [low,up,dims]=CEC17F20D30.Bounds(dims);
    case 'CEC17F21D30' %Composition Function 1 (N=3) 
        [low,up,dims]=CEC17F21D30.Bounds(dims);
    case 'CEC17F22D30' %Composition Function 2 (N=3) 
        [low,up,dims]=CEC17F22D30.Bounds(dims);
    case 'CEC17F23D30' %Composition Function 3 (N=4)
        [low,up,dims]=CEC17F23D30.Bounds(dims);
    case 'CEC17F24D30' %Composition Function 4 (N=4)
        [low,up,dims]=CEC17F24D30.Bounds(dims);
    case 'CEC17F25D30' %Composition Function 5 (N=5)
        [low,up,dims]=CEC17F25D30.Bounds(dims);
    case 'CEC17F26D30' %Composition Function 6 (N=5)
        [low,up,dims]=CEC17F26D30.Bounds(dims);
    case 'CEC17F27D30' %Composition Function 7 (N=6)
        [low,up,dims]=CEC17F27D30.Bounds(dims);
    case 'CEC17F28D30' %Composition Function 8 (N=6)
        [low,up,dims]=CEC17F28D30.Bounds(dims);
    case 'CEC17F29D30' %Composition Function 9 (N=3)
        [low,up,dims]=CEC17F29D30.Bounds(dims);
    case 'CEC17F30D30' %Composition Function 10 (N=2)
        [low,up,dims]=CEC17F30D30.Bounds(dims);

    %% CEC2017 50DIM 113:142
    case 'CEC17F1D50' %Shifted and Rotated Bent Cigar Function
        [low,up,dims]=CEC17F1D50.Bounds(dims);
    case 'CEC17F2D50' %Shifted and Rotated Sum of Different Power Function
        [low,up,dims]=CEC17F2D50.Bounds(dims);
    case 'CEC17F3D50' %Shifted and Rotated Zakharov Function 
        [low,up,dims]=CEC17F3D50.Bounds(dims);
    case 'CEC17F4D50' %Shifted and Rotated Rosenbrock’s Function 
        [low,up,dims]=CEC17F4D50.Bounds(dims);
    case 'CEC17F5D50' %Shifted and Rotated Rastrigin’s Function 
        [low,up,dims]=CEC17F5D50.Bounds(dims);
    case 'CEC17F6D50' %Shifted and Rotated Expanded Scaffer’s F6 Function
        [low,up,dims]=CEC17F6D50.Bounds(dims);
    case 'CEC17F7D50' %Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [low,up,dims]=CEC17F7D50.Bounds(dims);
    case 'CEC17F8D50' %Shifted and Rotated Non-Continuous Rastrigin’s Function
        [low,up,dims]=CEC17F8D50.Bounds(dims);
    case 'CEC17F9D50' %Shifted and Rotated Levy Function 
        [low,up,dims]=CEC17F9D50.Bounds(dims);
    case 'CEC17F10D50' %Shifted and Rotated Schwefel’s Function 
        [low,up,dims]=CEC17F10D50.Bounds(dims);
    case 'CEC17F11D50' %Hybrid Function 1 (N=3)
        [low,up,dims]=CEC17F11D50.Bounds(dims);
    case 'CEC17F12D50' %Hybrid Function 2 (N=3)
        [low,up,dims]=CEC17F12D50.Bounds(dims);
    case 'CEC17F13D50' %Hybrid Function 3 (N=3)
        [low,up,dims]=CEC17F13D50.Bounds(dims);
    case 'CEC17F14D50' %Hybrid Function 4 (N=4) 
        [low,up,dims]=CEC17F14D50.Bounds(dims);
    case 'CEC17F15D50' %Hybrid Function 5 (N=4) 
        [low,up,dims]=CEC17F15D50.Bounds(dims);
    case 'CEC17F16D50' %Hybrid Function 6 (N=4) 
        [low,up,dims]=CEC17F16D50.Bounds(dims);
    case 'CEC17F17D50' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F17D50.Bounds(dims);
    case 'CEC17F18D50' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F18D50.Bounds(dims);
    case 'CEC17F19D50' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F19D50.Bounds(dims);
    case 'CEC17F20D50' %Hybrid Function 6 (N=6) 
        [low,up,dims]=CEC17F20D50.Bounds(dims);
    case 'CEC17F21D50' %Composition Function 1 (N=3) 
        [low,up,dims]=CEC17F21D50.Bounds(dims);
    case 'CEC17F22D50' %Composition Function 2 (N=3) 
        [low,up,dims]=CEC17F22D50.Bounds(dims);
    case 'CEC17F23D50' %Composition Function 3 (N=4)
        [low,up,dims]=CEC17F23D50.Bounds(dims);
    case 'CEC17F24D50' %Composition Function 4 (N=4)
        [low,up,dims]=CEC17F24D50.Bounds(dims);
    case 'CEC17F25D50' %Composition Function 5 (N=5)
        [low,up,dims]=CEC17F25D50.Bounds(dims);
    case 'CEC17F26D50' %Composition Function 6 (N=5)
        [low,up,dims]=CEC17F26D50.Bounds(dims);
    case 'CEC17F27D50' %Composition Function 7 (N=6)
        [low,up,dims]=CEC17F27D50.Bounds(dims);
    case 'CEC17F28D50' %Composition Function 8 (N=6)
        [low,up,dims]=CEC17F28D50.Bounds(dims);
    case 'CEC17F29D50' %Composition Function 9 (N=3)
        [low,up,dims]=CEC17F29D50.Bounds(dims);
    case 'CEC17F30D50' %Composition Function 10 (N=2)
        [low,up,dims]=CEC17F30D50.Bounds(dims);

    %% CEC2017 100DIM 143:172
    case 'CEC17F1D100' %Shifted and Rotated Bent Cigar Function
        [low,up,dims]=CEC17F1D100.Bounds(dims);
    case 'CEC17F2D100' %Shifted and Rotated Sum of Different Power Function
        [low,up,dims]=CEC17F2D100.Bounds(dims);
    case 'CEC17F3D100' %Shifted and Rotated Zakharov Function 
        [low,up,dims]=CEC17F3D100.Bounds(dims);
    case 'CEC17F4D100' %Shifted and Rotated Rosenbrock’s Function 
        [low,up,dims]=CEC17F4D100.Bounds(dims);
    case 'CEC17F5D100' %Shifted and Rotated Rastrigin’s Function 
        [low,up,dims]=CEC17F5D100.Bounds(dims);
    case 'CEC17F6D100' %Shifted and Rotated Expanded Scaffer’s F6 Function
        [low,up,dims]=CEC17F6D100.Bounds(dims);
    case 'CEC17F7D100' %Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [low,up,dims]=CEC17F7D100.Bounds(dims);
    case 'CEC17F8D100' %Shifted and Rotated Non-Continuous Rastrigin’s Function
        [low,up,dims]=CEC17F8D100.Bounds(dims);
    case 'CEC17F9D100' %Shifted and Rotated Levy Function 
        [low,up,dims]=CEC17F9D100.Bounds(dims);
    case 'CEC17F10D100' %Shifted and Rotated Schwefel’s Function 
        [low,up,dims]=CEC17F10D100.Bounds(dims);
    case 'CEC17F11D100' %Hybrid Function 1 (N=3)
        [low,up,dims]=CEC17F11D100.Bounds(dims);
    case 'CEC17F12D100' %Hybrid Function 2 (N=3)
        [low,up,dims]=CEC17F12D100.Bounds(dims);
    case 'CEC17F13D100' %Hybrid Function 3 (N=3)
        [low,up,dims]=CEC17F13D100.Bounds(dims);
    case 'CEC17F14D100' %Hybrid Function 4 (N=4) 
        [low,up,dims]=CEC17F14D100.Bounds(dims);
    case 'CEC17F15D100' %Hybrid Function 5 (N=4) 
        [low,up,dims]=CEC17F15D100.Bounds(dims);
    case 'CEC17F16D100' %Hybrid Function 6 (N=4) 
        [low,up,dims]=CEC17F16D100.Bounds(dims);
    case 'CEC17F17D100' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F17D100.Bounds(dims);
    case 'CEC17F18D100' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F18D100.Bounds(dims);
    case 'CEC17F19D100' %Hybrid Function 6 (N=5)
        [low,up,dims]=CEC17F19D100.Bounds(dims);
    case 'CEC17F20D100' %Hybrid Function 6 (N=6) 
        [low,up,dims]=CEC17F20D100.Bounds(dims);
    case 'CEC17F21D100' %Composition Function 1 (N=3) 
        [low,up,dims]=CEC17F21D100.Bounds(dims);
    case 'CEC17F22D100' %Composition Function 2 (N=3) 
        [low,up,dims]=CEC17F22D100.Bounds(dims);
    case 'CEC17F23D100' %Composition Function 3 (N=4)
        [low,up,dims]=CEC17F23D100.Bounds(dims);
    case 'CEC17F24D100' %Composition Function 4 (N=4)
        [low,up,dims]=CEC17F24D100.Bounds(dims);
    case 'CEC17F25D100' %Composition Function 5 (N=5)
        [low,up,dims]=CEC17F25D100.Bounds(dims);
    case 'CEC17F26D100' %Composition Function 6 (N=5)
        [low,up,dims]=CEC17F26D100.Bounds(dims);
    case 'CEC17F27D100' %Composition Function 7 (N=6)
        [low,up,dims]=CEC17F27D100.Bounds(dims);
    case 'CEC17F28D100' %Composition Function 8 (N=6)
        [low,up,dims]=CEC17F28D100.Bounds(dims);
    case 'CEC17F29D100' %Composition Function 9 (N=3)
        [low,up,dims]=CEC17F29D100.Bounds(dims);
    case 'CEC17F30D100' %Composition Function 10 (N=2)
        [low,up,dims]=CEC17F30D100.Bounds(dims);

    %% Problemas de ingeniería 173:178
    case 'Engranajes' %   Optimal Design of a gear train problem:
        [low,up,dims]=Engranajes.Bounds(dims);
    case 'RecipientePresion' %   Pressure Vessel Design problem:
        [low,up,dims]=RecipientePresion.Bounds(dims);
    case 'Resorte' %   Tension/Compression Spring Design problem:
        [low,up,dims]=Resorte.Bounds(dims);
    case 'SintetizadorFM' %   Parameter estimation for FM synthesizers problem:
        [low,up,dims]=SintetizadorFM.Bounds(dims);
    case 'TresBarras' %   Design of a Three-bar truss problem:
        [low,up,dims]=TresBarras.Bounds(dims);
    case 'VigaSoldada' %   Welded Beam Design problem:
        [low,up,dims]=VigaSoldada.Bounds(dims);

    %% Error
    otherwise
        fprintf('\nFucnión Inválida\n');
        low=NaN;
        up=NaN;
        dims=NaN;
end

end

