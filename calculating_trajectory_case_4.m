function [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_4(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end)


t6 = 0;
a_1 = acc_max;
v_3 = vel_max;
a_3 = 0;
a_4 = a_3;
t1 =(acc_max - acc_start)/jerk_max;
a_2 = a_1;
t3 = -(acc_max)/jerk_min;
v_2 = v_3 - t3*a_2 -0.5*(t3^2)*jerk_min;
v_1 = vel_start + t1*acc_start + 0.5*(t1^2)*jerk_max;

t2=(v_2 -v_1)/a_1;
v_4 = v_3;
p_1 = p_start + t1*vel_start + 0.5*(t1^2)*acc_start + (1/6)*(t1^3)*jerk_max;
p_2 = p_1 + t2*v_1 + 0.5*(t2^2)*a_1 ;
p_3 = p_2 + t3*v_2 + 0.5*(t3^2)*a_2 + (1/6)*(t3^3)*jerk_min;

a_t7 = (jerk_max^2)/(2*jerk_min)  - 0.5*jerk_max;
b_t7 = acc_end - (acc_end*jerk_max)/(jerk_min);
c_t7 = v_4 - vel_end + (0.5*acc_end^2)/(jerk_min);

t7_1 = (-b_t7 + sqrt(complex(b_t7^2 - 4*a_t7*c_t7))) / (2*a_t7);
t7_2 = (-b_t7 - sqrt(complex(b_t7^2 - 4*a_t7*c_t7))) / (2*a_t7);
if(t7_2<0 || any(imag(t7_2)))
        if( any(imag(t7_1)))
    t7 = -1;
    else
        t7 = real(t7_1);
    end
else
     if( any(imag(t7_2)))
    t7 = -1;
    else
        t7 = real(t7_2);
    end
end



a_5 = acc_end - t7*jerk_max;
t5 = (a_5)/(jerk_min);
a_6 = a_5;
v_6 = vel_end -t7*a_6 - 0.5*(t7^2)*jerk_max;
v_5 = v_6;
p_6 = p_end - t7*v_6 - 0.5*(t7^2)*a_6 - (1/6)*(t7^3)*jerk_max;
p_5 = p_6 - t6*v_5 - 0.5*(t6^2)*a_5;
p_4 = p_5 - t5*v_4 - 0.5*(t5^5)*a_4 - (1/6)*(t5^3)*jerk_min;
t4 = (p_4 - p_3)/v_3;
end