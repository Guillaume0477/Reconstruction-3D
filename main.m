

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

%dt = DelaunayTri (A) ;
%[ pid d ] = nearestNeighbor( dt ,B) ;


