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
eta = 0.5;
iterations = 100 ;
[w, out , e] = DeltaRule_Training_Batch(data, class, eta, iterations);

%Graph Plot
plot(e)
title('Error Function E')
xlabel('Iteration')
ylabel('Error Value')

