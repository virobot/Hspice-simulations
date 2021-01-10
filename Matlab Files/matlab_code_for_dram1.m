wset = xlsread('File Directory of the Excel Sheet');
rtl=wset(:,1);
fin=wset(:,2);
z=wset(:,3);
avg_current=wset(:,4);
avg_power=wset(:,5);

cap=[z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z];
figure(1);
surf(rtl,fin,cap);
xlabel('RTL');
ylabel('Number of fins');
zlabel('C')
hold on;

figure(2);
surf(avg_current,fin,cap);
xlabel('Avg_Current');
ylabel('Number of fins');
zlabel('C')
hold on;

figure(3);
surf(avg_power,fin,cap);
xlabel('Avg_Power');
ylabel('Number of fins');
zlabel('C');
hold on;