function  leadNetDesignBode(G,phaseMargin)
% leadNetDesignBode(G,phaseMargin) draws the Bode diagrams of Transfer
% Function G and adds two lines to assist the design of a phase lead 
% compensation network with the desired phaseMargin (in degrees): 
% - a green line at -180deg + phaseMargin
% - a red line showing the function R = arg(G) + acos(|G|)
% These lines allow to identify the frequency at which 
% realizability conditions of the inversion formulas for a 
% phase lead network are satisfied:
% 
% Inversion formulas for phase lead network Gc(s) = (1+tau1*s)/(1+tau2*s)
% that achieves phase advance phi and gain amplification at the frequency 
% omega:
% tau1 = (M - cos(phi))/(omega*sin(phi))
% tau2 = (cos(phi) - 1/M)/(omega*sin(phi))
%
% The design is completed, so that Gc*G has the desired phaseMargin, by
% selecting a given omega (at which the realizability conditions are 
% satisfied) and then setting:
% M = 1/|G(j*omega)|
% phi = -180deg + phaseMargin - arg(G(j*omega))
%
% Realizabilty conditions:
% M > 1, 0 < phi < 90deg and 1/M < cos(phi)
% satisfied for omega selected within the interval of frequencies at which:
% - R (red line) is above -180deg+phaseMargin (green line)

[mag,phase,om]=bode(G);
mag=squeeze(mag);
phase=squeeze(phase);

for i=1:length(mag)
    if mag(i)<1
        R(i) = phase(i) + acosd(mag(i));
    else R(i) = NaN;
    end
end
figure,bode(G)
grid on
hold on
semilogx(om,R,'r')

phase_des=ones(length(mag),1)*(-180+phaseMargin);
semilogx(om,phase_des,'g')

end

