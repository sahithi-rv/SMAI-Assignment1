
function [a,b] = single_perceptron( w1 , b, t1)
    %init
    a = [0.77 0.77];
    %lr = 0.001;
    y_list = [];
    y_index = [];
     % misclassified y
      G = a*w1 + b;
    
      for i = 1: size(G,2)
        if( G(i) > 0)
            G(i) = 1;
        elseif( G(i) == 0 )
            G(i) = -1;
        else
            G(i) = 0;
        end
         if( G(i) ~= t1(i) )
            y_list = [y_list , w1(:,i) ];
            y_index = [y_index, t1(i) ];
        end
      end
    disp(y_list);      
    disp(y_index);
    disp('kl');
     %iteration
    
  
    c = 0; k = 0; n = 14;
    while(1)
      c = c + 1;
      [r ,n] = size(y_list);
      if( n == 0) 
          break;
      end
      
      k = mod(k+1,n) + 1;
      %train
      clear y;
      
      y = y_list(:,k);
      
      a = a + y'; 
      b= b-10;
      
      %if classified
      bl = (a*y + b);
        if( bl(1,1) > 0)
           bl(1,1) = 1;
        elseif( bl(1,1)== 0 )
            bl(1,1) = -1;
        else
            bl(1,1) = 0;
        end
        disp(bl(1,1));
         if( bl(1,1) == y_index(k) )
             y_list(:,k) = [];
             y_index(:,k) = [];
             n = n- 1;
         end
   
      disp(size(y_list) );
    end
    disp(b);
   
    disp(y_list);
    
    
    disp(c);
    
    
    
      
    
