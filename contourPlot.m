function contourPlot()
%plot u, v, and voticity contour
contourY = transpose(2*pi:-2*pi/20:0);
contourX = 0:2*pi/20:2*pi;

figure('Name','Contour Plot 1');
u = sin(contourY)*cos(contourX);
contourf(contourX,contourY,u,9);
title('u contour');
xlabel('x');
ylabel('y');

figure('Name','Contour Plot 2');
v = -1*cos(contourY)*sin(contourX);
contourf(contourX,contourY,v,9);
title('v contour');
xlabel('x');
ylabel('y');

%Plot velocity vectors
[x,y] = meshgrid(0:2*pi/20:2*pi,0:2*pi/20:2*pi);
velX = cos(x).*sin(y);
velY = -1*sin(x).*cos(y);
figure('Name','Veloctity Plot');
quiver(x,y,velX,velY);
title('Velocity vectors');
xlim([0 2*pi]);
ylim([0 2*pi]);
xlabel('x');
ylabel('y');

figure('Name','Contour Plot 3');
w = -2*cos(transpose(x(1,:)))*cos(transpose(y(:,1)));
contourf(x(1,:),y(:,1),w,9);
title('Voticity Contour');
xlabel('x');
ylabel('y');
drawnow
disp('Contour and Velocity plots created');
end