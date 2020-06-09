clear all


figure; hold on
axis([0,12,0,12])
x=[1,1,11,11,1];
y=[1,11,11,1,1];
l1=line(x,y);

sample_points_x = -100*ones(1,5000);
sample_points_y = -100*ones(1,5000);

sample_points_x(1) = 6;
sample_points_y(1) = 6;

for i=2:5000
    x_sample = 1+10*rand();
    y_sample = 1+10*rand();
    d=100*ones(1,5000);
    
    for j=1:5000
        d(j) = euclidean([sample_points_x(j), sample_points_y(j)], [x_sample, y_sample]);
    end
    

    
    [val, idx] = min(d);
    x_from = sample_points_x(idx);
    y_from = sample_points_y(idx);
    
    mag = val;
   
    x_dir = (x_sample - x_from)/mag;
    y_dir = (y_sample - y_from)/mag;
    
    point_a = [x_from, x_from+0.15*x_dir];
    point_b = [y_from, y_from+0.15*y_dir];
    
    sample_points_x(i) = point_a(2);
    sample_points_y(i) = point_b(2);
    
    line(point_a, point_b)

    pause(0.1);
    
    
    
end

function dist = euclidean(a,b)
    value = (a(1)-b(1))^2 + (a(2)-b(2))^2;
    dist = sqrt(value);
end