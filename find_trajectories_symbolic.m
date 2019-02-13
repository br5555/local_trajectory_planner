clc
clear all
syms a_max a_min theta_max theta_min v_max p_0 p_1 p_2 p_3 p_4 p_5 p_6 p_7 v_0 v_1 v_2 v_3 v_4 v_5 v_6 v_7 a_0 a_1 a_2 a_3 a_4 a_5 a_6 a_7 t_1 t_2 t_3 t_4 t_5 t_6 t_7 j_max j_min a v p a_wayp v_wayp p_wayp real

eq1 = a_0 + t_1 * j_max == a_1;
eq2 = a_1 + t_2 * 0 == a_2;
eq3 = a_2 + t_3 * j_min == a_3;
eq4 = a_3 + t_4 * 0 == a_4;
eq5 = a_4 + t_5 * j_min == a_5;
eq6 = a_5 + t_6 * 0 == a_6;
eq7 = a_6 + t_7 * j_max == a_7;

eq8 = v_0 + t_1 * a_0 + 0.5 * t_1^2 * j_max == v_1;
eq9 = v_1 + t_2 * a_1 + 0.5 * t_2^2 * 0 == v_2;
eq10 = v_2 + t_3 * a_2 + 0.5 * t_3^2 * j_min == v_3;
eq11 = v_3 + t_4 * a_3 + 0.5 * t_4^2 * 0 == v_4;
eq12 = v_4 + t_5 * a_4 + 0.5 * t_5^2 * j_min == v_5;
eq13 = v_5 + t_6 * a_5 + 0.5 * t_6^2 * 0 == v_6;
eq14 = v_6 + t_7 * a_6 + 0.5 * t_7^2 * j_max == v_7;

eq15 = p_0 + t_1*v_0 + 0.5* t_1^2 * a_0 + (1/6) * t_1^3 * j_max == p_1;
eq16 = p_1 + t_2*v_1 + 0.5* t_2^2 * a_1 + (1/6) * t_2^3 * 0 == p_2;
eq17 = p_2 + t_3*v_2 + 0.5* t_3^2 * a_2 + (1/6) * t_3^3 * j_min == p_3;
eq18 = p_3 + t_4*v_3 + 0.5* t_4^2 * a_3 + (1/6) * t_4^3 * 0 == p_4;
eq19 = p_4 + t_5*v_4 + 0.5* t_5^2 * a_4 + (1/6) * t_5^3 * j_min == p_5;
eq20 = p_5 + t_6*v_5 + 0.5* t_6^2 * a_5 + (1/6) * t_6^3 * 0 == p_6;
eq21 = p_6 + t_7*v_6 + 0.5* t_7^2 * a_6 + (1/6) * t_7^3 * j_max == p_7;

eq22 = a_0 == sym(0);%a;
eq23 = v_0 ==sym(0);%v;
eq24 = p_0 == p;
eq25 = a_7 == a_wayp;
eq26 = v_7 == v_wayp;
eq27 = p_7 == p_wayp;
eq28 = a_3 == a;
eq29 = a_1 == a_max;
eq30 = a_5 == a_min;
eq31 = v_3 == v_max;
eqns1 = [eq1, eq8, eq15, eq22, eq23, eq24, t_1 >= 0, ]
eqns = [eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, eq9, eq10,eq11,eq12,eq13,eq14,eq15,eq16,eq17,eq18,eq19,eq20,eq21, eq22,eq23,eq24,eq25,eq26,eq27,eq28,eq29,eq30,eq31];
vars = [t_1,  t_2, t_3, t_4, t_5, t_6, t_7];
% eqns1 =  rewrite(eqns1,'log');

solve(eqns, vars, 'ReturnConditions', true, 'IgnoreAnalyticConstraints', true);