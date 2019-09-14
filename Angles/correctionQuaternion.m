function qc = correctionQuaternion(GF_q_IMU_F_PV0)
    
    q0 = GF_q_IMU_F_PV0(1); %Real  
    q1 = GF_q_IMU_F_PV0(2); %i
    q2 = GF_q_IMU_F_PV0(3); %j
    q3 = GF_q_IMU_F_PV0(4); %k

    theta = acos(2*(q1*q3 - q0*q2)); % Angle between Xaxis(IMU) and gravity vector (Direction Cosine Matrix)

    n1 = [2*(q1*q2+q0*q3) q2^2+q3^2-q0^2-q1^2 0]; %Orthogonal vector between Xaxis and gravity vector
    n1 = n1/norm(n1);   % Orthonormal vector

    % Vector for Correction of Quaternion with gravity
    qc = [cos(theta/2) n1(1)*sin(theta/2) n1(2)*sin(theta/2) n1(3)*sin(theta/2)];
    qc = qc/norm(qc);
end