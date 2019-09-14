function data=Datagenerator(ac)
clear all
clc
%% Load Data
[name,dir]=uigetfile('*.mat','Multiselect','on');
for i=1:length(name)
   load(strcat(dir,name{i})); 
end
i = 0;
%%
%Generate data
if strcmp('ac','wr')
    try
        PV.t = Q_PV_TimestampSync_Unix_CAL;
        PV.a = Q_PV_Accel_WR_Z_CAL;
        PV.q(:,:) = [Q_PV_Quat_Madge_9DOF_W_WR_CAL,Q_PV_Quat_Madge_9DOF_X_WR_CAL,Q_PV_Quat_Madge_9DOF_Y_WR_CAL,Q_PV_Quat_Madge_9DOF_Z_WR_CAL];
        PV.id = 'PV';
        i = i +1;
        data(1,i) = PV;
    end
    try
        TH_R.t = Q_TH_R_TimestampSync_Unix_CAL;
        TH_R.a = Q_TH_R_Accel_WR_Z_CAL;
        TH_R.q(:,:) = [Q_TH_R_Quat_Madge_9DOF_W_WR_CAL,Q_TH_R_Quat_Madge_9DOF_X_WR_CAL,Q_TH_R_Quat_Madge_9DOF_Y_WR_CAL,Q_TH_R_Quat_Madge_9DOF_Z_WR_CAL];
        TH_R.id = 'TH_R';
        i = i +1;
        data(1,i) = TH_R;
    end
    try
        SH_R.t = Q_SH_R_TimestampSync_Unix_CAL;
        SH_R.a = Q_SH_R_Accel_WR_Z_CAL;
        SH_R.q(:,:) = [Q_SH_R_Quat_Madge_9DOF_W_WR_CAL,Q_SH_R_Quat_Madge_9DOF_X_WR_CAL,Q_SH_R_Quat_Madge_9DOF_Y_WR_CAL,Q_SH_R_Quat_Madge_9DOF_Z_WR_CAL];
        SH_R.id = 'SH_R';
        i = i +1;
        data(1,i) = SH_R;
    end
    try
        FT_R.t = Q_FT_R_TimestampSync_Unix_CAL;
        FT_R.a = Q_FT_R_Accel_WR_Z_CAL;
        FT_R.q(:,:) = [Q_FT_R_Quat_Madge_9DOF_W_WR_CAL,Q_FT_R_Quat_Madge_9DOF_X_WR_CAL,Q_FT_R_Quat_Madge_9DOF_Y_WR_CAL,Q_FT_R_Quat_Madge_9DOF_Z_WR_CAL];
        FT_R.id = 'FT_R';
        i = i +1;
        data(1,i) = FT_R;
    end
else
    try
        PV.t = Q_PV_TimestampSync_Unix_CAL;
        PV.a = Q_PV_Accel_LN_Z_CAL;
        PV.q(:,:) = [Q_PV_Quat_Madge_9DOF_W_LN_CAL,Q_PV_Quat_Madge_9DOF_X_LN_CAL,Q_PV_Quat_Madge_9DOF_Y_LN_CAL,Q_PV_Quat_Madge_9DOF_Z_LN_CAL];
        PV.id = 'PV';
        i = i +1;
        data(1,i) = PV;
    end
    try
        TH_R.t = Q_TH_R_TimestampSync_Unix_CAL;
        TH_R.a = Q_TH_R_Accel_LN_Z_CAL;
        TH_R.q(:,:) = [Q_TH_R_Quat_Madge_9DOF_W_LN_CAL,Q_TH_R_Quat_Madge_9DOF_X_LN_CAL,Q_TH_R_Quat_Madge_9DOF_Y_LN_CAL,Q_TH_R_Quat_Madge_9DOF_Z_LN_CAL];
        TH_R.id = 'TH_R';
        i = i +1;
        data(1,i) = TH_R;
    end
    try
        SH_R.t = Q_SH_R_TimestampSync_Unix_CAL;
        SH_R.a = Q_SH_R_Accel_LN_Z_CAL;
        SH_R.q(:,:) = [Q_SH_R_Quat_Madge_9DOF_W_LN_CAL,Q_SH_R_Quat_Madge_9DOF_X_LN_CAL,Q_SH_R_Quat_Madge_9DOF_Y_LN_CAL,Q_SH_R_Quat_Madge_9DOF_Z_LN_CAL];
        SH_R.id = 'SH_R';
        i = i +1;
        data(1,i) = SH_R;
    end
    try
        FT_R.t = Q_FT_R_TimestampSync_Unix_CAL;
        FT_R.a = Q_FT_R_Accel_LN_Z_CAL;
        FT_R.q(:,:) = [Q_FT_R_Quat_Madge_9DOF_W_LN_CAL,Q_FT_R_Quat_Madge_9DOF_X_LN_CAL,Q_FT_R_Quat_Madge_9DOF_Y_LN_CAL,Q_FT_R_Quat_Madge_9DOF_Z_LN_CAL];
        FT_R.id = 'FT_R';
        i = i +1;
        data(1,i) = FT_R;
    end 
end

end
