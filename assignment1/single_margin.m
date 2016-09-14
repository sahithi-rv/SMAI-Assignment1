function [a,w0] = single_margin( w , w0, b, t )
tic,
a = [0.77, 0.77];
n=14;
cnt = 0;
lr = 1;
while(cnt<10000)
    
    c=0;
    for k = 1:n
        
        if( misclassified( w(:,k), a, w0,b, t(k) ) )
            c= c+1;
            a = a + lr*w(:,k)';
           % disp(w1(:,k) );
            w0 = w0 - 20;
        end  
        
    end
    disp(c);
    if( c == 0)
        break;
    end
    cnt = cnt + 1;
end
toc,
end