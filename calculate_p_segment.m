function p_segment = calculate_p_segment(time, acc_segment_old, jerk_segment_old, vel_segment_old, p_segemnt_old)

p_segment = p_segemnt_old + time * vel_segment_old + 0.5 * time^2 * acc_segment_old + (1/6) * time^3 * jerk_segment_old;

end