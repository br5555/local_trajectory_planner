figure();
plot(u_m_1.time, u_m_1.signals.values, 'LineWidth', 3); title('u_{mass position_1}'); ylabel('position [m]'); xlabel('Time [s]');
figure();
plot(u_m_3.time, u_m_3.signals.values, 'LineWidth', 3); title('u_{mass position_3}'); ylabel('position [m]'); xlabel('Time [s]');
figure();
plot(u_t_1.time, u_t_1.signals.values, 'LineWidth', 3); title('u_{\delta thrust_1}'); ylabel('angular velocity [rad/s]'); xlabel('Time [s]');
figure();
plot(u_t_3.time, u_t_3.signals.values, 'LineWidth', 3); title('u_{\delta thrust_3}'); ylabel('angular velocity [rad/s]'); xlabel('Time [s]');

figure();
plot(pos1.time, pos1.signals.values, 'LineWidth', 3); title('mass position_1'); ylabel('position [m]'); xlabel('Time [s]');
figure();
plot(pos3.time, pos3.signals.values, 'LineWidth', 3); title('mass position_3'); ylabel('position [m]'); xlabel('Time [s]');

figure();
plot(vel1.time, vel1.signals.values, 'LineWidth', 3); title('mass velocity_1'); ylabel('velocity [m/s]'); xlabel('Time [s]');
figure();
plot(vel3.time, vel3.signals.values, 'LineWidth', 3); title('mass velocity_3'); ylabel('velocity [m/s]'); xlabel('Time [s]');

figure();
plot(thrust1.time, thrust1.signals.values, 'LineWidth', 3); title('thrust_1'); ylabel('angular velocity [rad/s]'); xlabel('Time [s]');
figure();
plot(thrust3.time, thrust3.signals.values, 'LineWidth', 3); title('thrust_3'); ylabel('angular velocity [rad/s]'); xlabel('Time [s]');

figure();
plot(kut_izlaz1.time, kut_izlaz1.signals.values, 'LineWidth', 3); title('angle'); ylabel('angle [rad]'); xlabel('Time [s]');
figure();
plot(acc_angle.time, acc_angle.signals.values, 'LineWidth', 3); title('angular acceleration'); ylabel('angular acceleration [rad/s^2]'); xlabel('Time [s]');
