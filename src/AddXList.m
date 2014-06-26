function MSH=AddXList(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  i=find(s>0);
%  MSH.lx=cell2mat(arrayfun(@(n) [x-1+n,y,z,val], i,'UniformOutput', false).');
  MSH.lx=[MSH.lx;cell2mat(arrayfun(@(n) [x-1+n,y,z,val], i,'UniformOutput', false).')];
  MSH.lx=unique(MSH.lx,'rows');

end
