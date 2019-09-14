clear all
close all
clc
ac='ln';
data = Datagenerator(ac);
for i = 1:length(data)
    len(i) = length(data(i).a);
end
[~,pos] = sort(len);

for i = 1:length(len)-1
    if i == 1
        [Data1, Data2] = synchronization(data(pos(1)),data(pos(i+1)));
        assignin('base',strcat('IMU',num2str(i)),Data1);
        assignin('base',strcat('IMU',num2str(i+1)),Data2);
    else
        [~, Data2] = synchronization(data(pos(1)),data(pos(i+1)));
        assignin('base',strcat('IMU',num2str(i+1)),Data2);
    end
end
% figure(1)
% plot(IMU4.a)
% hold on
% plot(IMU3.a)
% plot(IMU2.a)
% plot(IMU1.a)
% legend('IMU4','IMU3','IMU2','IMU1')

%% Cut Data
fprintf('Select position 1 and press enter then select position 2 and press enter \n')
c_fig = figure;
plot(IMU1.a)
cursor = datacursormode(c_fig);
pause
value = getCursorInfo(cursor);
peak1 = value.Position(1);
pause
value = getCursorInfo(cursor);
peak2 = value.Position(1);
while peak2 <= peak1
        fprintf('Position 2 must be higher than Position 1 = %i \n',peak1)
        pause
        value = getCursorInfo(cursor);
        peak2 = value.Position(1);
end
figure
hold on
for i = 1:length(data)
    IMU = evalin('base',strcat('IMU',num2str(i)));
    assignin('base',strcat('Q_',IMU.id),IMU.q(peak1:peak2,:));
    assignin('base',strcat('a_',IMU.id),IMU.a(peak1:peak2,:));
    assignin('base',strcat('t_',IMU.id),IMU.t(peak1:peak2,:));
    plot(IMU.t(peak1:peak2,:),'*');
    Q(1).(strcat('Q_',IMU.id)) = evalin('base',strcat('Q_',IMU.id));
        
end
title('Timestamp Synchronzation')
hold off
close (c_fig)

figure
plot(a_PV)
hold on
plot(a_TH_R)
plot(a_SH_R)
plot(a_FT_R)

% figure
% plot(t_PV,'*')
% hold on
% plot(t_TH_R,'*')
% plot(t_SH_R,'*')
% plot(t_FT_R,'*')

%% Save Data
save('Quaternions.mat','Q')
fprintf('Data Saved as Quaternions.mat\n')
