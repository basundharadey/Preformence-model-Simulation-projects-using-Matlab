%Exponential Distribution 
function ExponentialD()

% When Lamda=1.4
SampleNumber=1000;
n=15; 
lamda=1.4; 

prob=zeros(1,n);XValue=0:n;
% Analitycaly
for k=1:n;
    prob(k)= 1- exp(-lamda * XValue(k));
end 



% Simulation 
 U=rand(SampleNumber,1); 
 cdf=zeros(n,1);
 X=-log(1-U)./lamda; 
for i=1:n;
    for j=1:SampleNumber;
        if X(j)< XValue(i);
           cdf(i)=cdf(i)+1;
        end
    end
end
cdf= cdf ./SampleNumber; 

% Plot the cumulative distribution function
plot(cdf, '-r','linewidth',2.5); 
hold on;
plot(prob,'--black','linewidth',2.5);  

 
% When Lamda=2.8   

SampleNumber1=1000;
n1=15; 
lamda1=2.8;   

prob1=zeros(1,n1); XValue1=0:n;
% Analyticaly
for k1=1:n1;
    prob1(k1)= 1- exp(-lamda1*XValue1(k1));
end 



% Simulation 
 U1=rand(SampleNumber1,1); cdf1=zeros(n1,1);
 X1=-log(1-U1)./lamda1; 
for i=1:n1;
    for j=1:SampleNumber1;
        if X1(j)< XValue1(i);
           cdf1(i)=cdf1(i)+1;
        end
    end
end
cdf1= cdf1 ./SampleNumber1; 

%Plot Probability mass function 
plot(cdf1, '-g', 'linewidth',2.5); 
xlabel('Random Variable'); ylabel('Cumulative Distribution Function'); 
hold on;
plot(prob1,'--b','linewidth',2.5);  
legend('Simulations lambda=1.4','Analytical    lambda=2.8','Simulations lambda=1.4','Analytical    lambda=2.8');
title('Exponential Distribution');
