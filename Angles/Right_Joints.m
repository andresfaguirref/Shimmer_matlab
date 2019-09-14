%RIGHT JOINTS
%clear all
%close all
%clc
%load 'Quaternions-gait.mat'
%Q_PV = Q.Q_PV;
%Q_TH_R = Q.Q_TH_R;
%Q_SH_R = Q.Q_SH_R;
%Q_FT_R = Q.Q_FT_R;
%%

%Data_Shimmer2 = {};
%Data_Shimmer2{1} = Data_Shimmer{1};
%Data_Shimmer2{2} = Data_Shimmer{2};
%Data_Shimmer2{3} = Data_Shimmer{3};
%Data_Shimmer2{4} = Data_Shimmer{4};

% for x=1:length(Data_Shimmer2)
%     if x == 1
%         min_l = length(Data_Shimmer2{x});
%     else
%         if min_l > length(Data_Shimmer2{x})
%             min_l = length(Data_Shimmer2{x});
%         end
%     end 
% end

% Q_PV = Data_Shimmer{1}(end-min_l+1:end,11:14);
% Q_TH_R = Data_Shimmer{2}(end-min_l+1:end,11:14);
% Q_SH_R = Data_Shimmer{3}(end-min_l+1:end,11:14);
% Q_FT_R = Data_Shimmer{4}(end-min_l+1:end,11:14);

long = [];
long(1) = length(CB11_Hip_Quat_Madge_9DOF_W_WR_CAL);
long(2) = length(CA01_RF_Quat_Madge_9DOF_W_WR_CAL);
long(3) = length(CA27_RC_Quat_Madge_9DOF_W_WR_CAL);
long(4) = length(CA39_LT_Quat_Madge_9DOF_W_WR_CAL);
long(5) = length(CA4C_LF_Quat_Madge_9DOF_W_WR_CAL);
long(6) = length(CB28_LC_Quat_Madge_9DOF_W_WR_CAL);
long(7) = length(CB6C_RT_Quat_Madge_9DOF_W_WR_CAL);

aa = min(long);

Q_PV = [CB11_Hip_Quat_Madge_9DOF_W_WR_CAL(1:aa)...
        CB11_Hip_Quat_Madge_9DOF_X_WR_CAL(1:aa)... 
        CB11_Hip_Quat_Madge_9DOF_Y_WR_CAL(1:aa)... 
        CB11_Hip_Quat_Madge_9DOF_Z_WR_CAL(1:aa)];
    
Q_TH_R = [CB6C_RT_Quat_Madge_9DOF_W_WR_CAL(1:aa)...
          CB6C_RT_Quat_Madge_9DOF_X_WR_CAL(1:aa)... 
          CB6C_RT_Quat_Madge_9DOF_Y_WR_CAL(1:aa)... 
          CB6C_RT_Quat_Madge_9DOF_Z_WR_CAL(1:aa)];
      
Q_SH_R = [CA27_RC_Quat_Madge_9DOF_W_WR_CAL(1:aa)...
          CA27_RC_Quat_Madge_9DOF_X_WR_CAL(1:aa)... 
          CA27_RC_Quat_Madge_9DOF_Y_WR_CAL(1:aa)... 
          CA27_RC_Quat_Madge_9DOF_Z_WR_CAL(1:aa)];
      
Q_FT_R = [CA01_RF_Quat_Madge_9DOF_W_WR_CAL(1:aa)...
          CA01_RF_Quat_Madge_9DOF_X_WR_CAL(1:aa)... 
          CA01_RF_Quat_Madge_9DOF_Y_WR_CAL(1:aa)... 
          CA01_RF_Quat_Madge_9DOF_Z_WR_CAL(1:aa)];

%% Initial Posture
fs = 64; % Sample Frecuency (Hz)
ti = 3; % Time of static acquisition (s)
GF_q_IMU_F_PV0 = mean(Q_PV(1:fs*ti,:)); %Quaternion Average of Initial Posture (PEVLIS)
GF_q_IMU_F_TH0 = mean(Q_TH_R(1:fs*ti,:)); %Quaternion Average of Initial Posture (THIGH)
GF_q_IMU_F_SH0 = mean(Q_SH_R(1:fs*ti,:)); %Quaternion Average of Initial Posture (SHANK)
GF_q_IMU_F_FT0 = mean(Q_FT_R(1:fs*ti,:)); %Quaternion Average of Initial Posture (FOOT)

%% Vector for Alignment of the Quaternion(PV) with Gravity
qc = correctionQuaternion(GF_q_IMU_F_PV0);

