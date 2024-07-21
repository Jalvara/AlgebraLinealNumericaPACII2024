clc
clear
F=dlmread("bcsstk14.mtx");
dim=input("Ingrese la dimension deseada: ");
M=Read_MTX(F);
A=M(1:dim,1:dim);
x=transpose(1:dim);
b=A*x;
per=1e8*eps;
db=per*ones(dim,1);
dA=per*ones(dim,dim);
fprintf("%s%d\n","Orden de perturbacion: ",per);
pA=A+dA;
pb=b+db;
Condicionamiento=cond(A);
fprintf("%s%d\n","Factor: ",1-Condicionamiento*norm(dA)/norm(A));
fprintf("%s%d\n","Numero Condicional de A: ",Condicionamiento);
xa=linsolve(pA,pb);
fprintf("%s%d\n","Error relativo: ",norm(x-xa)/norm(x));
fprintf("%s%d\n","Error absoluto: ",norm(x-xa));
Cota=Condicionamiento*(norm(db)/norm(b)+norm(dA)/norm(A));
fprintf("%s%d\n","Estimacion Cota: ",Cota);
