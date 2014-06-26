function write_vtk_file(filename,MSH)

  [nx,ny,nz]=deal(MSH.NX,MSH.NY,MSH.NZ);
  [sx,sy,sz]=deal(MSH.sx,MSH.sy,MSH.sz);

  [x,y,z]=meshgrid([0,cumsum(sx)],[0,cumsum(sy)],[0,cumsum(sz)]);
  x = permute(x,[2 1 3]); y = permute(y,[2 1 3]); z = permute(z,[2 1 3]);

  nr_of_elements=numel(x);

  %%%%%
  loc=find(MSH.IDx(1:nx,1:ny,1:nz)~=MSH.eps);
  [i,j,k]=ind2sub([nx,ny,nz],loc);
  X=[sub2ind([nx+1,ny+1,nz+1],i  ,j,k).';...
     sub2ind([nx+1,ny+1,nz+1],i+1,j,k).'];

  loc=find(MSH.IDy(1:nx,1:ny,1:nz)~=MSH.eps);
  [i,j,k]=ind2sub([nx,ny,nz],loc);
  Y=[sub2ind([nx+1,ny+1,nz+1],i,j  ,k).';...
     sub2ind([nx+1,ny+1,nz+1],i,j+1,k).'];

  loc=find(MSH.IDz(1:nx,1:ny,1:nz)~=MSH.eps);
  [i,j,k]=ind2sub([nx,ny,nz],loc);
  Z=[sub2ind([nx+1,ny+1,nz+1],i,j,k  ).';...
     sub2ind([nx+1,ny+1,nz+1],i,j,k+1).'];

  clear loc i j k;

  indx=sort(unique([X(:);Y(:);Z(:)]));

  aaa=zeros(1,nr_of_elements);
  aaa(indx)=1:length(indx);
  %%%%%

  fid = fopen(filename,'w');

  fprintf(fid,'# vtk DataFile Version 3.0\n');
  fprintf(fid,'merger lines\n');
  fprintf(fid,'BINARY\n');
  fprintf(fid,'DATASET POLYDATA\n');
  fprintf(fid,['POINTS ' num2str(numel(indx),'%d') ' float\n']);
  fclose(fid);

  fid = fopen(filename,'a');
  fwrite(fid, [reshape(x,1,nr_of_elements)(indx);...
               reshape(y,1,nr_of_elements)(indx);...
               reshape(z,1,nr_of_elements)(indx)],'float','b');
  fprintf(fid,'\n');

  clear x y z;

  color=[MSH.IDx(X(1,:))(:);MSH.IDy(Y(1,:))(:);MSH.IDz(Z(1,:))(:)];
  n = numel(color);

  fprintf(fid,['LINES ' num2str(n,'%d') ' ' num2str(3*n,'%d') '\n']);

  fwrite(fid,[2*ones(1,size(X)(2)); aaa(X(1,:))-1; aaa(X(2,:))-1],'int','b');
  fwrite(fid,[2*ones(1,size(Y)(2)); aaa(Y(1,:))-1; aaa(Y(2,:))-1],'int','b');
  fwrite(fid,[2*ones(1,size(Z)(2)); aaa(Z(1,:))-1; aaa(Z(2,:))-1],'int','b');

  fprintf(fid,'\n');

  fprintf(fid,['CELL_DATA ' num2str(n,'%d') '\n']);
  fprintf(fid,'SCALARS cell_scalars int\n');
  fprintf(fid,'LOOKUP_TABLE default\n');

  rc=0*color;
  c=unique(color);
  c=sort(c);
  for n=1:length(c)
    rc(color==c(n))=n;
  end
  fwrite(fid,rc,'int','b');

  fclose(fid);
end
