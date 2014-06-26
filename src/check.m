function r=check(xxx)
  r=arrayfun(@(x,y) max([x y])/min([x y]),...
             diff(xxx)(1:end-1),diff(xxx)(2:end));
end
