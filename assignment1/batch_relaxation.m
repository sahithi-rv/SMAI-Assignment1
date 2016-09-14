function [a,w0] = batch_relaxation( w , w0, b, t , lr, a)
tic,
   
    
    n=14;
    cnt = 0;
    while(cnt<10)
    
        c=0;
        y_sum = [
                0
                0
                ];
        for k = 1:n
        
            if( misclassified( w(:,k), a, w0, b, t(k) ) )
                c= c+1;
                y = w(:,k);
                factor =  ((b - a*y ) ) / (norm(y) * norm(y) );
                y_sum = y_sum + factor*y;
               
            end   
        end
         
          % disp(factor);
          a = a +  lr*y_sum';
                % disp(w1(:,k) );
          w0 = w0 - 1;
        if( c == 0)
            break;
        end
        cnt = cnt + 1;
    end
toc,
end
