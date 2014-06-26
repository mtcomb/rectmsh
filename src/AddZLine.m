function MSH=AddZLine(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  k=find(s>0);
  MSH.IDz(x  ,y  ,z-1+k  )=val;

end
