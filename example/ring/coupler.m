% This script requires Matlab.
% polybool is not available in octave.
clc;

t=linspace(0,2*pi,101);
circ=[cos(t);sin(t)];

co=1.1*circ;
ci=0.9*circ;
ci=fliplr(ci);

x={co(1,:),ci(1,:)};
y={co(2,:),ci(2,:)};
rx=[2 2 1 1 2];
ry=[-0.1 0.1 0.1 -0.1 -0.1];
rx=fliplr(rx);
ry=fliplr(ry);

for t=pi/3*[0,1,2,3]
  r=[cos(t) -sin(t);sin(t) cos(t)]*[rx;ry]
  [x,y]=polybool('+',x,y,r(1,:),r(2,:));
end

out=[x{:,1};y{:,1}].';
in =[x{:,2};y{:,2}].';
save -ascii 'out.txt' out;
save -ascii 'in.txt' in;

hold on;
for k=1:numel(x), plot(x{k},y{k}), end
hold off;
