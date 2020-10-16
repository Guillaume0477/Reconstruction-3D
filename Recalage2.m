
function T,R = Recalage2(P_point, Q_point)



    %load("P_point.mat");
    %load("Q_point.mat");

    moy_P = mean(P_point);
    moy_Q = mean(Q_point);
    P_point_centre = P_point - moy_P;
    Q_point_centre = Q_point - moy_Q;


    M = P_point_centre' * Q_point_centre

    [ U,S,V ] = svd (M);

    R_diag = eye(3,3);
    R_diag(3,3)=det (V*U') ;
    R = V * R_diag * U';


    T = moy_Q' - R * moy_P';

end











