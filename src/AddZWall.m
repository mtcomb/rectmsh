function MSH=AddZWall(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  loc=find(s>0);

  [i,j]=ind2sub(size(s),loc);

  k=0*j;

  MSH.IDx(sub2ind(size(MSH.IDx),x-1+i  ,y-1+j  ,z+k))=val;
  MSH.IDx(sub2ind(size(MSH.IDx),x-1+i  ,y-1+j+1,z+k))=val;

  MSH.IDy(sub2ind(size(MSH.IDy),x-1+i  ,y-1+j  ,z+k))=val;
  MSH.IDy(sub2ind(size(MSH.IDy),x-1+i+1,y-1+j  ,z+k))=val;

end
