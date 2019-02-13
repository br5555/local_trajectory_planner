function [theta_x,theta_y , timer, p_x, p_y, vel_x, vel_y, acc_x, acc_y] = calculate_path_for_points(points)

theta_x = [0.0];
theta_y = [0.0];
p_x = [0.0];
p_y = [0.0];
vel_x = [0.0];
vel_y = [0.0];
acc_x = [0.0];
acc_y = [0.0];
timer = [0.0];
if(size(points,1) < 2)
    return;
end
jerk_max = 5;
jerk_min = -5;
acc_max = 5.0; 
acc_min = -5.0;
vel_max  = 10;
vel_min = -10;
vel_start = 0; 
vel_end = 0;
p_start  =0;
p_end = 10.3;
acc_start =0 ;
acc_end = 0;
sign = 1;
for i = 2:size(points,1)
    for j = 1:2
        p_start = points(i-1, j);
        p_end = points(i, j);
        if(p_end < p_start)
            sign = -1;
            p_start = points(i, j);
            p_end = points(i-1, j);
        else
            sign = 1;
        end
        
        if (p_start == p_end)
            continue;
        end
        
        [theta_2_points, timer_2_points, p_2, vel_2, acc_2] = calculate_theta(jerk_max, jerk_min, acc_max, acc_min,vel_max,vel_min, vel_start, vel_end ,p_start , p_end , acc_start, acc_end );
       if(j == 1)
           
             
            theta_x = [theta_x, theta_x(end) + sign*theta_2_points];
            theta_y = [theta_y,theta_y(end)+ 0*theta_2_points];
            p_x = [p_x,p_x(end)+ sign*p_2];
            p_y = [p_y,p_y(end)+ 0*p_2];
            vel_x = [vel_x,vel_x(end)+ sign*vel_2];
            vel_y = [vel_y,vel_y(end)+ 0*vel_2];
            acc_x = [acc_x,acc_x(end)+ sign*acc_2];
            acc_y = [acc_y,acc_y(end)+ 0*acc_2];
            if(isempty(timer))
                timer = [timer,timer_2_points]
            else
                timer = [timer,timer(end) + timer_2_points]
            end
       else
           theta_x = [theta_x,theta_x(end)+ 0*theta_2_points];
            theta_y = [theta_y, theta_y(end)+sign*theta_2_points];
            p_x = [p_x,p_x(end)+ 0*p_2];
            p_y = [p_y, p_y(end)+sign*p_2];
            vel_x = [vel_x,vel_x(end)+ 0*vel_2];
            vel_y = [vel_y,vel_y(end)+ sign*vel_2];
            acc_x = [acc_x,acc_x(end)+ 0*acc_2];
            acc_y = [acc_y,acc_y(end)+ sign*acc_2];
            if(isempty(timer))
                timer = [timer,timer_2_points]
            else
                timer = [timer,timer(end) + timer_2_points]
            end
       end
    end
end

end