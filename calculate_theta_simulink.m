function [theta, timer] = calculate_theta_simulink(jerk_max, jerk_min, acc_max, acc_min,vel_max,vel_min, vel_start, vel_end, p_start , p_end , acc_start, acc_end )
    [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
    times = [t1, t2, t3, t4, t5, t6, t7];
    if(sum(times < 0) > 0 || any(imag(times)) )
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_2(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0)
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_3(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0 || any(imag(times)))
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_4(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
     times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0 || any(imag(times))) 
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_5(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0 || any(imag(times))) 
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_6(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    theta = 0.0;
    timer = 0.0;
    if(sum(times < 0) > 0 || any(imag(times))) 
        return;
    end
    p = [];
    vel = [];
    acc = [];
    
    
%     t2 = 0;
%     t3 = 0;
%     t4 = 0;
%     t5 = 0;
  a7 = acc_start, a6 = acc_start,a5 = acc_start, a4 = acc_start,a3 = acc_start, a2 = acc_start,a1 = acc_start;
            v7 = vel_start, v6 = vel_start,v5 = vel_start, v4 = vel_start,v3 = vel_start, v2 = vel_start, v1 = vel_start;
            p7 = p_start, p6 = p_start,p5 = p_start, p4 = p_start,p3 = p_start, p2 = p_start, p1 = p_start;  
    for t = 0:0.1:(t1 + t2 + t3 + t4 + t5 + t6 + t7)

        if(t <= t1)
            a1 = calculate_acc_segment(t , acc_start, jerk_max);
            acc = [acc, a1];
            v1 = calculate_vel_segment(t , acc_start, jerk_max, vel_start);
            vel = [vel, v1];
            p1 = calculate_p_segment(t , acc_start, jerk_max, vel_start, p_start);
            p = [p, p1];
            a7 = a1, a6 = a1,a5 = a1, a4 = a1,a3 = a1, a2 = a1;
            v7 = v1, v6 = v1,v5 = v1, v4 = v1,v3 = v1, v2 = v1;
            p7 = p1, p6 = p1,p5 = p1, p4 = p1,p3 = p1, p2 = p1;
        elseif( t -t1 <= t2 )
%             if(t1 < 1e-6)
%                 a1 = acc_start;
%                 v1 = vel_start;
%                 p1 = p_start;
%             end
            a2 = calculate_acc_segment(t -t1, a1, 0 );
            acc = [acc, a2];
            v2 = calculate_vel_segment(t -t1, a1, 0 , v1);
            vel = [vel, v2];
            p2 = calculate_p_segment(t-t1 , a1, 0 , v1, p1);
            p = [p, p2];
            a7 = a2, a6 = a2,a5 = a2, a4 = a2,a3 = a2;
            v7 = v2, v6 = v2,v5 = v2, v4 = v2,v3 = v2;
            p7 = p2, p6 = p2,p5 = p2, p4 = p2,p3 = p2;
        elseif( t -t1 - t2  <= t3 )
%             if(t2 < 1e-6)
%                 a2 = a1;
%                 v2 = v1;
%                 p2 = p1;
%             end
            a3 = calculate_acc_segment(t -t1 - t2, a2, jerk_min );
            acc = [acc, a3];
            v3 = calculate_vel_segment(t -t1 - t2, a2, jerk_min, v2 );
            vel = [vel, v3];
            p3 = calculate_p_segment(t-t1 - t2 , a2, jerk_min, v2 , p2);
            p = [p, p3];
            a7 = a3, a6 = a3,a5 = a3, a4 = a3;
            v7 = v3, v6 = v3,v5 = v3, v4 = v3;
            p7 = p3, p6 = p3,p5 = p3, p4 = p3;
        elseif( t -t1 - t2  - t3 <= t4 )
%             if(t3 < 1e-6)
%                 a3 = a2;
%                 v3 = v2;
%                 p3 = p2;
%             end
            a4 = calculate_acc_segment(t-t1 - t2  - t3  , a3, 0 );
            acc = [acc, a4];
            v4 = calculate_vel_segment(t -t1 - t2  - t3 , a3, 0 , v3);
            vel = [vel, v4];
            p4 = calculate_p_segment(t -t1 - t2  - t3 , a3, 0 , v3, p3);
            p = [p, p4];
            a7 = a4, a6 = a4,a5 = a4;
            v7 = v4, v6 = v4,v5 = v4;
            p7 = p4, p6 = p4,p5 = p4;
        elseif( t -t1 - t2  - t3 - t4 <= t5 )
%             if(t4 < 1e-6)
%                 a4 = a3;
%                 v4 = v3;
%                 p4 = p3;
%             end
            a5 = calculate_acc_segment(t-t1 - t2  - t3 - t4 , a4, jerk_min );
            acc = [acc, a5];
            v5 = calculate_vel_segment(t-t1 - t2  - t3 - t4 , a4, jerk_min , v4);
            vel = [vel, v5];
            p5 = calculate_p_segment(t-t1 - t2  - t3 - t4 , a4, jerk_min , v4, p4);
            p = [p, p5];
            a7 = a5, a6 = a5;
            v7 = v5, v6 = v5;
            p7 = p5, p6 = p5;
        elseif( t -t1 - t2  - t3 - t4  - t5 <= t6 )
%             if(t5 < 1e-6)
%                 a5 = a4;
%                 v5 = v4;
%                 p5 = p4;
%             end
            a6 = calculate_acc_segment(t -t1 - t2  - t3 - t4  - t5, a5, 0 );
            acc = [acc, a6];
            v6 = calculate_vel_segment(t -t1 - t2  - t3 - t4  - t5, a5, 0 , v5);
            vel = [vel, v6];
            p6 = calculate_p_segment(t-t1 - t2  - t3 - t4  - t5 , a5, 0 , v5, p5);
            p = [p, p6];
            a7 = a6;
            v7 = v6;
            p7 = p6;
        elseif( t -t1 - t2  - t3 - t4  - t5 - t6<= t7 )
%             if(t6 < 1e-6)
%                 a6 = a5;
%                 v6 = v5;
%                 p6 = p5;
%             end
            a7 = calculate_acc_segment(t -t1 - t2  - t3 - t4  - t5 - t6, a6, jerk_max );
            acc = [acc, a7];
            v7 = calculate_vel_segment(t-t1 - t2  - t3 - t4  - t5 - t6 , a6, jerk_max , v6);
            vel = [vel, v7];
            p7 = calculate_p_segment(t -t1 - t2  - t3 - t4  - t5 - t6, a6, jerk_max , v6, p6);
            p = [p, p7];
        end
    end

%     figure();
%     plot(0:0.001:(t1 + t2 + t3 + t4 + t5 + t6 + t7), p, 'LineWidth', 3); title('position')
%     figure();
%     plot(0:0.001:(t1 + t2 + t3 + t4 + t5 + t6 + t7), vel, 'LineWidth', 3); title('velocity')
%     figure();
%     plot(0:0.001:(t1 + t2 + t3 + t4 + t5 + t6 + t7), acc, 'LineWidth', 3); title('acceleration')
%     figure();
%     plot(0:0.001:(t1 + t2 + t3 + t4 + t5 + t6 + t7), (acc/10.72)*(180/pi), 'LineWidth', 3); title('theta')


    theta_ = (acc/9.78);
    theta = theta_(2);
%     timer = 0:0.001:(t1 + t2 + t3 + t4 + t5 + t6 + t7);


end