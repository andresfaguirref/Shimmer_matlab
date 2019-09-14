SensorMacros = SetEnabledSensorsMacrosClass;

frecSample = 64;

%% Simmer 1

shimmer1 = ShimmerHandleClass('16');
shimmer1.connect

shimmer1.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer1.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer1.disableallsensors;                                             % disable all sensors
shimmer1.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer1.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer1.setorientation3D(1);                                           % Enable orientation3D
shimmer1.setgyroinusecalibration(1);                                    % Enable gyro in-use calibration

%% Simmer 2

shimmer2 = ShimmerHandleClass('29');
shimmer2.connect

shimmer2.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer2.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer2.disableallsensors;                                             % disable all sensors
shimmer2.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer2.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer2.setorientation3D(1);                                           % Enable orientation3D
shimmer2.setgyroinusecalibration(1); 


%% Simmer 3

shimmer3 = ShimmerHandleClass('31');
shimmer3.connect

shimmer3.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer3.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer3.disableallsensors;                                             % disable all sensors
shimmer3.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer3.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer3.setorientation3D(1);                                           % Enable orientation3D
shimmer3.setgyroinusecalibration(1); 

%% Simmer 4

shimmer4 = ShimmerHandleClass('34');
shimmer4.connect

shimmer4.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer4.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer4.disableallsensors;                                             % disable all sensors
shimmer4.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer4.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer4.setorientation3D(1);                                           % Enable orientation3D
shimmer4.setgyroinusecalibration(1); 

%% Simmer 5

shimmer5 = ShimmerHandleClass('36');
shimmer5.connect

shimmer5.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer5.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer5.disableallsensors;                                             % disable all sensors
shimmer5.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer5.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer5.setorientation3D(1);                                           % Enable orientation3D
shimmer5.setgyroinusecalibration(1); 

%% Simmer 6

shimmer6 = ShimmerHandleClass('37');
shimmer6.connect

shimmer6.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer6.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer6.disableallsensors;                                             % disable all sensors
shimmer6.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer6.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer6.setorientation3D(1);                                           % Enable orientation3D
shimmer6.setgyroinusecalibration(1); 

%% Simmer 7

shimmer7 = ShimmerHandleClass('40');
shimmer7.connect

shimmer7.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer7.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer7.disableallsensors;                                             % disable all sensors
shimmer7.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer7.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer7.setorientation3D(1);                                           % Enable orientation3D
shimmer7.setgyroinusecalibration(1);

%% Start
pause(3)

shimmer1.start
shimmer2.start
shimmer3.start
shimmer4.start
shimmer5.start
shimmer6.start
shimmer7.start

pause(5)

data1 = {};
data2 = {};
data3 = {};
data4 = {};
data5 = {};
data6 = {};
data7 = {};


tic
%pause(15)

times = 30
for x=1:times    

    [newData1,signalNameArray1,signalFormatArray1,signalUnitArray1] = shimmer1.getdata('c');
    data1{x} = newData1;

    [newData2,signalNameArray2,signalFormatArray2,signalUnitArray2] = shimmer2.getdata('c');
    data2{x} = newData2;

    [newData3,signalNameArray3,signalFormatArray3,signalUnitArray3] = shimmer3.getdata('c');
    data3{x} = newData3;
    
    [newData4,signalNameArray4,signalFormatArray4,signalUnitArray4] = shimmer4.getdata('c');
    data4{x} = newData4;
    
    [newData5,signalNameArray5,signalFormatArray5,signalUnitArray5] = shimmer5.getdata('c');
    data5{x} = newData5;
    
    [newData6,signalNameArray6,signalFormatArray6,signalUnitArray6] = shimmer6.getdata('c');
    data6{x} = newData6;
    
    [newData7,signalNameArray7,signalFormatArray7,signalUnitArray7] = shimmer7.getdata('c');
    data7{x} = newData7;

    toc
    pause(0.2)
end

shimmer1.stop
shimmer2.stop
shimmer3.stop
shimmer4.stop
shimmer5.stop
shimmer6.stop
shimmer7.stop

shimmer1.disconnect
shimmer2.disconnect
shimmer3.disconnect
shimmer4.disconnect
shimmer5.disconnect
shimmer6.disconnect
shimmer7.disconnect

%%
a1 = [];
a2 = [];
a3 = [];
a4 = [];
a5 = [];
a6 = [];
a7 = [];

T1 = [];
T2 = [];
T3 = [];
T4 = [];
T5 = [];
T6 = [];
T7 = [];

for x=3:times
    a1 = [a1; data1{x}(:,7)];
    a2 = [a2; data2{x}(:,7)];
    a3 = [a3; data3{x}(:,7)];
    a4 = [a4; data4{x}(:,7)];
    a5 = [a5; data5{x}(:,7)];
    a6 = [a6; data6{x}(:,7)];
    a7 = [a7; data7{x}(:,7)];
    
    T1 = [T1; data1{x}(:,11:14)];
    T2 = [T2; data2{x}(:,11:14)];
    T3 = [T3; data3{x}(:,11:14)];
    T4 = [T4; data4{x}(:,11:14)];
    T5 = [T5; data5{x}(:,11:14)];
    T6 = [T6; data6{x}(:,11:14)];
    T7 = [T7; data7{x}(:,11:14)];
end

%%


figure()
plot(a1)
hold on
plot(a2,'r')
hold on
plot(a3,'g')
hold on
plot(a4,'y')
hold on
plot(a5,'k')
hold on
plot(a6,'c')
hold on
plot(a7,'m')
hold off


%%

figure()
mm = 5;
plot(data1{mm}(:,7));
hold on;
plot(data2{mm}(:,7),'r');
hold on; 
plot(data3{mm}(:,7),'g');
hold on
plot(data4{mm}(:,7),'y')
hold on
plot(data5{mm}(:,7),'k')
hold on
plot(data6{mm}(:,7),'c')
hold on
plot(data7{mm}(:,7),'m')
hold off

%% 
ANG1 = [];

for x=1:length(T1)
    [angle, axis] = quat2angleaxis(T1(x,:));
    ANG1(x) = angle;   
end
figure()
plot(ANG1)