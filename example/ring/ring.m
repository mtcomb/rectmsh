%addpath('~/rectmsh/src');
addpath('../../src');

out=load('out.txt');
in =load('in.txt');

vx=[nan out(:,1)' nan in(:,1)' nan];
vy=[nan out(:,2)' nan in(:,2)' nan];

[xmin,xmax]=deal(min(vx),max(vx));
[ymin,ymax]=deal(min(vy),max(vy));
% extract straight lines parallel to the coordinate axes
x=[xmin-0.2,xmin,vx(diff(vx)==0),xmax,xmax+0.2];
y=[ymin-0.2,ymin,vy(diff(vy)==0),ymax,ymax+0.2];
x=unique(sort(x));
y=unique(sort(y));

ratio=1.3;
%for del=linspace(0.1,0.01,21) % decreasing
for del=linspace(0.08,0.01,21) % decreasing
  del
  [xxx,yyy]=refine(x,y,vx,vy,del,del,ratio);
  if max([check(xxx),check(yyy)]) <= 1.01*ratio, break; end
end

x2=xxx(1:end-1)+diff(xxx)/2;
y2=yyy(1:end-1)+diff(yyy)/2;
[X2,Y2]=ndgrid(x2,y2);

in=inpolygon(X2(:),Y2(:),vx,vy);

plot(vx,vy);
hold on;
plot(X2(in),Y2(in),'go');
axis equal;
grid on;
set(gca,'Xtick',xxx);
set(gca,'Ytick',yyy);
axis([min(x) max(x) min(y) max(y)]);
%pause;

% This is just a test.
% You need a ground plane to make this work as a rat-race coupler.

[NX,NY]=size(X2);
MSH=InitMSH(NX,NY,2);
A=zeros(size(X2));
A(in)=1;
MSH.sx(:)=diff(xxx)(:);
MSH.sy(:)=diff(yyy)(:);
MSH=AddZWall(MSH,[1,1,2],A,0);
WriteVTKFile(MSH,'model.vtk',2);
