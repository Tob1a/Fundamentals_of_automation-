% Esercizio Matlab 1
% -------------------
% Matricola 164028

%trovare g(s)
close all; clear all; clc;

Iniziale_Automatica_Tipo_A;

sys=ss(A,B,C,D);
disp("Esercizio 1:");
G=tf(sys)
poliG=pole(G)
autovaloriA=eig(A)
if(poliG == autovaloriA)
    fprintf("I valori coincidono quindi il sistema e' completamente osservabile\n");
else
    fprintf("I valori non coincidono il sistema non e' completamente osservabile\n");
end


disp("Esercizio 2:");
%parte 1
syms k;
ep=1/(1+k*dcgain(G)); %dcgain() lo posso usare sempre (lim per s->0). step o stepinfo se il sistema e' chiuso
k=solve(ep==0.05,k)
k=double(k)

%parte 2
Gcl=feedback(k*G,1);
figure, step(Gcl)
fprintf("Il sistema e' instabile\n");

%parte 3
figure, margin(G) %plot margine ampiezza
Klim=margin(G)

%parte 4
k1=0.8*Klim %guadagno dell'80%
Gcl1= feedback(k1*G,1);
figure, step(Gcl1);
%anello stabile

%parte 5
%vedi 2.4 n31
%guardo il grafico se il tutto converge ad 1 allora devo dire:
%L'errore a regime della risposta al gradino e' nullo, poiche' il valore
%finale della risposta = 1

disp("Esercizio 3:");
Mf=45;
G1=k*G;
Lag_Net_Design_Bode(G1,Mf);
omega=2;
phi=-180+Mf-(-90.1);
M=1/db2mag(21.3);
Tau1=(M-cosd(phi))/(omega*sind(phi));
Tau2=(cosd(phi)-1/M)/(omega*sind(phi))
s=tf('s');
Gc=(1+Tau1*s)/(1+Tau2*s)

figure,bode(G1);
hold on
bode(Gc*G1);
Gcl2=feedback(Gc*G1,1);
figure,step(Gcl2);
