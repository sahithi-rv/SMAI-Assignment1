global x;
% 0 0 7 5 5 0 7 0 7
% 1 2 3 7 8 9 11 16 18
%tmp = csvread('/home/sahithi_rvs/sem5/smai/digits data set/training_data.txt');
[class0, class1, class7, tgt0, tgt1, tgt7] = readData();
x = class7';
disp(size(x));
global wkj ;
global wji ;
global t;
global z;
global y;
global eta;
global d;
global c;
global nh;
global inp_x;
eta = 0.001;

d = 64;
c = 2;
nh = 6;
[inp_x, lol] = size(x);
%set t
% numbers chosen -> 0, 5, 7
% class 1 -> 0, 0; class 2-> 0,1 ; class 3-> 1, 0
%{
t = [
    0 0 1 0 0 0 1 0 1
    0 0 0 1 1 0 0 0 0
    ];
%}
%t = initt();
t = tgt7;
disp(size(t) );
global m;
wkj = initw(nh , c);
wji = initw(d ,nh);
m = 0;
%stochastic training
theta = 0;
cnt = 0;

while(cnt <1000)
    cnt = cnt + 1;
   %m = 1 + (lol - 1).*randi(1,1);
   m = mod(m+1, lol)+1; 
   %disp(m);
    
    [y] = feedforward( x(:,m), wji, nh);
    
    [z] = feedforward( y, wkj, c);
   
    [wkj, bl] = backpropagation(wkj, 1, y, theta);
    
   % if(bl == 0)
   %     break;
   % end
    %disp(wkj);
    [wji, bl] = backpropagation(wji, 0, x(:,m), theta);
    %disp(z);
end

%testing
%{
cnt = 0;
for i = 1:lol
    [y] = feedforward( x(:,i), wji, nh);
    
    [z] = feedforward( y, wkj, c);
    if( z(1,1) >0.5)
        z(1,1) = 1;
    else
        z(1,1) = 0;
    end
     if( z(2,1) >0.5)
        z(2,1) = 1;
    else
        z(2,1) = 0;
     end
    disp(z);
    disp(t(:,i) );
    if( isequal(z, t(:,i)) )
        cnt = cnt + 1;
    end
end
disp(cnt);
%}


