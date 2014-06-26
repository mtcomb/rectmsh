function MSH=AddYLine(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  j=find(s>0);
  MSH.IDy(x  ,y-1+j  ,z  )=val;

end
