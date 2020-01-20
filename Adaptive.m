function [weight1, output1, e,eta_out1]=Adaptive(data, class, eta, iterations)

%% Invoke as: [weight1, output1, e,eta_out1] = Adaptive(Data, class, eta, iterations)
%% implements the delta  rule;
%% Input:
%%  Data is a matrix N x P data points/vectors
%%  Class is vector N x 1 of target values (true output) corresponding to the data points
%%  eta: learning rate;
%%  iterations: threshold on the number of iterations (iterations through the whole data set)
%% Output:
%%  weight1 is a vector of dimension P+1 x 1, where w_i is the weight for dimension i of a data point,
%%  e: desired approximation error; 
%%  output1: calculates the output based on the delta rule
%%  eta_out1 : number of learning rates seen at each iterations 

[row1, col1] = size(data);
[row2, ~] = size(class);
rand_weight1 = rand(1, col1+1);
delta_w = rand_weight1';
t=0.05;
weight1=zeros(col1+1,1);
d=0.90;
d1=1.1;
if row1 ~= row2
    error('Number of target class is not equal to number of dataset points');
else
    for j = 1: iterations
        weight1 = delta_w;
        for i = 1 : row1
           
            if weight1(1, 1)+data(i,1)*weight1(2, 1)+data(i,2)*weight1(3, 1) <0 
                output1(i) = -1;
            else
                output1(i) = 1;
            end
            delta = class(i) - output1(i);
            
            %assigns the value of weights to a temporary variable temp
            temp1=delta_w(1,1);
            temp2=delta_w(2,1);
            temp3=delta_w(3,1);

            temp4=weight1(1,1);
            temp5=weight1(2,1);
            temp6=weight1(3,1);           
            
            delta_w(1,1) = delta_w(1,1)+eta*delta;
            delta_w(2,1) = delta_w(2,1)+data(i,1)*delta;
            delta_w(3,1) = delta_w(3,1)+data(i,2)*delta;

            weight1(1,1) = weight1(1,1) + delta_w(1,1);
            weight1(2,1) = weight1(2,1) + delta_w(2,1);
            weight1(3,1) = weight1(3,1) + delta_w(3,1);
            
             
            err(i) = (1/2)*(class(i)- output1(i))^2;
            
        end
        
        %learning rate can be seen for each iterations
        eta_out1(j,1)=eta;
        
        e(j)=sum(err)/row1;
        
        
        if(j>1)
            
            %cal
            x1= abs(e(j) - e(j-1));
            %if the new error is less than the previous error  
            if( e(j) < e(j-1))
                eta=eta*d1;
            else
                %if the new error is higher than previous error by
                %threshold value t
                if(x1>t)
                    eta=eta*d;
                    
                    %the values are discarded here and old values are
                    %chosen
                    delta_w(1,1)=temp1;
                    delta_w(2,1)=temp2;
                    delta_w(3,1)=temp3;

                    weight1(1,1)=temp4;
                    weight1(2,1)=temp5;
                    weight1(3,1)=temp6; 
                end
                    
            end    
        end
    end
end
end