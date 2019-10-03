%   GetFitness function:
%
%   Inputs:
%   I1: function name in string ex: 'Ackley'
%   I2: vector to be evaluated ex: [0,.05,0.02]
%
%   Outputs:
%   O1: fitness  ex: 0.1750

function [fit] = GetFitness(funcName,x)

switch(funcName)
    %% ROTB 1
    case 'ROTB'
        [fit]=ROTB.Fit(x);
        
    %% Multimodales 1:28
    case 'Ackley'
        [fit]=Ackley.Fit(x);
    case 'Dixon'
        [fit]=Dixon.Fit(x);
    case 'Griewank'
        [fit]=Griewank.Fit(x);
    case 'Infinity'
        [fit]=Infinity.Fit(x);
    case 'Levy'
        [fit]=Levy.Fit(x);
    case 'Mishra1'
        [fit]=Mishra1.Fit(x);
    case 'Mishra2'
        [fit]=Mishra2.Fit(x);
    case 'Mishra11'
        [fit]=Mishra11.Fit(x);
    case 'MultiModal'
        [fit]=MultiModal.Fit(x);
    case 'Penalty1'
        [fit]=Penalty1.Fit(x);
    case 'Penalty2'
        [fit]=Penalty2.Fit(x);
    case 'Perm1'
        [fit]=Perm1.Fit(x);
    case 'Perm2'
        [fit]=Perm2.Fit(x);
    case 'Plateau'
        [fit]=Plateau.Fit(x);
    case 'Powell'
        [fit]=Powell.Fit(x);
    case 'Qing'
        [fit]=Qing.Fit(x);
    case 'Quartic'
        [fit]=Quartic.Fit(x);
    case 'Quintic'
        [fit]=Quintic.Fit(x);
    case 'Rastringin'
        [fit]=Rastringin.Fit(x);
    case 'Rosenbrock'
        [fit]=Rosenbrock.Fit(x);
    case 'Schwefel21'
        [fit]=Schwefel21.Fit(x);
    case 'Schwefel22'
        [fit]=Schwefel22.Fit(x);
    case 'Schwefel26'
        [fit]=Schwefel26.Fit(x);
    case 'Step'
        [fit]=Step.Fit(x);
    case 'Stybtang'
        [fit]=Stybtang.Fit(x);
    case 'Trid'
        [fit]=Trid.Fit(x);
    case 'Vincent'
        [fit]=Vincent.Fit(x);
    case 'Zakharov'
        [fit]=Zakharov.Fit(x);
        
    %% Unimodales 29:33
    case 'Rothyp'
        [fit]=Rothyp.Fit(x);
    case 'Schwefel2'
        [fit]=Schwefel2.Fit(x);
    case 'Sphere'
        [fit]=Sphere.Fit(x);
    case 'Sum2'
        [fit]=Sum2.Fit(x);
    case 'Sumpow'
        [fit]=Sumpow.Fit(x);

    %% Trasladadas 
    case 'ShiftedAckley'
        [fit]=ShiftedAckley.Fit(x);
    case 'ShiftedPowell'
        [fit]=ShiftedPowell.Fit(x);
    case 'ShiftedRastringin'
        [fit]=ShiftedRastringin.Fit(x);
    case 'ShiftedRosenbrock'
        [fit]=ShiftedRosenbrock.Fit(x);
    case 'ShiftedRothyp'
        [fit]=ShiftedRothyp.Fit(x);
    case 'ShiftedSchwefel2'
        [fit]=ShiftedSchwefel2.Fit(x);
    case 'ShiftedSchwefel22'
        [fit]=ShiftedSchwefel22.Fit(x);
    case 'ShiftedSphere'
        [fit]=ShiftedSphere.Fit(x);
    case 'ShiftedSum2'
        [fit]=ShiftedSum2.Fit(x);

        
    %% Híbridas 34:37
    case 'fx15'
        [fit]=fx15.Fit(x);
    case 'fx16'
        [fit]=fx16.Fit(x);
    case 'fx17'
        [fit]=fx17.Fit(x);
    case 'fx18'
        [fit]=fx18.Fit(x);
        
    %% CEC2017 2DIM 38:52
    case 'CEC17F1D2' % Shifted and Rotated Bent Cigar Function
        [fit]=CEC17F1D2.Fit(x);
    case 'CEC17F2D2' % Shifted and Rotated Sum of Different Power Function
        [fit]=CEC17F2D2.Fit(x);
    case 'CEC17F3D2' % Shifted and Rotated Zakharov Function 
        [fit]=CEC17F3D2.Fit(x);
    case 'CEC17F4D2' % Shifted and Rotated Rosenbrock’s Function 
        [fit]=CEC17F4D2.Fit(x);
    case 'CEC17F5D2' % Shifted and Rotated Rastrigin’s Function 
        [fit]=CEC17F5D2.Fit(x);
    case 'CEC17F6D2' % Shifted and Rotated Expanded Scaffer’s F6 Function
        [fit]=CEC17F6D2.Fit(x);
    case 'CEC17F7D2' % Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [fit]=CEC17F7D2.Fit(x);
    case 'CEC17F8D2' % Shifted and Rotated Non-Continuous Rastrigin’s Function
        [fit]=CEC17F8D2.Fit(x);
    case 'CEC17F9D2' % Shifted and Rotated Levy Function 
        [fit]=CEC17F9D2.Fit(x);
    case 'CEC17F23D2' % Composition Function 3 (N=4)
        [fit]=CEC17F23D2.Fit(x);
    case 'CEC17F24D2' % Composition Function 4 (N=4)
        [fit]=CEC17F24D2.Fit(x);
    case 'CEC17F25D2' % Composition Function 5 (N=5)
        [fit]=CEC17F25D2.Fit(x);
    case 'CEC17F26D2' % Composition Function 6 (N=5)
        [fit]=CEC17F26D2.Fit(x);
    case 'CEC17F27D2' % Composition Function 7 (N=6)
        [fit]=CEC17F27D2.Fit(x);
    case 'CEC17F28D2' % Composition Function 8 (N=6)
        [fit]=CEC17F28D2.Fit(x);
        
    %% CEC2017 10DIM 53:82
    case 'CEC17F1D10' % Shifted and Rotated Bent Cigar Function
        [fit]=CEC17F1D10.Fit(x);
    case 'CEC17F2D10' % Shifted and Rotated Sum of Different Power Function
        [fit]=CEC17F2D10.Fit(x);
    case 'CEC17F3D10' % Shifted and Rotated Zakharov Function 
        [fit]=CEC17F3D10.Fit(x);
    case 'CEC17F4D10' % Shifted and Rotated Rosenbrock’s Function 
        [fit]=CEC17F4D10.Fit(x);
    case 'CEC17F5D10' % Shifted and Rotated Rastrigin’s Function 
        [fit]=CEC17F5D10.Fit(x);
    case 'CEC17F6D10' % Shifted and Rotated Expanded Scaffer’s F6 Function
        [fit]=CEC17F6D10.Fit(x);
    case 'CEC17F7D10' % Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [fit]=CEC17F7D10.Fit(x);
    case 'CEC17F8D10' % Shifted and Rotated Non-Continuous Rastrigin’s Function
        [fit]=CEC17F8D10.Fit(x);
    case 'CEC17F9D10' % Shifted and Rotated Levy Function 
        [fit]=CEC17F9D10.Fit(x);
    case 'CEC17F10D10' % Shifted and Rotated Schwefel’s Function 
        [fit]=CEC17F10D10.Fit(x);
    case 'CEC17F11D10' % Hybrid Function 1 (N=3)
        [fit]=CEC17F11D10.Fit(x);
    case 'CEC17F12D10' % Hybrid Function 2 (N=3)
        [fit]=CEC17F12D10.Fit(x);
    case 'CEC17F13D10' % Hybrid Function 3 (N=3)
        [fit]=CEC17F13D10.Fit(x);
    case 'CEC17F14D10' % Hybrid Function 4 (N=4) 
        [fit]=CEC17F14D10.Fit(x);
    case 'CEC17F15D10' % Hybrid Function 5 (N=4) 
        [fit]=CEC17F15D10.Fit(x);
    case 'CEC17F16D10' % Hybrid Function 6 (N=4) 
        [fit]=CEC17F16D10.Fit(x);
    case 'CEC17F17D10' % Hybrid Function 7 (N=5)
        [fit]=CEC17F17D10.Fit(x);
    case 'CEC17F18D10' % Hybrid Function 8 (N=5)
        [fit]=CEC17F18D10.Fit(x);
    case 'CEC17F19D10' % Hybrid Function 9 (N=5)
        [fit]=CEC17F19D10.Fit(x);
    case 'CEC17F20D10' % Hybrid Function 10 (N=6) 
        [fit]=CEC17F20D10.Fit(x);
    case 'CEC17F21D10' % Composition Function 1 (N=3) 
        [fit]=CEC17F21D10.Fit(x);
    case 'CEC17F22D10' % Composition Function 2 (N=3) 
        [fit]=CEC17F22D10.Fit(x);
    case 'CEC17F23D10' % Composition Function 3 (N=4)
        [fit]=CEC17F23D10.Fit(x);
    case 'CEC17F24D10' % Composition Function 4 (N=4)
        [fit]=CEC17F24D10.Fit(x);
    case 'CEC17F25D10' % Composition Function 5 (N=5)
        [fit]=CEC17F25D10.Fit(x);
    case 'CEC17F26D10' % Composition Function 6 (N=5)
        [fit]=CEC17F26D10.Fit(x);
    case 'CEC17F27D10' % Composition Function 7 (N=6)
        [fit]=CEC17F27D10.Fit(x);
    case 'CEC17F28D10' % Composition Function 8 (N=6)
        [fit]=CEC17F28D10.Fit(x);
    case 'CEC17F29D10' % Composition Function 9 (N=3)
        [fit]=CEC17F29D10.Fit(x);
    case 'CEC17F30D10' % Composition Function 10 (N=2)
        [fit]=CEC17F30D10.Fit(x);

    %% CEC2017 30DIM 83:112
    case 'CEC17F1D30' % Shifted and Rotated Bent Cigar Function
        [fit]=CEC17F1D30.Fit(x);
    case 'CEC17F2D30' % Shifted and Rotated Sum of Different Power Function
        [fit]=CEC17F2D30.Fit(x);
    case 'CEC17F3D30' % Shifted and Rotated Zakharov Function 
        [fit]=CEC17F3D30.Fit(x);
    case 'CEC17F4D30' % Shifted and Rotated Rosenbrock’s Function 
        [fit]=CEC17F4D30.Fit(x);
    case 'CEC17F5D30' % Shifted and Rotated Rastrigin’s Function 
        [fit]=CEC17F5D30.Fit(x);
    case 'CEC17F6D30' % Shifted and Rotated Expanded Scaffer’s F6 Function
        [fit]=CEC17F6D30.Fit(x);
    case 'CEC17F7D30' % Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [fit]=CEC17F7D30.Fit(x);
    case 'CEC17F8D30' % Shifted and Rotated Non-Continuous Rastrigin’s Function
        [fit]=CEC17F8D30.Fit(x);
    case 'CEC17F9D30' % Shifted and Rotated Levy Function 
        [fit]=CEC17F9D30.Fit(x);
    case 'CEC17F10D30' % Shifted and Rotated Schwefel’s Function 
        [fit]=CEC17F10D30.Fit(x);
    case 'CEC17F11D30' % Hybrid Function 1 (N=3)
        [fit]=CEC17F11D30.Fit(x);
    case 'CEC17F12D30' % Hybrid Function 2 (N=3)
        [fit]=CEC17F12D30.Fit(x);
    case 'CEC17F13D30' % Hybrid Function 3 (N=3)
        [fit]=CEC17F13D30.Fit(x);
    case 'CEC17F14D30' % Hybrid Function 4 (N=4) 
        [fit]=CEC17F14D30.Fit(x);
    case 'CEC17F15D30' % Hybrid Function 5 (N=4) 
        [fit]=CEC17F15D30.Fit(x);
    case 'CEC17F16D30' % Hybrid Function 6 (N=4) 
        [fit]=CEC17F16D30.Fit(x);
    case 'CEC17F17D30' % Hybrid Function 7 (N=5)
        [fit]=CEC17F17D30.Fit(x);
    case 'CEC17F18D30' % Hybrid Function 8 (N=5)
        [fit]=CEC17F18D30.Fit(x);
    case 'CEC17F19D30' % Hybrid Function 9 (N=5)
        [fit]=CEC17F19D30.Fit(x);
    case 'CEC17F20D30' % Hybrid Function 10 (N=6) 
        [fit]=CEC17F20D30.Fit(x);
    case 'CEC17F21D30' % Composition Function 1 (N=3) 
        [fit]=CEC17F21D30.Fit(x);
    case 'CEC17F22D30' % Composition Function 2 (N=3) 
        [fit]=CEC17F22D30.Fit(x);
    case 'CEC17F23D30' % Composition Function 3 (N=4)
        [fit]=CEC17F23D30.Fit(x);
    case 'CEC17F24D30' % Composition Function 4 (N=4)
        [fit]=CEC17F24D30.Fit(x);
    case 'CEC17F25D30' % Composition Function 5 (N=5)
        [fit]=CEC17F25D30.Fit(x);
    case 'CEC17F26D30' % Composition Function 6 (N=5)
        [fit]=CEC17F26D30.Fit(x);
    case 'CEC17F27D30' % Composition Function 7 (N=6)
        [fit]=CEC17F27D30.Fit(x);
    case 'CEC17F28D30' % Composition Function 8 (N=6)
        [fit]=CEC17F28D30.Fit(x);
    case 'CEC17F29D30' % Composition Function 9 (N=3)
        [fit]=CEC17F29D30.Fit(x);
    case 'CEC17F30D30' % Composition Function 10 (N=2)
        [fit]=CEC17F30D30.Fit(x);

    %% CEC2017 50DIM 113:142
    case 'CEC17F1D50' % Shifted and Rotated Bent Cigar Function
        [fit]=CEC17F1D50.Fit(x);
    case 'CEC17F2D50' % Shifted and Rotated Sum of Different Power Function
        [fit]=CEC17F2D50.Fit(x);
    case 'CEC17F3D50' % Shifted and Rotated Zakharov Function 
        [fit]=CEC17F3D50.Fit(x);
    case 'CEC17F4D50' % Shifted and Rotated Rosenbrock’s Function 
        [fit]=CEC17F4D50.Fit(x);
    case 'CEC17F5D50' % Shifted and Rotated Rastrigin’s Function 
        [fit]=CEC17F5D50.Fit(x);
    case 'CEC17F6D50' % Shifted and Rotated Expanded Scaffer’s F6 Function
        [fit]=CEC17F6D50.Fit(x);
    case 'CEC17F7D50' % Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [fit]=CEC17F7D50.Fit(x);
    case 'CEC17F8D50' % Shifted and Rotated Non-Continuous Rastrigin’s Function
        [fit]=CEC17F8D50.Fit(x);
    case 'CEC17F9D50' % Shifted and Rotated Levy Function 
        [fit]=CEC17F9D50.Fit(x);
    case 'CEC17F10D50' % Shifted and Rotated Schwefel’s Function 
        [fit]=CEC17F10D50.Fit(x);
    case 'CEC17F11D50' % Hybrid Function 1 (N=3)
        [fit]=CEC17F11D50.Fit(x);
    case 'CEC17F12D50' % Hybrid Function 2 (N=3)
        [fit]=CEC17F12D50.Fit(x);
    case 'CEC17F13D50' % Hybrid Function 3 (N=3)
        [fit]=CEC17F13D50.Fit(x);
    case 'CEC17F14D50' % Hybrid Function 4 (N=4) 
        [fit]=CEC17F14D50.Fit(x);
    case 'CEC17F15D50' % Hybrid Function 5 (N=4) 
        [fit]=CEC17F15D50.Fit(x);
    case 'CEC17F16D50' % Hybrid Function 6 (N=4) 
        [fit]=CEC17F16D50.Fit(x);
    case 'CEC17F17D50' % Hybrid Function 7 (N=5)
        [fit]=CEC17F17D50.Fit(x);
    case 'CEC17F18D50' % Hybrid Function 8 (N=5)
        [fit]=CEC17F18D50.Fit(x);
    case 'CEC17F19D50' % Hybrid Function 9 (N=5)
        [fit]=CEC17F19D50.Fit(x);
    case 'CEC17F20D50' % Hybrid Function 10 (N=6) 
        [fit]=CEC17F20D50.Fit(x);
    case 'CEC17F21D50' % Composition Function 1 (N=3) 
        [fit]=CEC17F21D50.Fit(x);
    case 'CEC17F22D50' % Composition Function 2 (N=3) 
        [fit]=CEC17F22D50.Fit(x);
    case 'CEC17F23D50' % Composition Function 3 (N=4)
        [fit]=CEC17F23D50.Fit(x);
    case 'CEC17F24D50' % Composition Function 4 (N=4)
        [fit]=CEC17F24D50.Fit(x);
    case 'CEC17F25D50' % Composition Function 5 (N=5)
        [fit]=CEC17F25D50.Fit(x);
    case 'CEC17F26D50' % Composition Function 6 (N=5)
        [fit]=CEC17F26D50.Fit(x);
    case 'CEC17F27D50' % Composition Function 7 (N=6)
        [fit]=CEC17F27D50.Fit(x);
    case 'CEC17F28D50' % Composition Function 8 (N=6)
        [fit]=CEC17F28D50.Fit(x);
    case 'CEC17F29D50' % Composition Function 9 (N=3)
        [fit]=CEC17F29D50.Fit(x);
    case 'CEC17F30D50' % Composition Function 10 (N=2)
        [fit]=CEC17F30D50.Fit(x);

    %% CEC2017 100DIM 143:172
    case 'CEC17F1D100' % Shifted and Rotated Bent Cigar Function
        [fit]=CEC17F1D100.Fit(x);
    case 'CEC17F2D100' % Shifted and Rotated Sum of Different Power Function
        [fit]=CEC17F2D100.Fit(x);
    case 'CEC17F3D100' % Shifted and Rotated Zakharov Function 
        [fit]=CEC17F3D100.Fit(x);
    case 'CEC17F4D100' % Shifted and Rotated Rosenbrock’s Function 
        [fit]=CEC17F4D100.Fit(x);
    case 'CEC17F5D100' % Shifted and Rotated Rastrigin’s Function 
        [fit]=CEC17F5D100.Fit(x);
    case 'CEC17F6D100' % Shifted and Rotated Expanded Scaffer’s F6 Function
        [fit]=CEC17F6D100.Fit(x);
    case 'CEC17F7D100' % Shifted and Rotated Lunacek Bi_Rastrigin Function 
        [fit]=CEC17F7D100.Fit(x);
    case 'CEC17F8D100' % Shifted and Rotated Non-Continuous Rastrigin’s Function
        [fit]=CEC17F8D100.Fit(x);
    case 'CEC17F9D100' % Shifted and Rotated Levy Function 
        [fit]=CEC17F9D100.Fit(x);
    case 'CEC17F10D100' % Shifted and Rotated Schwefel’s Function 
        [fit]=CEC17F10D100.Fit(x);
    case 'CEC17F11D100' % Hybrid Function 1 (N=3)
        [fit]=CEC17F11D100.Fit(x);
    case 'CEC17F12D100' % Hybrid Function 2 (N=3)
        [fit]=CEC17F12D100.Fit(x);
    case 'CEC17F13D100' % Hybrid Function 3 (N=3)
        [fit]=CEC17F13D100.Fit(x);
    case 'CEC17F14D100' % Hybrid Function 4 (N=4) 
        [fit]=CEC17F14D100.Fit(x);
    case 'CEC17F15D100' % Hybrid Function 5 (N=4) 
        [fit]=CEC17F15D100.Fit(x);
    case 'CEC17F16D100' % Hybrid Function 6 (N=4) 
        [fit]=CEC17F16D100.Fit(x);
    case 'CEC17F17D100' % Hybrid Function 7 (N=5)
        [fit]=CEC17F17D100.Fit(x);
    case 'CEC17F18D100' % Hybrid Function 8 (N=5)
        [fit]=CEC17F18D100.Fit(x);
    case 'CEC17F19D100' % Hybrid Function 9 (N=5)
        [fit]=CEC17F19D100.Fit(x);
    case 'CEC17F20D100' % Hybrid Function 10 (N=6) 
        [fit]=CEC17F20D100.Fit(x);
    case 'CEC17F21D100' % Composition Function 1 (N=3) 
        [fit]=CEC17F21D100.Fit(x);
    case 'CEC17F22D100' % Composition Function 2 (N=3) 
        [fit]=CEC17F22D100.Fit(x);
    case 'CEC17F23D100' % Composition Function 3 (N=4)
        [fit]=CEC17F23D100.Fit(x);
    case 'CEC17F24D100' % Composition Function 4 (N=4)
        [fit]=CEC17F24D100.Fit(x);
    case 'CEC17F25D100' % Composition Function 5 (N=5)
        [fit]=CEC17F25D100.Fit(x);
    case 'CEC17F26D100' % Composition Function 6 (N=5)
        [fit]=CEC17F26D100.Fit(x);
    case 'CEC17F27D100' % Composition Function 7 (N=6)
        [fit]=CEC17F27D100.Fit(x);
    case 'CEC17F28D100' % Composition Function 8 (N=6)
        [fit]=CEC17F28D100.Fit(x);
    case 'CEC17F29D100' % Composition Function 9 (N=3)
        [fit]=CEC17F29D100.Fit(x);
    case 'CEC17F30D100' % Composition Function 10 (N=2)
        [fit]=CEC17F30D100.Fit(x);

    %% Problemas de ingeniería 173:178
    case 'Engranajes' %   Optimal Design of a gear train problem:
        [fit]=Engranajes.Fit(x);
    case 'RecipientePresion' %   Pressure Vessel Design problem:
        [fit]=RecipientePresion.Fit(x);
    case 'Resorte' %   Tension/Compression Spring Design problem:
        [fit]=Resorte.Fit(x);
    case 'SintetizadorFM' %   Parameter estimation for FM synthesizers problem:
        [fit]=SintetizadorFM.Fit(x);
    case 'TresBarras' %   Design of a Three-bar truss problem:
        [fit]=TresBarras.Fit(x);
    case 'VigaSoldada' %   Welded Beam Design problem:
        [fit]=VigaSoldada.Fit(x);
        
    %% Error
    otherwise
        fit=NaN;
end

end



