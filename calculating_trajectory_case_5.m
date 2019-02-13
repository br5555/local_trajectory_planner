function [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_5(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end)


t2 = 0; 
t6 = 0;
a_3 = 0;
a_4 = a_3;
v_3 = vel_max;
v_4  = v_3;

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

c_t1 = (vel_start - vel_max - 0.5*((acc_start^2)/jerk_min) );
b_t1 = acc_start - acc_start*(jerk_max/jerk_min);
a_t1 = 0.5*jerk_max - 0.5*( (jerk_max^2) / jerk_min)
t1_1 = (-b_t1 + sqrt(complex(b_t1^2 - 4*a_t1*c_t1))) / (2*a_t1);
t1_2 = (-b_t1 - sqrt(complex(b_t1^2 - 4*a_t1*c_t1))) / (2*a_t1);
if(t1_2<0 || any(imag(t1_2)))
 if( any(imag(t1_1)))
    t1 = -1;
    else
        t1 = real(t1_1);
    end
    
else
    if( any(imag(t1_2)))
    t1 = -1;
    else
        t1 = real(t1_2);
    end
end


a_1 = acc_start + t1*jerk_max;
a_2 = a_1;
t3 = -a_2/jerk_min;
p1 = p_start + t1*vel_start + 0.5*(t1^2)*acc_start + (1/6)*(t1^3)*jerk_max;
p_2 = p1;
v1 = vel_start + t1*acc_start + 0.5*(t1^2)*jerk_max;
v_2 = v1;

p_3 = p_2 + t3*v_2 + 0.5*(t3^2)*a_2 + (1/6)*(t3^3)*jerk_min;


p_6 = p_end - t7*v_6 - 0.5*(t7^2)*a_6 - (1/6)*(t7^3)*jerk_max;
p_5 = p_6 - t6*v_5 - 0.5*(t6^2)*a_5;
p_4 = p_5 - t5*v_4 - 0.5*(t5^2)*a_4 - (1/6)*(t5^3)*jerk_min;

t4 = (p_4 - p_3)/v_3;




end