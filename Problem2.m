%u-genrates the random value for 70 rows with values(0,1)
%data(i,3)- class or target value variable
%Initial learning rate is considered as 0.02
%Adaptive function is called for the problem b
%Decay function is called for the problem a

data = zeros(70,3);

%genrates the random values for dataset
u=rand(1,70);
x=(2*u-1)';
y=sin(pi*x);
data=[x, y];

%the size of the data is assigned
[m,n] = size(data) ;


index1 = randperm(m)  ;
training_index = (index1<=40);

for i = 1:70
    class = data(i,1) + 2*data(i,2) - 2;
    
    %assigns value to class variable
    if(class>0)      
        data(i,3) = 1;
        
    else
        data(i,3) = -1;     
    end
    
end

traindata = data(training_index,:);

[weight, output, e, eta_out] = Decay(traindata, traindata(:,3),0.02, 70);

%plots the value of decaying learning rate and error
plot(eta_out);
%plot(e);


[weight1, output1, e1, eta_out1] = Adaptive(traindata, traindata(:,3), 0.02, 50); 
%plots the value of variable learning rate and error
%plot(eta_out1);
%plot(e1);
