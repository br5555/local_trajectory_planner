function [theta, timer, p, vel, acc] = calculate_theta(jerk_max, jerk_min, acc_max, acc_min,vel_max,vel_min, vel_start, vel_end, p_start , p_end , acc_start, acc_end )
    [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
    times = [t1, t2, t3, t4, t5, t6, t7];
    if(sum(times < 0) > 0)
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_2(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0)
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_3(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0)
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_4(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
     times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0) 
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_5(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    if(sum(times < 0) > 0) 
        [t1, t2, t3, t4, t5, t6, t7] = calculating_trajectory_case_6(jerk_max, jerk_min, acc_max, acc_min,vel_max, vel_min, vel_start, vel_end, p_start, p_end, acc_start, acc_end);
        times = [t1, t2, t3, t4, t5, t6, t7];
    end
    theta = [];
    timer = [];
    if(sum(times < 0) > 0) 
        return;
    end
    p = [];
    vel = [];
    acc = [];
    
    
    
    for t = 0:0.001 :(t1 + t2 + t3 + t4 + t5 + t6 + t7)

        if(t <= t1)
            a1 = calculate_acc_segment(t , acc_start, jerk_max);
            acc = [acc, a1];
            v1 = calculate_vel_segment(t , acc_start, jerk_max, vel_start);
            vel = [vel, v1];
            p1 = calculate_p_segment(t , acc_start, jerk_max, vel_start, p_start);
            p = [p, p1];
            
        elseif( t -t1 <= t2 )
            if(exist('a1') == 0)
                a1 = acc_start;
                v1 = vel_start;
                p1 = p_start;
            end
            a2 = calculate_acc_segment(t -t1, a1, 0 );
            acc = [acc, a2];
            v2 = calculate_vel_segment(t -t1, a1, 0 , v1);
            vel = [vel, v2];
            p2 = calculate_p_segment(t-t1 , a1, 0 , v1, p1);
            p = [p, p2];
        elseif( t -t1 - t2  <= t3 )
            if(exist('a2') == 0)
                a2 = a1;
                v2 = v1;
                p2 = p1;
            end
            a3 = calculate_acc_segment(t -t1 - t2, a2, jerk_min );
            acc = [acc, a3];
            v3 = calculate_vel_segment(t -t1 - t2, a2, jerk_min, v2 );
            vel = [vel, v3];
            p3 = calculate_p_segment(t-t1 - t2 , a2, jerk_min, v2 , p2);
            p = [p, p3];
        elseif( t -t1 - t2  - t3 <= t4 )
            if(exist('a3') == 0)
                a3 = a2;
                v3 = v2;
                p3 = p2;
            end
            a4 = calculate_acc_segment(t-t1 - t2  - t3  , a3, 0 );
            acc = [acc, a4];
            v4 = calculate_vel_segment(t -t1 - t2  - t3 , a3, 0 , v3);
            vel = [vel, v4];
            p4 = calculate_p_segment(t -t1 - t2  - t3 , a3, 0 , v3, p3);
            p = [p, p4];
        elseif( t -t1 - t2  - t3 - t4 <= t5 )
            if(exist('a4') == 0)
                a4 = a3;
                v4 = v3;
                p4 = p3;
            end
            a5 = calculate_acc_segment(t-t1 - t2  - t3 - t4 , a4, jerk_min );
            acc = [acc, a5];
            v5 = calculate_vel_segment(t-t1 - t2  - t3 - t4 , a4, jerk_min , v4);
            vel = [vel, v5];
            p5 = calculate_p_segment(t-t1 - t2  - t3 - t4 , a4, jerk_min , v4, p4);
            p = [p, p5];
        elseif( t -t1 - t2  - t3 - t4  - t5 <= t6 )
            if(exist('a5') == 0)
                a5 = a4;
                v5 = v4;
                p5 = p4;
            end
            a6 = calculate_acc_segment(t -t1 - t2  - t3 - t4  - t5, a5, 0 );
            acc = [acc, a6];
            v6 = calculate_vel_segment(t -t1 - t2  - t3 - t4  - t5, a5, 0 , v5);
            vel = [vel, v6];
            p6 = calculate_p_segment(t-t1 - t2  - t3 - t4  - t5 , a5, 0 , v5, p5);
            p = [p, p6];
        elseif( t -t1 - t2  - t3 - t4  - t5 - t6<= t7 )
            if(exist('a6') == 0)
                a6 = a5;
                v6 = v5;
                p6 = p5;
            end
            a7 = calculate_acc_segment(t -t1 - t2  - t3 - t4  - t5 - t6, a6, jerk_max );
            acc = [acc, a7];
            v7 = calculate_vel_segment(t-t1 - t2  - t3 - t4  - t5 - t6 , a6, jerk_max , v6);
            vel = [vel, v7];
            p7 = calculate_p_segment(t -t1 - t2  - t3 - t4  - t5 - t6, a6, jerk_max , v6, p6);
            p = [p, p7];
        end
    end

%     figure();
%     plot(linspace(0, (t1 + t2 + t3 + t4 + t5 + t6 + t7), length(p)), p, 'LineWidth', 3); title('position'); xlabel('Time [s]'); ylabel('Position [m]')
%     figure();
%     plot(linspace(0, (t1 + t2 + t3 + t4 + t5 + t6 + t7), length(p)), vel, 'LineWidth', 3); title('velocity'); xlabel('Time [s]'); ylabel('Velocity [m/s]')
%     figure();
%     plot(linspace(0, (t1 + t2 + t3 + t4 + t5 + t6 + t7), length(p)), acc, 'LineWidth', 3); title('acceleration'); xlabel('Time [s]'); ylabel('Acceleration [m]')
%     figure();
%     plot(linspace(0, (t1 + t2 + t3 + t4 + t5 + t6 + t7), length(p)), (acc/10.72)*(180/pi), 'LineWidth', 3); title('theta'); xlabel('Time [s]'); ylabel('Angle [°]')
% 

    theta = (acc/9.78);

    timer = linspace(0, (t1 + t2 + t3 + t4 + t5 + t6 + t7), length(p));


end