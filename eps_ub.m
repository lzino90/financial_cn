function eps_ub = eps_ub(P,c)

n=size(P,1);
pb=sum(P,2);
A=diag(sum(P,2).^-1)*P;
s=ones(n,1);
A1=[s eye(n)-A'];

f=[-1 zeros(1,n)];
options = optimoptions('linprog','Display','none');
x = linprog(f,A1,c,[],[],zeros(n+1,1),[Inf; pb],options);
eps_ub=x(1);
end