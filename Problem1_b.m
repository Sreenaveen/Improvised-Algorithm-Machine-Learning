%Generating Random Number Pair
num1 = randi([-10,10],100,1);
num2 = randi([-10,10],100,1);

 
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
 
data =randompair; 
class = classtrain';
eta = 0.02;
%% iterations = 5
iterations = 5 ;
[w, out, e] = DeltaRule_Training_Batch(data, class, eta, iterations);
figure
plot_2D(data, out,'g','r')
title('5 Iterations')
xlabel('X1')
ylabel('X2')

%% iterations = 10
iterations = 10 ;
[w, out, e] = DeltaRule_Training_Batch(data, class, eta, iterations);
figure
plot_2D(data, out, 'g', 'r')
title('10 Iterations')
xlabel('X1')
ylabel('X2')

%% iterations = 50
iterations = 50 ;
[w, out, e] = DeltaRule_Training_Batch(data, class, eta, iterations);
figure
plot_2D(data, out, 'g', 'r')
title('50 Iterations')
xlabel('X1')
ylabel('X2')
%% iterations = 100
iterations = 100 ;
[w, out, e] = DeltaRule_Training_Batch(data, class, eta, iterations);
figure
plot_2D(data, out, 'g', 'r')
title('100 Iterations')
xlabel('X1')
ylabel('X2')
