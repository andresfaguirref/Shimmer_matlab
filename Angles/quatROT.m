function qROT = quatROT(theta, n1)

    theta=deg2rad(theta); 
    qROT = [cos(theta/2) n1(1)*sin(theta/2) n1(2)*sin(theta/2) n1(3)*sin(theta/2)];

end