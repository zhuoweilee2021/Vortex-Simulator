function [initialX,initialY,finalX,finalY] = generatePositions(Pf,Pp,V,r,changeT,totalSteps)

vol = 4/3*pi*(r^3);

%Set inital set of random points,flow and particle velocities, and forces
pointX = 2*pi*rand(1,1600); %particle positions
pointY = 2*pi*rand(1,1600);
velocityX = zeros(1,1600); %particle velocities
velocityY = zeros(1,1600);
flowX = zeros(1,1600); %flow velocities
flowY = zeros(1,1600);
forceX = zeros(1,1600); %forces
forceY = zeros(1,1600);

%return initial points
initialX = pointX;
initialY = pointY;

for j = 1:totalSteps
    %Calculate flow velocities at each point
    for i=1:1600
        flowX(i) = cos(pointX(i))*sin(pointY(i));
        flowY(i) = -1*sin(pointX(i))*cos(pointY(i));
    end

    %Calculate forces on each particle
    for i=1:1600
        forceX(i) = 6*pi*Pf*V*r*(flowX(i)-velocityX(i));
        forceY(i) = 6*pi*Pf*V*r*(flowY(i)-velocityY(i));
    end

    %Calculate particle velocities
    for i=1:1600
        velocityX(i) = velocityX(i)+changeT*forceX(i)/(Pp*vol);
        velocityY(i) = velocityY(i)+changeT*forceY(i)/(Pp*vol);
    end

    %Update particle positions
    for i=1:1600
        pointX(i) = mod(pointX(i)+changeT*velocityX(i),2*pi);
        pointY(i) = mod(pointY(i)+changeT*velocityY(i),2*pi);
    end
end

%return final points
finalX = pointX;
finalY = pointY;
end