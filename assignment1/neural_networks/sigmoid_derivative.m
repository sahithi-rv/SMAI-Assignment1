function val = sigmoid_derivative(p) 
    
    val = sigmoid(p)*(1 - sigmoid(p));
end