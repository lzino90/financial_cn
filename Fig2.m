clear all
clc

n=5;
R=10000;
D=20;
S=eye(n);

P=[0 20 0 0 50; 30 0 40 0 0 ;0 60 0 20 0; 0 0 40 0 0; 0 0 50 0 0];
p=sum(P,2);
c=sum(P,2)-sum(P,1)'+[5 15 20 5 10]';

eub=eps_ub(P,c);
eps_r=eub;
eps=linspace(eub*(0.02),eub*(0.995),D);

for i=1:D
    wc_loss(i)=finl1(P,S,c,eps(i));
end




res=zeros(D,R);

for r=1:R
    for j=10:20
        delta=rand(5,1);
        delta=eps(j)*delta/sum(delta);
        res(j,r)=eps_star(P,c-delta);
    end
end 

figure
plot(eps,wc_loss)
hold on
plot(eps,mean(res'))
plot(eps,max(res'))


% hold on
% for j=1:D
% plot(linspace(eps_r(j)*(0.02)/R,eps_r(j)*(0.995),M)/R,res(j,:)/R)
% end
