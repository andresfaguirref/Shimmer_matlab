function BF_B_q_IMU_F_B0 = BF_q_IMU_B(GF_q_BF_B0, GF_q_IMU_F_B0)

    BF_B_q_IMU_F_B0=quatmultiply(quatinv(GF_q_BF_B0),GF_q_IMU_F_B0); % Equation 7

end