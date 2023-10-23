% Define the first-order system
numerator = 1;
denominator = [1, 1];
plant = tf(numerator, denominator);

% Define the desired closed-loop characteristics
desired_overshoot = 10; % Desired overshoot in percentage
desired_settling_time = 2; % Desired settling time in seconds

% Calculate the control system parameters
zeta = -log(desired_overshoot/100) / sqrt(pi^2 + (log(desired_overshoot/100))^2);
wn = 4 / (zeta * desired_settling_time);

% Design a PI controller
Kp = wn^2;
Ki = 2 * zeta * wn;
controller = tf([Kp, Ki], [1, 0]);

% Calculate the closed-loop transfer function
sys_cl = feedback(controller * plant, 1);

% Step response of the closed-loop system
t = 0:0.01:10;
step(sys_cl, t);
title('Step Response of the Closed-Loop System');



