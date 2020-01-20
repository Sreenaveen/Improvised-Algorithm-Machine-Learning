%Generating Random Number Pair
num1 = randi([-30,30],100,1);
num2 = randi([-30,30],100,1);

 
randompair = zeros(100,2);
classtrain = zeros(1,100);

%-------------------------------------------
%Classifying the Generated Data
for k = 1:100
    randompair(k,1) = num1(k,1);
    randompair(k,2) = num2(k,1);
    class = num1(k,1) + 2*num2(k,1) - 2;
 
    if(class>0)
        classtrain(1,k) = 1;
       
        
    else
        classtrain(1,k) = -1;
        
         
    end
    
end
 
%-----------------------------------
%Delta Training Rule
data =randompair; 
class = classtrain';

%-------------------------------------------
%learning rate is 0.001
eta = 0.001;
iterations = 100 ;
[w, out , e] = DeltaRule_Training_Batch(data, class, eta, iterations);

%Graph Plot
figure;
plot(e)
title('Error Function E with eta=0.01')
xlabel('Iteration')
ylabel('Error Value')

%-------------------------------------------
%learning rate is 0.05
eta = 0.05;
iterations = 100 ;
[w, out , e] = DeltaRule_Training_Batch(data, class, eta, iterations);

figure;
plot(e)
title('Error Function E with eta=0.05')
xlabel('Iteration')
ylabel('Error Value')

%-------------------------------------------
%learning rate is 0.1
eta = 0.1;
iterations = 100 ;
[w, out , e] = DeltaRule_Training_Batch(data, class, eta, iterations);

figure;
plot(e)
title('Error Function E with eta=0.1')
xlabel('Iteration')
ylabel('Error Value')

%-------------------------------------------
%learning rate is 0.5
eta = 0.5;
iterations = 100 ;
[w, out , e] = DeltaRule_Training_Batch(data, class, eta, iterations);

figure;
plot(e)
title('Error Function E with eta=0.5')
xlabel('Iteration')
ylabel('Error Value')

%-------------------------------------------
%learning rate is 0.9
eta = 0.9;
iterations = 100 ;
[w, out , e] = DeltaRule_Training_Batch(data, class, eta, iterations);

figure;
plot(e)
title('Error Function E with eta=0.9')
xlabel('Iteration')
ylabel('Error Value')