Shimmer_ports = {'16','29'};
%Shimmer_ports = {'29','34'};
%Simmer_serial = {'CA4C COM(29) Hip','CB28 COM(34) R_T','CB6C COM(36) R_C','CA27 COM(40) L_T','CA39 COM(44) L_C'};

%Shimmer_ports = {'30'};
Simmer_serial = {'CA27 COM(16) Calf', 'CA01 COM(29) Thight'};

Shimmer_location = {};

SensorMacros = SetEnabledSensorsMacrosClass;

frecSample = 64;

Data_len_view = 500;



%% Simmer Configuration
Shimmer_IMUs = {};
for x=1:length(Shimmer_ports);
   Shimmer_IMUs{x} = ShimmerHandleClass(Shimmer_ports{x});
   
   if (Shimmer_IMUs{x}.connect)
     Shimmer_IMUs{x}.setsamplingrate(frecSample);
     Shimmer_IMUs{x}.setinternalboard('9DOF'); 
     Shimmer_IMUs{x}.disableallsensors;
     Shimmer_IMUs{x}.setenabledsensors(SensorMacros.GYRO, 1, SensorMacros.MAG, 1, SensorMacros.ACCEL, 1);
     Shimmer_IMUs{x}.setaccelrange(1); 
     Shimmer_IMUs{x}.setorientation3D(1); 
     Shimmer_IMUs{x}.setgyroinusecalibration(1); 
   else
     fprintf('The shimmer %i with the COM %s was not able to connect' ,x,Shimmer_ports{x})
      for y=1:x
        Shimmer_IMUs{y}.disconnect
      end 
     break;
   end
end

%% Simmer start
pause(2)

for x=1:length(Shimmer_ports);
    Shimmer_IMUs{x}.start
    
    
end
pause(2)

 
%% Data adquisition
Data_Shimmer = {};
for x=1:length(Shimmer_ports)
    Data_Shimmer{x} = [];
end

hf=figure();
r=0;
Data_length = [];

pf =figure();

while 1
  r=r+1;
  
  for x=1:length(Shimmer_ports)
    [newData,signalNameArray,signalFormatArray,signalUnitArray] = Shimmer_IMUs{x}.getdata('c');
    Data_Shimmer{x} =  [Data_Shimmer{x}; newData];
    [n m] = size(Data_Shimmer{x});
    Data_length(x) = n;
  end
  
  if (min(Data_length) > Data_len_view)
    for x=1:length(Shimmer_ports)
      
      
      str = length(Data_Shimmer{x}) - Data_len_view + 1;
      fin = length(Data_Shimmer{x});
      
      [r1 r2 r3] = quat2angle(Data_Shimmer{x}(str:fin,11:14), 'ZYX');
      
      eul_rot = [r1 r2 r3]*180/pi;
      
      figure(hf)
      subplot(length(Shimmer_ports),1,x)
      plot(eul_rot)
      title(['Shimmer ',num2str(x), '  ' ,Simmer_serial{x}])
      
      
%       subplot(3,1,1)
%       plot(Data_Shimmer{x}(str:fin,2:4))
%       subplot(3,1,2)
%       plot(Data_Shimmer{x}(str:fin,5:7))
%       subplot(3,1,3)
%       plot(Data_Shimmer{x}(str:fin,8:10))
      
      %legend('X','Y','Z')
           
    end
  end
  
  if strcmp(get(hf,'currentcharacter'),'q')
    close(hf)
    break
  end
end

%% Disconnect Shimmer

for x=1:length(Shimmer_ports)
  Shimmer_IMUs{x}.stop
  Shimmer_IMUs{x}.disconnect
end

%% Plot data

%m = length(Data_Shimmer{1}(:,1)) - length(Data_Shimmer{2}(:,1)); 

%figure()
%plot(Data_Shimmer{1}(m:length(Data_Shimmer{1}(:,1)),7))
%hold on 
%plot(Data_Shimmer{2}(:,7),'r')

%%
% if length(Shimmer_ports) > 1
% 
% num_shimmer = 2;
% aa = length(Data_Shimmer{num_shimmer});
% Data_taken = 2000; 
% q_complement = [Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,11)...
%               Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,12)*(-1)... 
%               Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,13)*(-1)... 
%               Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,14)*(-1)];
% 
% num_shimmer = 3;         
% aa = length(Data_Shimmer{num_shimmer});
% q_no = [Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,11)...
%         Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,12)*(-1)... 
%         Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,13)*(-1)... 
%         Data_Shimmer{num_shimmer}(aa - Data_taken + 1:aa,14)*(-1)];
%       
% q_rot2_1 = quatmultiply(q_no,q_complement);
%       
% [r11 r22 r33] = quat2angle(q_rot2_1, 'XYZ');
%       
% eul_rot_2 = [r11 r22 r33];
% 
% figure()
% plot(eul_rot_2*180/pi)
% 
% end