%Prova Fondamenti di Automatica D

close all;clear; clc;
Inizializzazione_Automatica_Tipo_D;
disp('Esercizio 1');
sys=ss(A,B,C,D);
G=tf(sys);
poliG=pole(G)
autovaloriA=eig(A)
%I valori coincidono quindi il sistema e' osservabile

disp('Esercizio 2');
%prova 1
syms k;
DC=dcgain(G);
ep=1/(1+k*DC);
k=solve(ep==0.02,k);
k=double(k)


%prova 2
Gcl=feedback(k*G,1);
step(Gcl);

%prova 3
klim=margin(G)
figure,margin(G);

%prova 4
k1=0.8*klim;
Gcl1=feedback(k1*G,1);
figure,step(Gcl1);