%Binomial Distribution
function BinomialD()


% When n=30 and p=0.6
SampleNumber=1000; 
n=30;
p=0.6;

prob=zeros(1,n);
prob_Sum=zeros(1,n);

% Analytical Results
for k=0:n;
    prob(k+1)=nchoosek(n,k)*p^k * (1-p)^(n-k);
    prob_Sum(k+1)=sum(prob(1:k+1));
end 

Xvalue=0:n;

% Simulation Results
Sample=zeros(SampleNumber,1);  A=rand(SampleNumber,1); 

for i=1:SampleNumber;
    for j=1:n; 
        if A(i) < prob_Sum(j);
            Sample(i)=Xvalue(j);
            break;
        end   
    end 
end

% Draw probablity mass function
pmf=zeros(n,1);
for i=1:n;
    for j=1:SampleNumber;
        if Sample(j)== Xvalue(i);
           pmf(i)=pmf(i)+1;
        end
    end
end
pmf= pmf ./SampleNumber; 


% Plot Probability mass function 
plot(pmf, '--black','linewidth',2.5);  
hold on;
plot(prob,'-<blue','linewidth',2.5);  


% When  n=60 and p=0.5
SampleNumber=1000; 
n=60;
p=0.5;

prob=zeros(1,n);
prob_Sum=zeros(1,n);

% Analytical Results
for k=0:n;
    prob(k+1)=nchoosek(n,k)*p^k * (1-p)^(n-k);
    prob_Sum(k+1)=sum(prob(1:k+1));
end 

Xvalue=0:n;

% Simulation Results
Sample=zeros(SampleNumber,1);  A=rand(SampleNumber,1); 
for i=1:SampleNumber;
    for j=1:n;
        if A(i) < prob_Sum(j);
            Sample(i)=Xvalue(j);
            break;
        end   
    end 
end

% Draw probablity mass function
pmf=zeros(n,1);
for i=1:n;
    for j=1:SampleNumber;
        if Sample(j)== Xvalue(i);
           pmf(i)=pmf(i)+1;
        end
    end
end
pmf= pmf ./SampleNumber; 


%Plot Probability mass function 
plot(pmf, '-g', 'linewidth',2.5); 
hold on;
plot(prob,'--^red','linewidth',2.5);  


%Labeling
xlabel('Random Variable'); ylabel('Probability Mass Function'); 
legend('Simulations n=30, p=0.6','Analytical  n=30, p=0.6','Simulations n=60, p=0.5','Analytical  n=60, p=0.5');
title('Probability Mass Function for Binomial Distribution');

