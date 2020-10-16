function [matches, dists] = myNearest(s0, s1)
  
  matches = [];
  dists = [];
  for p=1:size(s1)(1)
    
    toTest = sqrt(sum((s0 - s1(p,:)).^2, axis = 2));
    m = find(min(toTest) == toTest); 
    d = min(toTest);
    
    matches = [matches;m];
    dists = [dists;d];
  end
  
end
