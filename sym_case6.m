syms t1 t2 t3 t4 t5 t6 t7 a5 a6 acc_start v6 vel_start p6 p_start jerk_max jerk_min acc_min real

eq1 = 0 == acc_start + t1*jerk_max + t3*jerk_min;
eq2 = v6 == vel_start + t1*acc_start + 0.5*(t1^2)*jerk_max + t3*(acc_start + t1*jerk_max) + 0.5*(t3^2)*jerk_min + 0.5*(t5^2)*jerk_min;
eq3 = p6 == p_start + t1*vel_start + 0.5*(t1^2)*acc_start + (1/6)*(t1^3)*jerk_max + t3*(vel_start + t1*acc_start + 0.5*(t1^2)*jerk_max ) + 0.5*(t3^2)*(acc_start + t1*jerk_max) + (1/6)*(t3^3)*jerk_min + t5*(vel_start + t1*acc_start + 0.5*(t1^2)*jerk_max +t3*(acc_start + t1*jerk_max) + 0.5*(t3^2)*jerk_min) + (1/6)*(t5^3)*jerk_min + t6*(vel_start + t1*acc_start + 0.5*(t1^2)*jerk_max +t3*(acc_start + t1*jerk_max) + 0.5*(t3^2)*jerk_min + 0.5*(t5^2)*jerk_min ) + 0.5*(t6^2)*acc_min

[sol_t1, sol_t3,sol_t6 ,param, cond] = solve([eq1, eq2,eq3], [t1,t3, t6], 'ReturnConditions', true, 'IgnoreAnalyticConstraints', true);