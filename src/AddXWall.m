function MSH=AddXWall(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  loc=find(s>0);

  [j,k]=ind2sub(size(s),loc);

  i=0*k;

  MSH.IDy(sub2ind(size(MSH.IDy),x+i,y-1+j  ,z-1+k  ))=val;
  MSH.IDy(sub2ind(size(MSH.IDy),x+i,y-1+j  ,z-1+k+1))=val;

  MSH.IDz(sub2ind(size(MSH.IDz),x+i,y-1+j  ,z-1+k  ))=val;
  MSH.IDz(sub2ind(size(MSH.IDz),x+i,y-1+j+1,z-1+k  ))=val;

end
