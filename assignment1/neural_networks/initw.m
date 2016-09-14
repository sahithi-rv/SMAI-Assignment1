function w = initw(inp , out)
    
w = [];
for k = 1:out
    tmp = [];
    for j = 1:inp
     % tmp = [tmp, -1/sqrt(inp) ];
     r = -1 + (1 +1).*rand(1,1);
     tmp = [tmp, r ];
    end
    w = [w; tmp]; 
end
end