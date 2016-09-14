%{
w1 = [
    1 1 1 1 1 1 1 1 1 1 1 1 1 1
    2 8 7 6 7 5 4 4 -1 1 3 5 2 7
    7 1 5 3 8 9 5  2 -1  3 -2 3.25 4 1];
  %}  
w= [
    2 8 7 6 7 5 4 4 -1 1 3 5 2 7
    7 1 5 3 8 9 5  2 -1  3 -2 3.25 4 1];
t1 = [1 1 1 1 1 1 1 0 0 0 0 0 0 0];


plotpv(w, t1);
w0 = -7;
 a = [ 0.77 0.77];
 %plotpc(a, w0);

%{ 
 [a,w0] = sample_perceptron(w, w0, t1);

plotpc(a, w0);

 

 %single margin

 b = 0;
 w2 = -7;
 [a2, w2] = single_margin(w,w2, b , t1);
 plotpc(a2, w2);
%}

 % single sample relaxation with margin

%{
b = 0.1;
w01 = -1;
a1 = [0.77 0.77];
[a1, w01 ] = relaxation_margin(w, w01, b, t1);
plotpc(a1, w01);

 

% batch relaxation with margin

%correct cclassification but -ve factor;

b3 = 0.8;
w3 = -1;
lr = 0.001;
a = [0.7 0.7]; 
[a3, w3] = batch_relaxation(w, w3, b3, t1, lr ,a);
plotpc(a3, w3);
%}

%lms

theta = 0;
lr = 0.0001;
w4 = -6;
b4 = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1  0.1 0.1 0.1 0.1 0.1 ];
%b4 = [1 1 1 1 1 1 1 1 1 1 1 1 1 1];
a4 = [0.7 0.7];
[a4, w4] = lms_hoff(w, w4, b4, t1, a4, lr, theta);
plotpc(a4, w4);



