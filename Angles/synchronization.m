function [IMU1_m,IMU2_m] = synchronization(IMU1,IMU2)

t = IMU2.t(1) - IMU1.t(1);
ts2 = IMU2.t - IMU2.t(1) + t;
ts1 = IMU1.t - IMU1.t(1);
zero_pos = knnsearch(ts2,0);
j = 1;
for i = 1:length(ts2)
     if  i > zero_pos+1 && i <= length(ts1)+zero_pos-1
         ac1_m(j,1) = IMU1.a(i-zero_pos+1);
         ts1_m(j,1) = ts1(i-zero_pos+1);
         Q1(j,:) = IMU1.q(i-zero_pos+1,:);
         ac2_m(j,1) = IMU2.a(i);
         ts2_m(j,1) = ts2(i);
         Q2(j,:) = IMU2.q(i,:);
         j = j+1;
      end
end
IMU1_m.a = ac1_m;
IMU1_m.q = Q1;
IMU1_m.t = ts1_m;
IMU1_m.id = IMU1.id;
IMU2_m.a = ac2_m;
IMU2_m.q = Q2;
IMU2_m.t = ts2_m;
IMU2_m.id = IMU2.id;
end
