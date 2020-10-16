
clear variables;
close all;

n=10;

load("P_point.m");
load("Q_point.m");

%P_point = zeros (n,3);
%Q_point = zeros (n,3);


mean(P_point)
moy_P = mean(P_point);
moy_Q = mean(Q_point);
P_point_centre = P_point - moy_P;
Q_point_centre = Q_point - moy_Q;


M = P_point_centre' * Q_point_centre

[ U,S,V ] = svd (M);

R_diag = eye(3,3);
R_diag(3,3)=det (V*U') ;
R = V * R_diag * U'


T = moy_Q' - R * moy_P'











