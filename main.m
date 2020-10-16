

clear variables;
close all;

load("P_point.mat");
load("Q_point.mat");
load("set0.xyz");
load("set1.xyz");

[T,R] = Recalage2(P_point,Q_point)

set0(:,1:3) = (R*set0(:,1:3)')' + T';

P = set0(:,1:3);
Q = set1(:,1:3);


n_loop = 5;
tic


for k=0:n_loop

    dt = DelaunayTri(P) ;
    [ pid,d ] = nearestNeighbor( dt ,Q);

     Q_match = [];
     P_match = [];
%     [w,l]=size(Q);
     delta = 0.1;
%     for i=1:w
%         if d(i)<delta
%             i
%             pid(i)
%             P_match =[ P_match ; P_match(pid(i),:) ];
%             Q_match =[ Q_match ; Q_match(i,:) ];
%         end
%     end

 
    
    
    indexOK=find(d<delta);
    Q_match=Q(indexOK,:);
    P_match=P(pid(indexOK),:);
    
    [T,R] = Recalage2(P_match,Q_match);
    

    P = (R*set0(:,1:3)')' + T';



end

set0(:,1:3) = P;
save("set0_bis.xyz",'set0')

toc
