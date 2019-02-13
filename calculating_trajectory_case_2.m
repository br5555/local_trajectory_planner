function [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_2(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end)


t1 = (acc_max - acc_start)/jerk_max;
a1 = acc_max;
a5 = acc_min;
t4 = 0;
a3 = 0;
a2 = acc_max;
t3 = -acc_max/jerk_min;
a4 = a3;
a7 = acc_end;
a6 = acc_min;
t7 = (a7 - a6)/jerk_max;
a0 = acc_start;
a5 = a6;
t5 = a5/jerk_min;
v1 = vel_start + t1*acc_start + 0.5*t1^2 * jerk_max;
v6 = vel_end - t7*a6 - 0.5*((t7)^2)*jerk_max;
p6 = p_end - t7*v6 - 0.5*(t7^2)*a6 - (1/6)*(t7^3)*jerk_max;
p1 = p_start + t1*vel_start + 0.5*(t1^2)*acc_start + (1/6)*(t1^3)*jerk_max;
t6 =  (2*a1*v6 - 2*a5*v6 + (4*a5^2*v1^2 + 4*a1^2*v6^2 + 4*a1^2*a5^2*t3^2 + 4*a1^2*a5^2*t5^2 - 8*a1*a5^2*p1 + 8*a1^2*a5*p1 + 8*a1*a5^2*p6 - 8*a1^2*a5*p6 - 4*a1*a5*v1^2 - 4*a1*a5*v6^2 - 4*a1*a2*a5^2*t3^2 + 4*a1*a2^2*a5*t3^2 - 4*a1^2*a2*a5*t3^2 - (4*a1*a5^2*jerk_min*t3^3)/3 - (8*a1^2*a5*jerk_min*t3^3)/3 + a1*a5*jerk_min^2*t3^4 - (4*a1*a5^2*jerk_min*t5^3)/3 - (8*a1^2*a5*jerk_min*t5^3)/3 + a1*a5*jerk_min^2*t5^4 + 8*a1^2*a5^2*t3*t5 - 4*a1*a5^2*jerk_min*t3^2*t5 - 4*a1^2*a5*jerk_min*t3*t5^2 + 2*a1*a5*jerk_min^2*t3^2*t5^2 + 4*a1*a2*a5*jerk_min*t3^3 - 8*a1*a2*a5^2*t3*t5 + 4*a1*a2*a5*jerk_min*t3*t5^2)^(1/2) - 2*a1*a5*t3 + 2*a2*a5*t3 - 2*a1*a5*t5 + a5*jerk_min*t3^2 + a5*jerk_min*t5^2)/(2*a5*(a1 - a5));
if (t6<0 || any(imag(t6)))
    t6 =  (2*a1*v6 - 2*a5*v6 - (4*a5^2*v1^2 + 4*a1^2*v6^2 + 4*a1^2*a5^2*t3^2 + 4*a1^2*a5^2*t5^2 - 8*a1*a5^2*p1 + 8*a1^2*a5*p1 + 8*a1*a5^2*p6 - 8*a1^2*a5*p6 - 4*a1*a5*v1^2 - 4*a1*a5*v6^2 - 4*a1*a2*a5^2*t3^2 + 4*a1*a2^2*a5*t3^2 - 4*a1^2*a2*a5*t3^2 - (4*a1*a5^2*jerk_min*t3^3)/3 - (8*a1^2*a5*jerk_min*t3^3)/3 + a1*a5*jerk_min^2*t3^4 - (4*a1*a5^2*jerk_min*t5^3)/3 - (8*a1^2*a5*jerk_min*t5^3)/3 + a1*a5*jerk_min^2*t5^4 + 8*a1^2*a5^2*t3*t5 - 4*a1*a5^2*jerk_min*t3^2*t5 - 4*a1^2*a5*jerk_min*t3*t5^2 + 2*a1*a5*jerk_min^2*t3^2*t5^2 + 4*a1*a2*a5*jerk_min*t3^3 - 8*a1*a2*a5^2*t3*t5 + 4*a1*a2*a5*jerk_min*t3*t5^2)^(1/2) - 2*a1*a5*t3 + 2*a2*a5*t3 - 2*a1*a5*t5 + a5*jerk_min*t3^2 + a5*jerk_min*t5^2)/(2*a5*(a1 - a5));
end
if( any(imag(t6)))
t6 = -1;
end
v5 = v6 - t6*a5;
v3 = v5 - 0.5*(t5^2)*jerk_min;
v4 = v3;
v2 = v3 - t3*acc_max - 0.5*(t3^2)*jerk_min;

t2 =  - (jerk_min*t3^2 + 2*a2*t3 + jerk_min*t5^2 + 2*v1 - 2*v6)/(2*a1) - (2*a1*v6 - 2*a5*v6 + (4*a5^2*v1^2 + 4*a1^2*v6^2 + 4*a1^2*a5^2*t3^2 + 4*a1^2*a5^2*t5^2 - 8*a1*a5^2*p1 + 8*a1^2*a5*p1 + 8*a1*a5^2*p6 - 8*a1^2*a5*p6 - 4*a1*a5*v1^2 - 4*a1*a5*v6^2 - 4*a1*a2*a5^2*t3^2 + 4*a1*a2^2*a5*t3^2 - 4*a1^2*a2*a5*t3^2 - (4*a1*a5^2*jerk_min*t3^3)/3 - (8*a1^2*a5*jerk_min*t3^3)/3 + a1*a5*jerk_min^2*t3^4 - (4*a1*a5^2*jerk_min*t5^3)/3 - (8*a1^2*a5*jerk_min*t5^3)/3 + a1*a5*jerk_min^2*t5^4 + 8*a1^2*a5^2*t3*t5 - 4*a1*a5^2*jerk_min*t3^2*t5 - 4*a1^2*a5*jerk_min*t3*t5^2 + 2*a1*a5*jerk_min^2*t3^2*t5^2 + 4*a1*a2*a5*jerk_min*t3^3 - 8*a1*a2*a5^2*t3*t5 + 4*a1*a2*a5*jerk_min*t3*t5^2)^(1/2) - 2*a1*a5*t3 + 2*a2*a5*t3 - 2*a1*a5*t5 + a5*jerk_min*t3^2 + a5*jerk_min*t5^2)/(2*a1*(a1 - a5));
if (t2<0 || any(imag(t2)))
    t2 =  - (jerk_min*t3^2 + 2*a2*t3 + jerk_min*t5^2 + 2*v1 - 2*v6)/(2*a1) - (2*a1*v6 - 2*a5*v6 - (4*a5^2*v1^2 + 4*a1^2*v6^2 + 4*a1^2*a5^2*t3^2 + 4*a1^2*a5^2*t5^2 - 8*a1*a5^2*p1 + 8*a1^2*a5*p1 + 8*a1*a5^2*p6 - 8*a1^2*a5*p6 - 4*a1*a5*v1^2 - 4*a1*a5*v6^2 - 4*a1*a2*a5^2*t3^2 + 4*a1*a2^2*a5*t3^2 - 4*a1^2*a2*a5*t3^2 - (4*a1*a5^2*jerk_min*t3^3)/3 - (8*a1^2*a5*jerk_min*t3^3)/3 + a1*a5*jerk_min^2*t3^4 - (4*a1*a5^2*jerk_min*t5^3)/3 - (8*a1^2*a5*jerk_min*t5^3)/3 + a1*a5*jerk_min^2*t5^4 + 8*a1^2*a5^2*t3*t5 - 4*a1*a5^2*jerk_min*t3^2*t5 - 4*a1^2*a5*jerk_min*t3*t5^2 + 2*a1*a5*jerk_min^2*t3^2*t5^2 + 4*a1*a2*a5*jerk_min*t3^3 - 8*a1*a2*a5^2*t3*t5 + 4*a1*a2*a5*jerk_min*t3*t5^2)^(1/2) - 2*a1*a5*t3 + 2*a2*a5*t3 - 2*a1*a5*t5 + a5*jerk_min*t3^2 + a5*jerk_min*t5^2)/(2*a1*(a1 - a5));
end
if( any(imag(t2)))
t2 = -1;
end
t2 = (v2 - v1)/a1;



end