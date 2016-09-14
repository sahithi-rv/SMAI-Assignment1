function [a,b] = sample_perceptron( w1 , b, t1)
tic,
a = [0.77, 0.77];
n=14;
cnt = 0;
while(cnt<100000)
    
    c=0;
    for k = 1:n
        
        if( misclassified( w1(:,k), a, b,0, t1(k) ) )
            c= c+1;
            a = a + w1(:,k)';
           % disp(w1(:,k) );
            b = b - 25;
        end   
    end
    if( c == 0)
        break;
    end
    cnt = cnt + 1;
end
toc,
end