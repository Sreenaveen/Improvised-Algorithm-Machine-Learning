function [w, out, e,counter]=DeltaRule_Training_Batch(data, class, eta, iterations)

[row_q1, col_q1] = size(data);
[row_class, ~] = size(class);
rand_w = rand(1, col_q1+1);
delta_w = rand_w';
old_delta_w=zeros(3,1);
counter=0;

if row_q1 ~= row_class
    error('Number of data points are not equal to the number target Class');
else
    for j = 1: iterations
        w = delta_w;
        for i = 1 : row_q1
           
            if w(1, 1)+data(i,1)*w(2, 1)+data(i,2)*w(3, 1) <0 
                out(i) = -1;
            else
                out(i) = 1;
            end
            delta = class(i) - out(i);
            
            delta_w(1,1) = delta_w(1,1)+eta*delta;
            delta_w(2,1) = delta_w(2,1)+data(i,1)*delta;
            delta_w(3,1) = delta_w(3,1)+data(i,2)*delta;
%              
            err(i) = (1/2)*(class(i)- out(i))^2;
            if(old_delta_w ~= delta_w)
               old_delta_w=delta_w;
               counter=counter+1;
            end
 
        end
        e(j)=sum(err)/row_q1;
    end
     
end
 
end