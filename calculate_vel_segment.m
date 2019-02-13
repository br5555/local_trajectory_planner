function vel_segment = calculate_vel_segment(time, acc_segment_old, jerk_segment_old, vel_segment_old)

vel_segment =vel_segment_old + time * acc_segment_old + 0.5*time^2 * jerk_segment_old;

end