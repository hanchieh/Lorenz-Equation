%Chieh Han
%Phillip Westphal
%Amath 402 project

%Solution for the Lorenz equations and attempted esimation of lyapunov
%exponent
clear all
close all

sigma=10;
beta=8/3;
rho=28;
%initial conditions
x0 = 3;
y0 = 3;
z0 = 20;
delta = 10^-5 % perturbation
f = @(t,L) [-sigma*L(1) + sigma*L(2); rho*L(1) - L(2) - L(1)*L(3); -beta*L(3) + L(1)*L(2); -sigma*L(4) + sigma*L(5); rho*L(4) - L(5) - L(4)*L(6); -beta*L(6) + L(4)*L(5)];
[t,L] = ode45(f,[0 15],[x0 y0 z0 x0+delta y0+delta z0+delta])% important to solve two trajectories simultaneously with ode45
figure(1)
plot3(L(:,1),L(:,2),L(:,3)) % make 3D plot of solution curve

% Chose time value from 0 to 15 since that is when the solution first
% starts to separate rapidly. We are only interested in that portion. Chosing the
% right time value varies with initial conditions and we examined solutions curves
% to determine that. For our conditions, 0 to 15 works best

%Plots Euclidean distance between trajectories over time
figure(2)
plot(t, sqrt((L(:, 1)-L(:, 4)).^2 + (L(:, 2)-L(:, 5)).^2 + (L(:, 3)-L(:, 6)).^2))
%Plots natural log of the Euclidean distance between trajectories over time
figure(3)
plot(t, log(sqrt((L(:, 1)-L(:, 4)).^2 + (L(:, 2)-L(:, 5)).^2 + (L(:, 3)-L(:, 6)).^2)))
%slope = lyapunov exponent
polyfit(t, log(sqrt((L(:, 1)-L(:, 4)).^2 + (L(:, 2)-L(:, 5)).^2 + (L(:, 3)-L(:, 6)).^2)), 1)










