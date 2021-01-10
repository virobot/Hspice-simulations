wset = xlsread('File Directory of the Excel Sheet');
wset = abs(wset);

RTL = wset(:,1);
Iavg = wset(:,4);
Pavg = wset(:,5);

minRTL = min(RTL)
maxRTL = max(RTL)
stdRTL = std(RTL)
avgRTL = mean(RTL)

minIavg = (min(Iavg))
maxIavg = (max(Iavg))
stdIavg = (std(Iavg))
avgIavg = (mean(Iavg))

minPavg = (min(Pavg))
maxPavg = (max(Pavg))
stdPavg = (std(Pavg))
avgPavg = (mean(Pavg))
