function WriteVTKFile(MSH,fn,frame,exclude)

  if ~exist('frame','var'), frame=0; end
  if ~exist('exclude','var'), exclude=[]; end

  MSH=MakeEdge(MSH);

  if (frame==1)
    n=-100;
    MSH.IDx(1:end-1,[1,end-1],[1,end-1])=n;
    MSH.IDy([1,end-1],1:end-1,[1,end-1])=n;
    MSH.IDz([1,end-1],[1,end-1],1:end-1)=n;
  elseif (frame==2)
    n=-100;
    % X = 0
    MSH.IDy(1,1:end-1,1:end-1)=n;
    MSH.IDz(1,1:end-1,1:end-1)=n;
    % Y = 0
    MSH.IDz(1:end-1,1,1:end-1)=n;
    MSH.IDx(1:end-1,1,1:end-1)=n;
    % Z = 0
    MSH.IDx(1:end-1,1:end-1,1)=n;
    MSH.IDy(1:end-1,1:end-1,1)=n;
  end

  base=ceil(max([MSH.IDx(:);MSH.IDy(:);MSH.IDz(:)]))+1;
  for n=1:size(MSH.lx,1)
    xyz=MSH.lx(n,:);
    MSH.IDx(xyz(1),xyz(2),xyz(3))=base+xyz(4);
  end
  for n=1:size(MSH.ly,1)
    xyz=MSH.ly(n,:);
    MSH.IDy(xyz(1),xyz(2),xyz(3))=base+xyz(4);
  end
  for n=1:size(MSH.lz,1)
    xyz=MSH.lz(n,:);
    MSH.IDz(xyz(1),xyz(2),xyz(3))=base+xyz(4);
  end

  if exclude
    MSH.IDx(ismember(MSH.IDx,exclude))=MSH.eps;
    MSH.IDy(ismember(MSH.IDy,exclude))=MSH.eps;
    MSH.IDz(ismember(MSH.IDz,exclude))=MSH.eps;
  end

  write_vtk_file(fn,MSH);

end
