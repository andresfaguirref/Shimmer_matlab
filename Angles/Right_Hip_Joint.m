%RIGHT HIP JOINT
clear all
close all
clc
load 'QuaternionsSquat2.mat'
Q_PV = Q.Q_PV;
Q_TH_R = Q.Q_TH_R;
%Q_PV = Q_PV(360:length(Q_PV),:);
%Q_TH_R = Q_TH_R(360:length(Q_TH_R),:);
%% Initial Posture
fs = 128; % Sample Frecuency (Hz)
ti = 3; % Time of static acquisition (s)
GF_q_IMU_F_PV0 = mean(Q_PV(1:fs*ti,:)); %Quaternion Average of Initial Posture (PEVLIS)
GF_q_IMU_F_TH0 = mean(Q_TH_R(1:fs*ti,:)); %Quaternion Average of Initial Posture (THIGH)

%% Vector for Alignment of the Quaternion(PV) with Gravity
qc = correctionQuaternion(GF_q_IMU_F_PV0);

%% Initial Technical Anatomical Frames (Alignment)
i = [1 0 0];
j = [0 1 0];
k = [0 0 1];
qROT1 = quatROT(90,i);
GF_q_BF_PV0 = quatmultiply(qc,GF_q_IMU_F_PV0); 
GF_q_BF_TH0 = quatmultiply(GF_q_BF_PV0,qROT1);

%% Alignment of Initial Posture with Initial Technical Anatomical
BF_PV_q_IMU_F_PV0 = BF_q_IMU_B(GF_q_BF_PV0,GF_q_IMU_F_PV0);
BF_TH_q_IMU_F_TH0 = BF_q_IMU_B(GF_q_BF_TH0,GF_q_IMU_F_TH0);

%% Quaternion Orientation of each segment at any instant
GF_q_BF_PV = GF_q_BF(Q_PV,BF_PV_q_IMU_F_PV0);
GF_q_BF_TH = GF_q_BF(Q_TH_R,BF_TH_q_IMU_F_TH0);

%% Calculating Hip Angles
for x=1:length(GF_q_BF_PV)

    % Perpendicular Vector to Proximal and Distal Segment Vectors (Floating Axis)
    e2_h(:,x) = e2B(DCM(GF_q_BF_TH(x,:))*i', -DCM(GF_q_BF_PV(x,:))*j');
        
    %Hip Angles
    alpa_hip(x) = asin(dot(e2_h(:,x), DCM(GF_q_BF_PV(x,:))*i'));
    beta_hip(x) = acos(dot(-DCM(GF_q_BF_PV(x,:))*j', DCM(GF_q_BF_TH(x,:))*i'))-pi/2;
    gama_hip(x) = asin(dot(e2_h(:,x), DCM(GF_q_BF_TH(x,:))*k'));
    
    alpha_angle_hip(x) = rad2deg(alpa_hip(x));
    beta_angle_hip(x) = rad2deg(beta_hip(x));
    gama_angle_hip(x) = rad2deg(gama_hip(x));
end
subplot(131)
plot(alpha_angle_hip)
title('Flexo-Extension')
subplot(132)
plot(beta_angle_hip)
title('Abduction-Adduction')
subplot(133)
plot(gama_angle_hip)
title('Internal-External Rot')
