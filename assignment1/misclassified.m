function bl = misclassified( y, a, w0, b, c)
    
    bl = 0;
        G = a*y + w0;
        if( G > b)
            G = 1;
        elseif( G == b )
            G = -1;
        else
            G = 0;
        end
        if( G ~= c )
            bl = 1;
        end
    

end