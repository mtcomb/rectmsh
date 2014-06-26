%addpath('~/rectmsh/src');
addpath('../../src');

ANTENNA=load('patch.txt');
ANTENNA=flipud(ANTENNA).';
imagesc(ANTENNA);
axis xy;
%pause;

nPML=10;

[ni,nj]=size(ANTENNA)
ni+=28+2*nPML;
nj+=10+2*nPML;
SUBSTRATE=ones(ni,nj,3);
GND=ones(ni,nj,1);

nx=ni
ny=nj
nz=3+13+nPML

MSH=InitMSH(nx,ny,nz);

ORG=[0,0,0];

MSH=AddBox(MSH,ORG+[1,1,1],SUBSTRATE,2.2);

MSH=AddZWall(MSH,ORG+[1,1,1],GND,0);

ORG=[nPML,nPML,0];

MSH=AddZWall(MSH,ORG+[14,0,3]+[1,1,1],ANTENNA,0);

for n=1:7
  MSH=AddYList(MSH,ORG+[18+n,5,3]+[1,1,1],[1],1);
  MSH=AddZList(MSH,ORG+[18+n,0,0]+[1,1,1],[1,1,1],2);
end

MSH=AddZList(MSH,ORG+[18+4,5,0]+[1,1,1],[1,1,1],3);

WriteVTKFile(MSH,'test.vtk',1,[2.2]);

WriteASCIIFile(MSH,'test.txt');
