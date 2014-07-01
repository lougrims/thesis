function[Cl,Cd,t]=NACA0009_GK(alpha,dt)
 

% Output Cl and Cd the NACA0009 airfoil according to the GK model.

% Inputs:
%     - alpha : vector of angle of attack in degrees. 
%       The points must be sampled at a regular interval.
%     - dt : time interval between the points, in t+;.
%
% Outputs:
%     - Cl : lift coefficient vector
%     - Cd : drag coeeficient vector
%     - t : vector containing the sample time in t+, starting at 0
%     
% Written by Lou the 12/03/2014

m=length(alpha);

tau1=3.06; %GK time constant in t+
tau2= 4.29;
G_max=10.13;

t=linspace(0,m*dt,m);

% experimental x0 vs alpha curve
x0ref=[1 6 7    8     10   12  15   18   19   20   21    22    23 24 25;
      1  1 0.95 0.85  0.60 0.4 0.21 0.09 0.06 0.03 0.015 0.005 0  0  0]';
x0ref=[ -1*flipud(x0ref); x0ref];
x0ref(:,2)=abs(x0ref(:,2));

% initialize x (only the first value is usefull)
x=ones(length(t),1)*interp1(x0ref(:,1),x0ref(:,2),alpha(1)); 
X0=interp1(x0ref(:,1),x0ref(:,2),alpha(2:end)-diff(alpha)./dt*tau2,'pchip','extrap');

for i=2:length(t)
    x(i)=x(i-1)+dt*(X0(i-1)-x(i-1))/tau1;   
end

x(x<0)=0; % remove impossible values of x
x(x>1)=1;

Cl=2*pi*pi/180*alpha.*(0.4+0.6*x.^1) +0.08; % custom Cl function
Cd=(((2-x).*Cl).^2)/(G_max) +0.025;
