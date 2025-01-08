close all; clear; clc;

M=1/mag2db(21.4); %deve venire un valore meno di 1 
%posso usare anche db2mag
%devo vedere il grafico di bode che mi da -90 quindi 
phi=180+45-(-90);   %e' di quanto la rete ritardatrice abbassa la fase mantenendo la fase desiderata
%a questo punto devo applicare le formule di inversione
tau1=(M-cosd(phi))/(omega*sind(phi));
tau2=(cosd(phi)-1/M)/(omega*sind(phi));
s=tf('s');
Gc=(1+tau1*s)/(1+tau2*s);
bode(Gc);
%qui possiamo gia' salvare il file bode
hold on
bode(Gc*k*G);
%clicco caratteristiche minimi ... e vedo che e' circa 45.2 come deg di
%fase minima dei margini
Gcl=feedback(Gc*k*G,1);
%devo controllare se il tempo di assestamento e' al 5%
Popt=timeoptions % guardo il SettleTimeThreshould
Popt.SettleTimeThreshould=0.05;
%faccio il grafico per Gcl
step(Gcl,Popt);
%Guardo il final Value e il Setting time dei 2 punti
%salvo il grafico Jpg


%ok ora cambio la omega* e quindi la metto a 3.28
omega=3.28;
%vado nel grafico di bode a vedere dove sono
M=1/db2mag()
phi=-180+45-(-128);

%calcolo le formule
tau1=(M-cosd(phi))/(omega*sind(phi));
tau2=(cosd(phi)-1/M)/(omega*sind(phi));
Gc=(1+tau1*s)/(1+tau2*s);
bode(Gc*k*G)
Gcl=feedback(Gc*K*G);