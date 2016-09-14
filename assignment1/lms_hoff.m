function [a, w0] = lms_hoff(w, w0, b, t, a, lr, theta)
tic,
    n = 14;
    factor = 100000000;
    while(1)
        
        c=0;
        for k = 1:n
           
            y = w(:,k);
            if(misclassified(y ,a , w0, b(:,k), t(:,k) ) )
                factor = lr* (b(:,k) - a*y) ;
                a = a + factor*y';
                 c = c + 1;
            end
            if(factor < theta) 
                disp(factor);
                c=0;
                break;
            end
        end
        disp(c);
        if( c==0) 
            break;
        end
    end
    toc,
