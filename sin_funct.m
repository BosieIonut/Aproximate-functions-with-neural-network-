W = ones(5,1);
c = ones(5,1);
V = ones(5,1);
V2 = V;
b = 0;
epoch = 200000
alfa = 0.05;
forward(W,V,c,b,1);
X = 0:0.314:2*pi;
Y = sin(X);
n = length(X);
for j = 1:epoch

    for k=1:n
        x = X(k);
        y = Y(k);
        for i=1:5
            S = sigmoid(c(i)+W(i) * x);
            W(i) = W(i) - alfa * 2 * (forward(W,V,c,b,x)-y) * V(i)*x *... 
            (S-S*S);
        end

        for i=1:5
            V(i) = V(i) - alfa * 2 * (forward(W,V,c,b,x)-y) * sigmoid(c(i) + W(i) * x);
        end
     
        b = b - alfa * 2 * (forward(W,V,c,b,x) -y );

        for i=1:5
        S = sigmoid(c(i)+W(i) * x);
        c(i) = c(i) - alfa * 2 * (forward(W,V,c,b,x)-y) * V(i) * (S-S*S);
        end
       if k == 1 && j == 1
           W
        end
    end
    if( mod(j,1000) < 0.001)
        j
    end
end
rasp = forward(W,V,c,b,X);
%plot(X(1:int64(n/2)),rasp(1:int64(n/2)));
plot(X,rasp);
hold on;
plot(X,Y);