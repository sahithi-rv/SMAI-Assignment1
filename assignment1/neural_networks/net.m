function net_value = net(w, inp, k)

    [r,c] = size(w);
    net_value = 0;
    for j=1:c
        net_value = net_value + w(k,j)*inp(j,:);
    end

end