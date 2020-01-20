%Generate Random Data Pair
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
eta = 0.4;
iterations = 100 ;

%% Batch
tic
    [w, out, e,counter] = DeltaRule_Training_Batch(data, class, eta, iterations);
     disp('Weight updates for batch:');
    disp(counter);

toc;

%% Incremental
tic
    [w_d, out, e_d,counter] = DeltaRule_Training_Incremental(data, class, eta, iterations);
     disp('Weight updates for Incremental:');
    disp(counter);

toc;
