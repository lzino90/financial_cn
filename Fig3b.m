clear all
clc

n=100;
m=4;
M=10;
R=100;

k=4;

cc=linspace(0,.75*(k-2)/(k-1),M);
pp=1-nthroot(cc/(.75*(k-2)/(k-1)),3);

D=length(pp);
p=ones(n,1)*100;

eub=zeros(1,D);
eps=zeros(D,M);
res=zeros(D,M);
eps_r=zeros(1,D);

for r=1:R

c=rand(n,1)*100;

S=eye(n);

for j=1:D
An=WS(n,k,pp(j));
P=An*100/k;

eub(j)=eps_ub_1(P,S,c);
eps_r(j)=eps_r(j)+eub(j);
eps(j,:)=linspace(eub(j)*(0.02),eub(j)*(0.995),M);
for i=1:M
    res(j,i)=res(j,i)+finl1(P,S,c,eps(j,i));
end
display(strcat('Progress: ',num2str(round(100*(j+(r-1)*D)/(D*R))),'%'))
end
end 

figure
hold on
for j=1:D
plot(linspace(eps_r(j)*(0.02)/R,eps_r(j)*(0.995),M)/R,res(j,:)/R)
end

 Legend=cell(D,1);
 for iter=1:D
   Legend{iter}=strcat('\gamma=', num2str(cc(iter)));
 end
 legend(Legend)
 xlabel('\epsilon') 
ylabel('||p-p||') 
