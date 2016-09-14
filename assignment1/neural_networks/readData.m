function[class0, class1, class7, tgt0, tgt1, tgt7] =  readData()
    a = csvread('/home/sahithi_rvs/sem5/smai/assignment1/neural_networks/output.txt');
    [r c] = size(a);
    tgt0=[];tgt1=[];tgt7=[];
    class0=[];class1=[];class7=[];
    for i= 1:r
        if(a(i,65) == 0)
            tmp = [
                0
                0];
            tgt0 = [tgt0 , tmp];
            class0 = [class0 ; a(i,1:64) ];
        elseif(a(i,65) == 1)
            tmp = [0
                1];
            tgt1 = [tgt1, tmp];
             class1 = [class1 ; a(i,1:64) ];
        else
            tmp = [
                1
                0];
            tgt7 = [tgt7, tmp];
             class7 = [class7 ; a(i,1:64) ];
        end
    end

end
