%Prova Matlab Fondamenti di Automatica
%------------
%Matricola 164028

close all;clear;clc;
disp('Esercizio 1');
Init_Automatica_Tipo_B;
sys=ss(A,B,C,D);
G=tf(sys)
poliG=pole(G)
autovaloriA=eig(A)
%I valori coincidono quindi il sistema e' osservabile

disp('Esercizio 2');
%parte 1
K=1;
Gcl=feedback(K*G,1);
figure, step(Gcl,10);
%il sistema e' instabile

%parte 2
figure,rlocus(G)
klim=0.017; %vatti a vedere il gain sulla retta tratteggiata

%parte 3
k1=0.8*klim;
Gcl1=feedback(k1*G,1);
figure, step(Gcl1);

%parte 4
%L'errore a regime e' nullo

disp('Esercizio 3');
Mf=45;
G1=K*G;
Lead_Net_Design_Bode(G1,Mf);
omega=40;
phi=180+Mf-(-181);
M=1/db2mag(-12);
Tau1=(M-cosd(phi))/(omega*sind(phi));
Tau2=(cosd(phi)-1/M)/(omega*sind(phi));

s=tf('s');
Gc=(1+Tau1*s)/(1+Tau2*s)

figure,bode(G1);
hold on
bode(Gc*G1);

Gcl2=feedback(Gc*G1,1);
figure,step(Gcl2); %overshoot 30 e qualcosa %
