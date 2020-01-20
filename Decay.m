function [weight, output, e,eta_out]=Decay(data, class, eta, iterations)

%% Invoke as: [weight, output, e,eta_out] = Adaptive(Data, class, eta, iterations)
%% implements the delta  rule;
%% Input:
%%  Data is a matrix N x P data points/vectors
%%  Class is vector N x 1 of target values (true output) corresponding to the data points
%%  eta: learning rate;
%%  iterations: threshold on the number of iterations (iterations through the whole data set)
%% Output:
%%  weight is a vector of dimension P+1 x 1, where w_i is the weight for dimension i of a data point,
%%  e: desired approximation error; 
%%  output: calculates the output based on the delta rule
%%  eta_out : number of learning rates seen at each iterations


[row1, col1] = size(data);
[row2, ~] = size(class);
weight=zeros(col1+1,1);
rand_weight = rand(1, col1+1);
delta_w = rand_weight';
if row1 ~= row2
    error('Number of target class is not equal to number of dataset points');
else
    for j = 1: iterations
        weight = delta_w;
        for i = 1 : row1
           
            if weight(1, 1)+data(i,1)*weight(2, 1)+data(i,2)*weight(3, 1) <0 
                output(i) = -1;
            else
                output(i) = 1;
            end
            delta = class(i) - output(i);
            
            delta_w(1,1) = delta_w(1,1)+eta*delta;
            delta_w(2,1) = delta_w(2,1)+data(i,1)*delta;
            delta_w(3,1) = delta_w(3,1)+data(i,2)*delta;

            weight(1,1) = weight(1,1) + delta_w(1,1);
            weight(2,1) = weight(2,1) + delta_w(2,1);
            weight(3,1) = weight(3,1) + delta_w(3,1);
             
            err(i) = (1/2)*(class(i)- output(i))^2;
            
        end

        %decaying learning rates are calculated here
        eta_out(j,1)=eta;
        eta= eta*0.90;
        
        e(j)=sum(err)/row1;
    end
end
end