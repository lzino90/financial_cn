function eps_star = eps_star(P,c)

n=size(P,1);
pb=sum(P,2);
A=diag(sum(P,2).^-1)*P;
A1=eye(n)-A';

f=-ones(1,n);
options = optimoptions('linprog','Display','none');
x = linprog(f,A1,c,[],[],zeros(n,1),pb,options);
eps_star=sum(pb-x);
end