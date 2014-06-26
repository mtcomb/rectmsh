function MSH=AddXLine(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  i=find(s>0);
  MSH.IDx(x-1+i  ,y  ,z  )=val;

end
