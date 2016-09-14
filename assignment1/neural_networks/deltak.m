function dk = deltak(k, netk)
    global t;
    global z;
    global m;
    dk = (t(k,m) - z(k,:))* sigmoid_derivative(netk);
    
end