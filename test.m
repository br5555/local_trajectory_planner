clc
clear all
load morus_simulacija_vece_vrijeme_diskretizacije.mat
jerk_max = 1;
jerk_min = -1;
acc_max = 0.5; 
acc_min = -0.5;
vel_max  = 1;
vel_min = -1;
vel_start = 0; 
vel_end = 0;
p_start  =0;
p_end = 20;
acc_start =0 ;
acc_end = 0;
[theta, timer] = calculate_theta(jerk_max, jerk_min, acc_max, acc_min,vel_max,vel_min, vel_start, vel_end ,p_start , p_end , acc_start, acc_end );
figure();
plot(timer, theta)
t_sim = max(timer) +5 ;