%% Code written by Abishek Chandrasekhar
%% Matlab code to simulate a Lorenz attractor and save it as a .gif file
clear
clc 
close all

%% Editable parameters
% Lorenz System Parameters
sigma = 10;
beta = 8/3;
rho = 28;

% Duration of simulation
t_span = [0:0.01:100];
% Initial conditions 
X0 = [10 10 10];

%% Simulation

[~,X] = ode45(@(t,y) Lorenz_func(t,y,sigma,beta,rho),t_span,X0);

%% Section to create animated gif
h = figure;
% Colour profile
c1 = 1; c2 = 1; c3 = 1;
t = animatedline('Color',[c1 c2 c3],'LineWidth',0.2);
x = X(:,1);
y = X(:,2);
z = X(:,3);

filename = 'Lorenz_Animated.gif';

xlim([min(z)-10 max(z)+10]);
ylim([min(x)-20 max(x)]+10);
count = 0;

set(gca,'color','black');
set(gcf,'inverthardcopy','off'); 
set(gcf,'Position',[0,0,1920,1080]);
camroll(90);
hold on;
grid on;

for k = 1:1:length(X)
    t.Color = [0 0.4470 0.7410];
    addpoints(t,z(k),x(k),y(k));
    drawnow limitrate
    count = count+1;
    if k == 1 || count == 1000
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
        if k ==1
            imwrite(imind,cm,filename,'gif','Loopcount',inf);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append');
        end   
     count =0;  
    end
    
end
xlabel('x-axis');
ylabel('z-axis');
title('2-D Animated file of Lorenz Attractor')

%% 3-D plot of Lorenz System
figure()
plot3(x,y,z)
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('3-D plot of Lorenz Attractor');
grid on