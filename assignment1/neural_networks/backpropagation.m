function [w, bl] = backpropagation(w, kj, inp, theta)


    global eta;
    bl = 1;
    %hidden to output
    [r, c] = size(w);
    if( kj == 1)
        for k = 1:r
            netk = net(w, inp, k);
            for j = 1:c
                cond = deltak(k, netk)*inp(j,:) ;
                %disp(deltak(k, netk) );
                if( cond < theta)
                    bl = 0;
                end
               
                w(k,j) = w(k,j) + eta*cond;
            end
        end
    else
        for j = 1:r
            netj = net(w, inp, j);
            for i = 1:c
                cond = deltaj(j, netj)*inp(j,:);
               % if( cond < theta)
               %     bl = 0;
               % end
                w(j,i) = w(j,i) + eta*cond;
            end
        end
    end

end