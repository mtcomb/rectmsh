function [xxx,yyy]=divide(x,y,vx,vy,dx,dy)
  xx=x(1:end-1)+0.5*diff(x);
  yy=y(1:end-1)+0.5*diff(y);
  [X,Y]=meshgrid(xx,yy);
  in=inpolygon(X(:),Y(:),vx,vy);
  A=zeros(size(X));
  A(in)=1;

  x2=arrayfun(@(p,d) [p+0.25*d,p+0.75*d],...
              x(1:end-1),diff(x),'UniformOutput',false);
  x2=cell2mat(x2);
  y2=arrayfun(@(p,d) [p+0.25*d,p+0.75*d],...
              y(1:end-1),diff(y),'UniformOutput',false);
  y2=cell2mat(y2);
  [X2,Y2]=meshgrid(x2,y2);
  in2=inpolygon(X2(:),Y2(:),vx,vy);
  B=zeros(size(X2));
  B(in2)=1;

  A2=cellfun(@(b,a) sum(b(:)~=a(1))>0,...
            mat2cell(B,repmat(2,[1,size(B,1)/2]),...
                       repmat(2,[1,size(B,2)/2])),...
            mat2cell(A,ones(1,size(A,1)),ones(1,size(A,2))));

  [dX,dY]=meshgrid(diff(x),diff(y));
  dX = dX/(max(x)-min(x));
  dY = dY/(max(y)-min(y));

  ind=find(sum(A2 & (dX > dx | dY > dy),1));
%  ind=find(sum(A2 & dX.*dY > dx*dy,1));
  xxx=[x,x(ind)+0.5*(x(ind+1)-x(ind))];
  xxx=sort(xxx);
  ind=find(sum(A2 & (dX > dx | dY > dy),2));
%  ind=find(sum(A2 & dX.*dY > dx*dy,2));
  yyy=[y,y(ind)+0.5*(y(ind+1)-y(ind))];
  yyy=sort(yyy);
end
