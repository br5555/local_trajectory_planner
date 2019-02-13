syms t2 a0 a1 a2  a5 a6 a7 t1 t3 t5 t4 t6 t7 v1 v7 v0 v6 p0 p1 p7 p6 jerk_min real 

eq1 = v3 == v1 + t2*a1 + t3*a2 + 0.5*t3^2*jerk_min;
eq2 = v5 == v3  + 0.5*t5^2*jerk_min;
eq3 = v6  == v5 + t6*a5;
eq4 = p2 == p1 + t2*v1 + 0.5*t2^2*a1;
eq5 = p3 == p2 + t3*(v1 + t2*a1) + 0.5*t3^2*a2 + (1/6)*t3^3*jerk_min;
eq6 = p5 == p3 + t5*v3  + (1/6)*t5^3*jerk_min;
eq7 = p6 == p5 + t6*v5 + 0.5*t6^2*a5;


[sol_t2, sol_t6, param, cond] = solve([eq1, eq2,eq3,eq4,eq5,eq6,eq7], [t2, t6], 'ReturnConditions', true, 'IgnoreAnalyticConstraints', true);
