function MSH=InitMSH(nx,ny,nz,eps)

  if ~exist('eps','var'), eps=1; end

  MSH = struct();

  MSH.NX = int32(nx);
  MSH.NY = int32(ny);
  MSH.NZ = int32(nz);

  MSH.sx=ones(1,nx);
  MSH.sy=ones(1,ny);
  MSH.sz=ones(1,nz);

  MSH.eps = eps;

  MSH.IDx = eps*ones(nx+1,ny+1,nz+1);
  MSH.IDy = eps*ones(nx+1,ny+1,nz+1);
  MSH.IDz = eps*ones(nx+1,ny+1,nz+1);

  MSH.lx = [];
  MSH.ly = [];
  MSH.lz = [];

  MSH.diel = eps*ones(nx,ny,nz);

end
