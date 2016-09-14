function dj = deltaj(j, netj)
    global wkj;
    global y;
  
    [r, c] = size(wkj);
    sum = 0;
    for k = 1:r
        netk = net(wkj, y, k);
        sum = sum + wkj(k,j)*deltak(k, netk);
    end
    
    dj = sum* sigmoid_derivative(netj);
    

end