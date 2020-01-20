function [w, iterations, err] = PerceptronTrainingRule(x, y, eta, error, iteration)

[r, c]=size(x);
w=rand(1,c+1);
err=error;
iterations=0;

while err >= error &&  iterations <=iteration
 iterations=iterations+1;
 err1=0;
 for i=1:r,
     if w(1, 1)+w(1, 2)*([x(i,:),1] + power([x(i,:),1],2)) + w(1, 3)*([x(i,:),2] + power([x(i,:),2],2))<0, out=-1; else out=1; end
	 
	 %w = w(1,1);
	 
	 %for j=1:i
     %w = w + w(1, j+1)*([x(i,:),j] + power([x(i,:),j],j+1)) 
	 
%     if sum(w .* [x(i,:),1])<0, out=-1; else out=1; end
     dw=eta*(y(i)-out)*[x(i,:),1];
     w=w+dw;
 end 
for i=1:r,
    if y(i)*(w(1, 1)+w(1, 2)*([x(i,:),1] + power([x(i,:),1],2)) + w(1, 3)*([x(i,:),2] + power([x(i,:),2],2)))<0, err1=err1+1; end
%     if y(i)*(sum(w .* [x(i,:),1])) < 0, wrong=wrong+1; end
end
err=err1/r;
end