Num_of_iter = 120;
input_data=gen_sigmoid_classes(Num_of_iter); 
eta = 0.001;
error = 0.006;
itr = 1000;
n = 70;
for i = 1: n
    tr_data(i,:) = input_data(i,:);
end
for i = n+1: Num_of_iter
    te_data(i,:) = input_data(i,:);
end
te_data(1:n, :) = []
[tr_weight, tr_itr, tr_err] = PerceptronTrainingRule(tr_data(:,[1, 2]), tr_data(:,[3]), eta, error, itr)

[te_weight, te_itr, te_err, te_accuracy] = TrainingGradientDescent(te_data(:,[1, 2]), te_data(:,[3]), eta, error, itr,tr_weight);