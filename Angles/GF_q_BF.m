function GF_q_BF_B=GF_q_BF(GF_q_IMU_F_B, BF_B_q_IMU_F_B)

    GF_q_BF_B=quatmultiply(GF_q_IMU_F_B,quatinv(BF_B_q_IMU_F_B));

end