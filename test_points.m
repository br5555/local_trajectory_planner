clc
clear all
load morus_simulacija_vece_vrijeme_diskretizacije.mat
points = [0, 0;
          20, 0;
          20, 20;
          0, 20;
          0, 0]
[theta_x,theta_y , timer, p_x, p_y, vel_x, vel_y, acc_x, acc_y]  = calculate_path_for_points(points);
figure();
plot(timer, theta_x, 'LineWidth', 3); title('\theta_x'); xlabel('Time [s]'); ylabel('Angle [rad]')
figure();
plot(timer, theta_y, 'LineWidth', 3); title('\theta_y'); xlabel('Time [s]'); ylabel('Angle [rad]')

figure();
plot(timer, p_x, 'LineWidth', 3); title('position_x'); xlabel('Time [s]'); ylabel('Position [m]')
figure();
plot(timer, p_y, 'LineWidth', 3); title('position_y'); xlabel('Time [s]'); ylabel('Position [m]')

figure();
plot(timer, vel_x, 'LineWidth', 3); title('velocity_x'); xlabel('Time [s]'); ylabel('Velocity [m/s]')
figure();
plot(timer, vel_y, 'LineWidth', 3); title('velocity_y'); xlabel('Time [s]'); ylabel('Velocity [m/s]')

figure();
plot(timer, acc_x, 'LineWidth', 3); title('acceleration_x'); xlabel('Time [s]'); ylabel('Acceleration [m/s^2]')
figure();
plot(timer, acc_y, 'LineWidth', 3); title('acceleration_y'); xlabel('Time [s]'); ylabel('Acceleration [m/s^2]')

t_sim = max(timer)+5;