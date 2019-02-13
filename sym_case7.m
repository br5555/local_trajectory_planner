clear all
syms t1 t2 t3 t4 t5 t6 t7 a1 acc_start acc_end v1 p1 vel_start vel_end p_end p_start jerk_max jerk_min acc_min real 

eq2 = acc_end == t5*jerk_min + t7*jerk_max;
eq3 = v1 +t2*a1 +t3*a1+0.5*(t3^2)*jerk_min +0.5*(t5^2)*jerk_min - vel_end +t7*t5*jerk_min + 0.5*(t5^2)*jerk_max == 0;
eq1 = p1 + t2*v1  + 0.5*t2^2*a1+t3*(v1 + t2*a1) + 0.5*(t3^2)*a1 +(1/6)*(t5^3)*jerk_min + t5*(v1 + t2*a1 + t3*a1 +0.5*(t3^2)*jerk_min) + (1/6)*(t5^3)*jerk_min - ( p_end - t7*(vel_end - t7*t5*jerk_min - 0.5*(t7^2)*jerk_max) +0.5*(t7^2)*t5*jerk_min + (1/6)*(t7^3)*jerk_max ) == 0;

[sol_t2, sol_t5,sol_t7 ,param, cond] = solve([eq1, eq2,eq3], [t2,t5, t7], 'ReturnConditions', true, 'IgnoreAnalyticConstraints', true);