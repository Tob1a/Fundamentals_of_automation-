G=[];
impulse(G);
step(G);

%bla bla spiegazione dei comandi
close all;clear; clc;
A=[];B=[];C=[];D=[];
sys=ss(A,B,C,D);
G=tf(sys);
impulse(G);
s=tf('s');
G=10*(1+s)^2/s/(1+s/0.1)/(1+s/100);

%%ESERCIZIO
close all;clear;clc;
A=[-1 0 0;0-2 0;0 2 -3];
eig(A);
B=[1 1 0]';
C=[0 0 1];
sys=ss(A,B,C,0);
G=tf(sys);
P=ctrb(A,B);
rank(P)
Q=obsv(A,C);
rank(Q)
pole(G);



%roba nuova con symulink
Gcl=feedback(G,H); %dove G e' il nodo diretto e H e' il nodo in parallelo
%se scrivo feedback(G,H,+1) alla fine c'e' un nodo con una somma


Gp=parallel(G1,G2);% parallelo di due funzioni con alla fine una somma

s1=sumblk('h=z+w'); %sta per nodo sommatore 

sys=connect(G1,G2,G3,S1,S2,'u','y');%la stringa u e' l'ingresso la stringa y e' l'uscita
