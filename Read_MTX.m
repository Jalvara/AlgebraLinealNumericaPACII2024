function M=Read_MTX(F)
  row=F(2,1);col=F(2,2);
  n=F(2,3)+2;
  M=zeros(row,col);
  for i=3:n
    M(F(i,1),F(i,2))=F(i,3);  
  endfor
endfunction
