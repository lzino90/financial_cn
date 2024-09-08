clear all
clc

n=100;
m=100;
M=20;
R=100;

d=1:1:10;

D=length(d);
S=eye(m);
p=ones(n,1)*100;

eub=zeros(1,D);
eps=zeros(D,M);
res=zeros(D,M);
eps_r=zeros(1,D);

for r=1:R




for j=1:D
P=dRRG(n,d(j))*100/d(j);
c=sum(P,2)-sum(P,1)'+rand(n,1)*100;

eub(j)=eps_ub(P,c);
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
   Legend{iter}=strcat('d=', num2str(iter));
 end
 legend(Legend)
 xlabel('\epsilon') 
ylabel('||p-p||') 
