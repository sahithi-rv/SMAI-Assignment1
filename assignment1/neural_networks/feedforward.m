function [out]  = feedforward( inp , w, out_sz )
    out = [];
    
    for k = 1:out_sz
        netk = net(w,inp, k);
        out = [out; sigmoid(netk)];
       
    end
   
    
end