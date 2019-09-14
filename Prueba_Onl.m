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

%% Start

pause(3)

shimmer1.start
shimmer2.start

pause(5)

Data_Sensors = {};
data1 = {};
data2 = {};

data1_show = [];
data2_show = [];
times = 100;
figure()
for x=1:times    
    pause(0.2)
    
    [newData1,signalNameArray1,signalFormatArray1,signalUnitArray1] = shimmer1.getdata('c');
    data1{x} = newData1;
    data1_show = [data1_show; newData1];

    [newData2,signalNameArray2,signalFormatArray2,signalUnitArray2] = shimmer2.getdata('c');
    data2{x} = newData2;
    data2_show = [data2_show; newData2];

    subplot(2,1,1)
    plot(data1_show(:,7),'r')
    subplot(2,1,2)
    plot(data2_show(:,7),'b')
end

shimmer1.stop
shimmer2.stop

shimmer1.disconnect
shimmer2.disconnect



