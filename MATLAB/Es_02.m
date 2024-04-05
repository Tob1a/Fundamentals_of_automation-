close all;clear;clc;
%ss() costrusice un ogetto sys che rappresenta un modello tempo continuo
%dx/dt = Ax(t) + Bu(t)
%y(t) = Cx(t) + Du(t)
%ecco gli stati

A=[-1 4;-4 -1]
B=[1 0]'
C=[0 1]
D=2
P=ctrb(A,B); %P=[B * AB * A(AB) * ...]
rank(P)
Q=obsv(A,C)
rank(Q)
%quindi posso andare a calcolare sys
sys=ss(A,B,C,D)
%posso usare sys.A



%%SLIDE 23
%lsim =linear system resultation

t=[0:0.01:10];%servono come sostitutivo di un array e di incremento tra gli elementi arbitrario
%esempio J:I:K [J,J+I,... J+m*I], where m = fix((K-J)/I).
u=zeros(size(t));
x0=[0 1];


lsim(sys,u,t,x0) %apre solo il grafico
[y tout x]=lsim(sys,u,t,x0); %su x ho x1 e x2 
plot(x(:,1),x(:,2))
%       x1      x2
hold on %mantiene la stessa finestra per lo stesso grafico

%quiver() e' pensata per graficare vettori velocita' 
xn=x(1:5:end,:); un=u(1:5:end); %prende un sottoinsieme del vettore x e n per la precisione 1/5

v=(sys.A*xn'+sys.B*un);%componenti del vettore velocita' = xpunto
quiver(xn(:,1),xn(:,2),v(:,1),V(:,2))


%%cambio es
%sulla slide 30 bisogna b=mettere xdot=[x1dot,.... ] anche dioi 