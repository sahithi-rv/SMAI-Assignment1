function [a,w0] = relaxation_margin( w , w0, b, t )
tic,
    lr = 0.001;
    a = [0.77, 0.77];
    
    n=14;
    cnt = 0;
    while(cnt<1000)
    
        c=0;
        for k = 1:n
        
            if( misclassified( w(:,k), a, w0, b, t(k) ) )
                c= c+1;
                y = w(:,k);
                factor = lr * ( (b - a*y )*(b - a*y ) )/ (norm(y) * norm(y) );
               % disp(factor);
                a = a +  factor*y';
                % disp(w1(:,k) );
                w0 = w0 - 1;
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
