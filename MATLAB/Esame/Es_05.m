close all; clear; clc;
%-------------
%%Esercizio 3B
%-------------

InitAutomaticaTipoB %eseguo lo script del prof
G=tf(sys);

pole(G)
eig(A) %controllo gli autovalori del sistema -> il sistema e' completamento osservabile e controllabile
k=1;
Gcl=feedback(k*G,1);
step(Gcl)%vedo nel grafico che il sistema e' instabile e salvo l'immagine

leadNetdesignBode(k*G,45); %margine di fase desiderato e' 45
%la funzione leadNetdesignBode e' del prof

%la funzione e' ammissibile dall' incontro della linea verde con la linea
%rossa a infinito

%Lo metto a omega 40 radianti e quindi questo e sopra l'incontro e ora 
%trovo quindi -12
M=1/(db2mag(-12));
phi=-180+45-(-181);
omega=40;

%calcolo le formule
tau1=(M-cosd(phi))/(omega*sind(phi));
tau2=(cosd(phi)-1/M)/(omega*sind(phi));
s=tf('s');
Gc=(1+tau1*s)/(1+tau2*s);

%faccio il grafico e vedo la differenza
hold on
bode(Gc*G)
%salvo l'immagine 

Gcl=feedback(Gc*G*K,1); %con k=1;
figure
step(Gcl) %salvo con la risposta al gradino