function WriteASCIIFile(MSH,filename,header)

  if ~exist('header','var'), header=false; end

  MSH=MakeEdge(MSH);

  MSH.IDx(end,:,:)=MSH.eps; MSH.IDx(:,end,:)=MSH.eps; MSH.IDx(:,:,end)=MSH.eps;
  MSH.IDy(end,:,:)=MSH.eps; MSH.IDy(:,end,:)=MSH.eps; MSH.IDy(:,:,end)=MSH.eps;
  MSH.IDz(end,:,:)=MSH.eps; MSH.IDz(:,end,:)=MSH.eps; MSH.IDz(:,:,end)=MSH.eps;

  color=[MSH.IDx(MSH.IDx~=MSH.eps)(:);MSH.IDy(MSH.IDy~=MSH.eps)(:);MSH.IDz(MSH.IDz~=MSH.eps)(:)].';
  c=unique(color);
  c=sort(c);

  printf('index\tvalue(re)\tvalue(im)\n');
  for n=1:length(c)
    printf('%d\t%f\t%f\n',n,real(c(n)),imag(c(n)));
  end
  printf('\n');

  fid = fopen(filename,'w');

  % begin
  if (header)
    fprintf(fid,'%d\n',MSH.TS);
    fprintf(fid,'%d %d %d\n',MSH.NX,MSH.NY,MSH.NZ);
    fprintf(fid,'%f %f %f\n',MSH.DX,MSH.DY,MSH.DZ);
    fprintf(fid,'%d %d %d %d %d %d\n',...
                MSH.LPMLx0,MSH.LPMLx1,MSH.LPMLy0,MSH.LPMLy1,MSH.LPMLz0,MSH.LPMLz1);

    fprintf(fid,'%d 3\n',length(c));
    for n=1:length(c)
      fprintf(fid,'%f %f\n',real(c(n)),imag(c(n)));
    end
  else
    fprintf(fid,'%d %d %d\n',MSH.NX,MSH.NY,MSH.NZ);
  end
  % end

  ind = find(MSH.IDx~=MSH.eps);
  [i,j,k]=ind2sub(size(MSH.IDx),ind);
  fprintf(fid,'%d %d\n',numel(ind),4);
  for n=1:length(i)
    fprintf(fid,'%d %d %d %d\n',[i(n),j(n),k(n),find(c==MSH.IDx(i(n),j(n),k(n)))]);
  end

  ind = find(MSH.IDy~=MSH.eps);
  [i,j,k]=ind2sub(size(MSH.IDy),ind);
  fprintf(fid,'%d %d\n',numel(ind),4);
  for n=1:length(i)
    fprintf(fid,'%d %d %d %d\n',[i(n),j(n),k(n),find(c==MSH.IDy(i(n),j(n),k(n)))]);
  end

  ind = find(MSH.IDz~=MSH.eps);
  [i,j,k]=ind2sub(size(MSH.IDz),ind);
  fprintf(fid,'%d %d\n',numel(ind),4);
  for n=1:length(i)
    fprintf(fid,'%d %d %d %d\n',[i(n),j(n),k(n),find(c==MSH.IDz(i(n),j(n),k(n)))]);
  end

  % axes
  % begin
  assert(MSH.NX==length(MSH.sx));
  assert(MSH.NY==length(MSH.sy));
  assert(MSH.NZ==length(MSH.sz));

  fprintf(fid,'%d 1\n',MSH.NX);
  for sx=MSH.sx
    fprintf(fid,'%f\n',sx);
  end
  fprintf(fid,'%d 1\n',MSH.NY);
  for sy=MSH.sy
    fprintf(fid,'%f\n',sy);
  end
  fprintf(fid,'%d 1\n',MSH.NZ);
  for sz=MSH.sz
    fprintf(fid,'%f\n',sz);
  end
  % end

  % list
  % begin
  fprintf(fid,'%d 4\n',size(MSH.lx,1));
  for n=1:size(MSH.lx,1)
    fprintf(fid,'%d %d %d %d\n',MSH.lx(n,:));
  end
  fprintf(fid,'%d 4\n',size(MSH.ly,1));
  for n=1:size(MSH.ly,1)
    fprintf(fid,'%d %d %d %d\n',MSH.ly(n,:));
  end
  fprintf(fid,'%d 4\n',size(MSH.lz,1));
  for n=1:size(MSH.lz,1)
    fprintf(fid,'%d %d %d %d\n',MSH.lz(n,:));
  end
  % end

  fclose(fid);
end
