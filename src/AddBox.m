function MSH=AddBox(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  loc=find(s>0);
  [i,j,k]=ind2sub(size(s),loc);
  MSH.diel(sub2ind(size(MSH.diel),x-1+i,y-1+j,z-1+k))=val;

end
