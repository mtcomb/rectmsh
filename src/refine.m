function [x,y]=refine(x0,y0,vx,vy,dx,dy,ratio)
  x=smooth(x0,dx,ratio);
  y=smooth(y0,dy,ratio);

  [x,y]=divide(x,y,vx,vy,dx/10,dy/10);
  indx=find(diff(x)<dx);
  indy=find(diff(y)<dy);
  x=unique(sort([x0 x(indx) x(indx+1)]));
  y=unique(sort([y0 y(indy) y(indy+1)]));

  x=smooth(x,dx,ratio);
  y=smooth(y,dy,ratio);
end
