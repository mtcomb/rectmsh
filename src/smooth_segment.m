function line=smooth_segment(points,res_start,res_stop,res_max,ratio)

  if ~exist('ratio','var'), ratio=1.3; end

  start=[ratio*res_start];
  while (res_start~=0 &&...
         cumsum(start) < (points(end)-points(1)))
    start=[start ratio*start(end)];
  end
  start=start(1:end-1);
  start=start(start<res_max);

  stop=[ratio*res_stop];
  while (res_stop~=0 &&...
         cumsum(stop) < (points(end)-points(1)))
    stop=[stop ratio*stop(end)];
  end
  stop=stop(1:end-1);
  stop=stop(stop<res_max);

  while (sum(start)+sum(stop)+res_max > (points(end)-points(1))...
         && (~isempty(start) || ~isempty(stop)))
    start=start(1:end-1);
    stop=stop(1:end-1);
  end

  edge_start=points(1)+sum(start);
  edge_stop=points(end)-sum(stop);

  N=round((edge_stop-edge_start)/res_max/1.01)+1;

  line=[points(1) points(1)+cumsum(start)(1:end-1)...
        linspace(edge_start,edge_stop,N)...
        points(end)-cumsum(stop)(1:end-1) points(end)];

end
