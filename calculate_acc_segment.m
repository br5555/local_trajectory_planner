function acc_segment = calculate_acc_segment(time, acc_segment_old, jerk_segment_old)

acc_segment = acc_segment_old + time * jerk_segment_old;

end