%% Initial Technical Anatomical Frames (Alignment)
i = [1 0 0];
j = [0 1 0];
k = [0 0 1];
n2 = [sqrt(2)/2 0 sqrt(2)/2];
qROT1 = quatROT(90,i);
qROT2 = quatROT(180,n2);
GF_q_BF_PV0 = quatmultiply(qc,GF_q_IMU_F_PV0); 
GF_q_BF_TH0 = quatmultiply(GF_q_BF_PV0,qROT1);
GF_q_BF_SH0 = GF_q_BF_TH0;
GF_q_BF_FT0 = quatmultiply(GF_q_BF_PV0,qROT2);

%% Alignment of Initial Posture with Initial Technical Anatomical
BF_PV_q_IMU_F_PV0 = BF_q_IMU_B(GF_q_BF_PV0,GF_q_IMU_F_PV0);
BF_TH_q_IMU_F_TH0 = BF_q_IMU_B(GF_q_BF_TH0,GF_q_IMU_F_TH0);
BF_SH_q_IMU_F_SH0 = BF_q_IMU_B(GF_q_BF_SH0,GF_q_IMU_F_SH0);
BF_FT_q_IMU_F_FT0 = BF_q_IMU_B(GF_q_BF_FT0,GF_q_IMU_F_FT0);

%% Quaternion Orientation of each segment at any instant
GF_q_BF_PV = GF_q_BF(Q_PV,BF_PV_q_IMU_F_PV0);
GF_q_BF_TH = GF_q_BF(Q_TH_R,BF_TH_q_IMU_F_TH0);
GF_q_BF_SH = GF_q_BF(Q_SH_R,BF_SH_q_IMU_F_SH0);
GF_q_BF_FT = GF_q_BF(Q_FT_R,BF_FT_q_IMU_F_FT0);
%% Calculating Hip Angles
for x=1:length(GF_q_BF_PV)

    % Perpendicular Vector to Proximal and Distal Segment Vectors (Floating Axis)
    e2_h(:,x) = e2B(DCM(GF_q_BF_TH(x,:))*i', -DCM(GF_q_BF_PV(x,:))*j');
    e2_k(:,x) = e2B(DCM(GF_q_BF_SH(x,:))*i', DCM(GF_q_BF_TH(x,:))*k');
    e2_a(:,x) = e2B(DCM(GF_q_BF_FT(x,:))*k', DCM(GF_q_BF_SH(x,:))*k');
        
    %Hip Angles
    alpa_hip(x) = asin(dot(e2_h(:,x), DCM(GF_q_BF_PV(x,:))*i'));
    beta_hip(x) = acos(dot(-DCM(GF_q_BF_PV(x,:))*j', DCM(GF_q_BF_TH(x,:))*i'))-pi/2;
    gama_hip(x) = asin(dot(e2_h(:,x), DCM(GF_q_BF_TH(x,:))*k'));
    
    alpha_angle_hip(x) = rad2deg(alpa_hip(x));
    beta_angle_hip(x) = rad2deg(beta_hip(x));
    gama_angle_hip(x) = rad2deg(gama_hip(x));
    
    %Knee Angles
    alpa_knee(x) = -asin(dot(e2_k(:,x), DCM(GF_q_BF_TH(x,:))*i'));
    beta_knee(x)= acos(dot(DCM(GF_q_BF_TH(x,:))*k', DCM(GF_q_BF_SH(x,:))*i'))-pi/2;
    gama_knee(x) = asin(dot(e2_k(:,x), DCM(GF_q_BF_SH(x,:))*k'));
    alpha_angle_knee(x) = rad2deg(alpa_knee(x));
    beta_angle_knee(x) = rad2deg(beta_knee(x));
    gama_angle_knee(x) = rad2deg(gama_knee(x));
    
    %Ankle Angles
    alpa_ankle(x) = asin(dot(e2_a(:,x), DCM(GF_q_BF_SH(x,:))*i'));
    beta_ankle(x) = acos(dot(DCM(GF_q_BF_SH(x,:))*k', DCM(GF_q_BF_FT(x,:))*k'))-pi/2;
    alpha_angle_ankle(x) = radtodeg(alpa_ankle(x));
    beta_angle_ankle(x) = radtodeg(beta_ankle(x)); 
end
figure(1)
subplot(131)
plot(alpha_angle_hip)
title('Flexo-Extension')
subplot(132)
plot(beta_angle_hip)
title('Abduction-Adduction')
subplot(133)
plot(gama_angle_hip)
title('Internal-External Rot')
suptitle('Hip Angles (degrees)')
figure(2)
subplot(131)
plot(alpha_angle_knee)
title('Flexo-Extension')
subplot(132)
plot(beta_angle_knee)
title('Abduction-Adduction')
subplot(133)
plot(gama_angle_knee)
title('Internal-External Rot')
suptitle('Knee Angles (degrees)')
figure(3)
subplot(121)
plot(alpha_angle_ankle)
title('Flexo-Extension')
subplot(122)
plot(beta_angle_ankle)
title('Abduction-Adduction')
suptitle('Ankle Angles (degrees)')