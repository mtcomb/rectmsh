function MSH=AddYWall(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  loc=find(s>0);

  [k,i]=ind2sub(size(s),loc);

  j=0*i;

  MSH.IDx(sub2ind(size(MSH.IDx),x-1+i  ,y+j,z-1+k  ))=val;
  MSH.IDx(sub2ind(size(MSH.IDx),x-1+i  ,y+j,z-1+k+1))=val;

  MSH.IDz(sub2ind(size(MSH.IDz),x-1+i  ,y+j,z-1+k  ))=val;
  MSH.IDz(sub2ind(size(MSH.IDz),x-1+i+1,y+j,z-1+k  ))=val;

end
