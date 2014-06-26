function MSH=AddZList(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  k=find(s>0);
%  for n=k
%    MSH.lz=[MSH.lz;[x,y,z-1+n]];
%  end
%  MSH.lz=cell2mat(arrayfun(@(n) [x,y,z-1+n,val], k,'UniformOutput', false).');
  MSH.lz=[MSH.lz;cell2mat(arrayfun(@(n) [x,y,z-1+n,val], k,'UniformOutput', false).')];
  MSH.lz=unique(MSH.lz,'rows');

end
