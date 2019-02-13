function [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end)


t1 = ( acc_max - acc_start ) / jerk_max;
t2 = ( acc_max^2 * jerk_max - acc_max^2 * jerk_min + acc_start^2 * jerk_min + 2 * jerk_min* jerk_max * vel_max - 2 * jerk_min * jerk_max * vel_start ) / ( 2 * acc_max * jerk_min * jerk_max );
t3 = - acc_max / jerk_min;
A = acc_min * acc_max^4 * jerk_min^2 - acc_min^4 *acc_max * jerk_min^2 - acc_min *  acc_max^4 * jerk_max^2 + acc_min^4 *acc_max*jerk_max^2 - 3*acc_min * acc_start^4 * jerk_min^2;
B = 3 * acc_max * acc_end^4 * jerk_min^2 + 8* acc_min * acc_max * acc_start^3 *jerk_min^2 - 8*acc_min * acc_max * acc_end^3 * jerk_min^2;

C = -6* acc_min * acc_max ^2 * acc_start^2 * jerk_min ^2 + 6* acc_min^2 * acc_max * acc_end^2 *jerk_min^2 + 12 *  acc_min * jerk_min^2 * jerk_max^2 *vel_max^2;

D = -12 * acc_max * jerk_min^2 * jerk_max^2 * vel_max^2 - 12 * acc_min * jerk_min^2 *jerk_max^2 * vel_start^2 + 12* acc_max * jerk_min^2 * jerk_max^2 * vel_end^2;

E = 24 * acc_min * acc_max * jerk_min^2 * jerk_max ^2 * p_start - 24 * acc_min * acc_max * jerk_min^2 * jerk_max ^2 * p_end;

F = -12 * acc_min * acc_max^2 * jerk_min * jerk_max ^2 * vel_max + 12 * acc_min^2 * acc_max * jerk_min * jerk_max^2 * vel_max;

G = 12 * acc_min * acc_max^2 *jerk_min^2 * jerk_max * vel_start - 12 * acc_min^2 * acc_max * jerk_min^2 * jerk_max *vel_end;

H = 12 * acc_min * acc_start^2 * jerk_min^2 * jerk_max * vel_start - 12*acc_max * acc_end^2 * jerk_min^2 *jerk_max *vel_end;

I = -24* acc_min * acc_max * acc_start * jerk_min^2 * jerk_max * vel_start + 24* acc_min * acc_max * acc_end * jerk_min^2 * jerk_max * vel_end;

J = 24* acc_min * acc_max * jerk_min^2 * jerk_max^2 * vel_max;

t4 = - ( A + B + C + D + E + F + G + H + I )/ J; 
t5 = acc_min / jerk_min;
t6 = -(   acc_min^2 *jerk_max - acc_min^2 * jerk_min + acc_end^2 * jerk_min + 2 * jerk_min * jerk_max * vel_max - 2 * jerk_min * jerk_max * vel_end ) / ( 2 * acc_min * jerk_min * jerk_max);
t7 = - (acc_min - acc_end)/ (jerk_max);



end