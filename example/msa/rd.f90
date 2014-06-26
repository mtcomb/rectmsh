program main
  implicit none
  integer  :: nx,ny,nz
  integer, dimension(:,:,:), allocatable  :: IDX,IDY,IDZ
  integer  :: dims(2),ii,jj,kk,val
  integer  :: i,j

  open(10,FILE='test.txt',ACTION='READ')

  read(10,*) nx,ny,nz
  print *, nx,ny,nz

  allocate(IDX(1:nx,1:ny,1:nz))
  allocate(IDY(1:nx,1:ny,1:nz))
  allocate(IDZ(1:nx,1:ny,1:nz))

  IDX=1
  IDY=1
  IDZ=1

  ! IDX
  read(10,*) dims
  do i=1,dims(1)
    read(10,*) ii,jj,kk,val
    IDX(ii,jj,kk)=val
  end do
  ! IDY
  read(10,*) dims
  do i=1,dims(1)
    read(10,*) ii,jj,kk,val
    IDY(ii,jj,kk)=val
  end do
  ! IDZ
  read(10,*) dims
  do i=1,dims(1)
    read(10,*) ii,jj,kk,val
    IDZ(ii,jj,kk)=val
  end do

  close(10)

  do i=1,10
    print *, i,count(IDX==i), count(IDY==i), count(IDZ==i)
  end do

  deallocate(IDX)
  deallocate(IDY)
  deallocate(IDZ)

end program
