function MSH=MakeEdge(MSH)

  [X,Y,Z]=meshgrid(MSH.sx,MSH.sy,MSH.sz);
  X = permute(X,[2 1 3]); Y = permute(Y,[2 1 3]); Z = permute(Z,[2 1 3]);

  [i,j,k]=deal(1:MSH.NX,2:MSH.NY,2:MSH.NZ);

  d=(Y(i,j  ,k  ).*Z(i,j  ,k  )...
    +Y(i,j-1,k  ).*Z(i,j-1,k  )...
    +Y(i,j  ,k-1).*Z(i,j  ,k-1)...
    +Y(i,j-1,k-1).*Z(i,j-1,k-1));
  MSH.IDx(i,j,k)=...
    +(MSH.IDx(i,j,k)==MSH.eps).*...
    (Y(i,j  ,k  ).*Z(i,j  ,k  ).*MSH.diel(i,j  ,k  )...
    +Y(i,j-1,k  ).*Z(i,j-1,k  ).*MSH.diel(i,j-1,k  )...
    +Y(i,j  ,k-1).*Z(i,j  ,k-1).*MSH.diel(i,j  ,k-1)...
    +Y(i,j-1,k-1).*Z(i,j-1,k-1).*MSH.diel(i,j-1,k-1))./d...
    +(MSH.IDx(i,j,k)~=MSH.eps).*MSH.IDx(i,j,k);

  [i,j,k]=deal(2:MSH.NX,1:MSH.NY,2:MSH.NZ);

  d=(Z(i  ,j,k  ).*X(i  ,j,k  )...
    +Z(i-1,j,k  ).*X(i-1,j,k  )...
    +Z(i  ,j,k-1).*X(i  ,j,k-1)...
    +Z(i-1,j,k-1).*X(i-1,j,k-1));
  MSH.IDy(i,j,k)=...
    +(MSH.IDy(i,j,k)==MSH.eps).*...
    (Z(i  ,j,k  ).*X(i  ,j,k  ).*MSH.diel(i  ,j,k  )...
    +Z(i-1,j,k  ).*X(i-1,j,k  ).*MSH.diel(i-1,j,k  )...
    +Z(i  ,j,k-1).*X(i  ,j,k-1).*MSH.diel(i  ,j,k-1)...
    +Z(i-1,j,k-1).*X(i-1,j,k-1).*MSH.diel(i-1,j,k-1))./d...
    +(MSH.IDy(i,j,k)~=MSH.eps).*MSH.IDy(i,j,k);

  [i,j,k]=deal(2:MSH.NX,2:MSH.NY,1:MSH.NZ);

  d=(X(i  ,j  ,k).*Y(i  ,j  ,k)...
    +X(i-1,j  ,k).*Y(i-1,j  ,k)...
    +X(i  ,j-1,k).*Y(i  ,j-1,k)...
    +X(i-1,j-1,k).*Y(i-1,j-1,k));
  MSH.IDz(i,j,k)=...
    +(MSH.IDz(i,j,k)==MSH.eps).*...
    (X(i  ,j  ,k).*Y(i  ,j  ,k).*MSH.diel(i  ,j  ,k)...
    +X(i-1,j  ,k).*Y(i-1,j  ,k).*MSH.diel(i-1,j  ,k)...
    +X(i  ,j-1,k).*Y(i  ,j-1,k).*MSH.diel(  i,j-1,k)...
    +X(i-1,j-1,k).*Y(i-1,j-1,k).*MSH.diel(i-1,j-1,k))./d...
    +(MSH.IDz(i,j,k)~=MSH.eps).*MSH.IDz(i,j,k);

  clear i j k X Y Z d;

end
