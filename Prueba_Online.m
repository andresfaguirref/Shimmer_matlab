SensorMacros = SetEnabledSensorsMacrosClass;

frecSample = 64;

%% Simmer 1

shimmer1 = ShimmerHandleClass('13');
shimmer1.connect

shimmer1.setsamplingrate(frecSample);                                         % Set the shimmer sampling rate to 51.2Hz
shimmer1.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
shimmer1.disableallsensors;                                             % disable all sensors
shimmer1.setenabledsensors(SensorMacros.GYRO,1,SensorMacros.MAG,1,...   % Enable the gyroscope, magnetometer and accelerometer.
SensorMacros.ACCEL,1);                                                  
shimmer1.setaccelrange(0);                                              % Set the accelerometer range to 0 (+/- 1.5g for Shimmer2/2r, +/- 2.0g for Shimmer3)
shimmer1.setorientation3D(1);                                           % Enable orientation3D
shimmer1.setgyroinusecalibration(1); 


%% Start 

pause(2)

shimmer1.start

pause(2)

Data_Sensors = {};
data1 = [];


times = 300;
figure()

tic
for x=1:times    
    pause(0.2)
    
    [newData1,signalNameArray1,signalFormatArray1,signalUnitArray1] = shimmer1.getdata('c');
    data1 =  [data1; newData1];
   
    [n m] = size(data1);
    
    if  (n > 500)
        subplot(2,2,1)
        plot(data1(n-500:n,5:7))
        subplot(2,2,2)
        [r1 r2 r3] = quat2angle(data1(n-500:n,11:14), 'ZYX');
        plot(r1*180/pi,'b')
        %axis([0 500 -pi pi])
        axis([0 500 -190 190])
        %hold on
        subplot(2,2,3)
        plot(r2*180/pi,'r')
        %axis([0 500 -pi pi])
        axis([0 500 -190 190])
        %hold on
        subplot(2,2,4)
        plot(r3*180/pi,'g')
        %axis([0 500 -pi pi])
        axis([0 500 -190 190])
    end
end

shimmer1.stop
shimmer1.disconnect

[r1 r2 r3] = quat2angle(data1(:,11:14), 'ZYX');

figure()
plot(r1)

% q = q0 * inverse(q1)