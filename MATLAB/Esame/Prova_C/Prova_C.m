%Fondamenti di Automatica 
close all; clear; clc;
disp('Esercizio 1');
Inizializzazione_Automatica_Tipo_C;
sys=ss(A,B,C,D);
G=tf(sys)
poliG=pole(G)
autovaloriA=eig(A)
%I valori coincidono quindi la prova e' completamente osservabile

disp('Esercizio 2');

%parte 1
s=tf('s');
k=1; H=1/(1+(s/50));

Gcl=feedback(k*G,H)
step(Gcl);
%sistema stabile (asintoticamente) 

%parte 2
L=G*H;
klim=margin(L)
figure, margin(L);

%parte 3
k1=0.8*klim;
Gcl1=feedback(k1*G,H)
figure,step(Gcl1);

%parte 4
%L'errore a regime e' nullo

