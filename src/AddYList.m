function MSH=AddYList(MSH,xyz,s,val)

  assert(numel(xyz)==3);
  [x,y,z]=deal(xyz(1),xyz(2),xyz(3));

  j=find(s>0);
%  MSH.ly=cell2mat(arrayfun(@(n) [x,y-1+n,z,val], j,'UniformOutput', false).');
  MSH.ly=[MSH.ly;cell2mat(arrayfun(@(n) [x,y-1+n,z,val], j,'UniformOutput', false).')];
  MSH.ly=unique(MSH.ly,'rows');

end
