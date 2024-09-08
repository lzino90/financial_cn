clear all
clc

n=100;
m=100;
M=20;
R=100;

k=4;


D=2;
eub=zeros(1,D);
eps=zeros(D,M);
res=zeros(D,M);
eps_r=zeros(1,D);
S=eye(n);


for r=1:R

%%RRG hom
j=1;

P=dRRG(n,k)*100/k;
c=sum(P,2)-sum(P,1)'+rand(n,1)*100;
p=sum(P,2);

eub(j)=eps_ub_1(P,S,c);
eps_r(j)=eps_r(j)+eub(j);
eps(j,:)=linspace(eub(j)*(0.02),eub(j)*(0.995),M);
for i=1:M
    res(j,i)=res(j,i)+finl1(P,S,c,eps(j,i));
end

%%RRG slightly het
j=2;

P=dRRGw(n,k)*200/k;
c=sum(P,2)-sum(P,1)'+rand(n,1)*100;
p=sum(P,2);

eub(j)=eps_ub_1(P,S,c);
eps_r(j)=eps_r(j)+eub(j);
eps(j,:)=linspace(eub(j)*(0.02),eub(j)*(0.995),M);
for i=1:M
    res(j,i)=res(j,i)+finl1(P,S,c,eps(j,i));
end



display(strcat('Progress: ',num2str(round(100*(r)/R)),'%'))
end

figure
hold on
for j=1:D
plot(linspace(eps_r(j)*(0.02)/R,eps_r(j)*(0.995),M)/R,res(j,:)/R)
end

 
 xlabel('\epsilon') 
ylabel('||p-p||') 
