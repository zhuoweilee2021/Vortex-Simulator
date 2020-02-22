clear;
close all;

%PLEASE ALLOW THE ANIMATION TO COMPLETELY CLOSE AND SAVE

%Set constants
Pf = 1;
Pp = 5;
V = .0001;
r = .001;
vol = 4/3*pi*(r^3);
changeT = .01;
totalSteps = 50000;

%Call function to plot velocity and contour plots
contourPlot();

%Plot inital and final positions
disp('Generating particles');
%Call function to generate final and inital positions of the particles
[initialX,initialY,finalX,finalY] = generatePositions(Pf,Pp,V,r,changeT,totalSteps);
%Randomize colors of the points
c = linspace(1,10,length(initialX));

%Create intial plot with appropriate properties
disp('Plotting particles');
figure('Name','Position Plot 1');
scatter(initialX,initialY,20,c,'filled');
set(gca,'XLim',[0 2*pi],'YLim',[0 2*pi]);
title('Initial Positions');
xlabel('x');
ylabel('y');

%Create final plot with appropriate properties
figure('Name','Position Plot 2');
c = linspace(1,10,length(finalX));
scatter(finalX,finalY,20,c,'filled');
set(gca,'XLim',[0 2*pi],'YLim',[0 2*pi]);
title('Final Positions');
xlabel('x');
ylabel('y');

disp('Inital and final particle plots finished');

%Call function to generate, record, and save animation
generateAnimation(Pf,Pp,V,r,changeT,totalSteps,'Positions');