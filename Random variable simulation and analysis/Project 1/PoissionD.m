%Poisson Distribution 
function PoissionD()


% When Lamda=3  
SampleNumber=1000; 
n=21; 
lamda=3; 

prob=zeros(1,n);
probSum=zeros(1,n);

% Analytical Result
for k=1:n;
    prob(k)= exp(-lamda) * lamda^k / factorial(k);
    probSum(k)=sum(prob(1:k));
end 

XValue=0:n;

% Simulation Result
sample=zeros(SampleNumber,1);  A=rand(SampleNumber,1);
for i=1:SampleNumber;
    for j=1:n; 
        if A(i) < probSum(j);
            sample(i)=XValue(j);
            break;
        end   
    end 
end

% Draw probablity mass function
pmf=zeros(n,1);
for i=1:n;
    for j=1:SampleNumber;
        if sample(j)== XValue(i);
           pmf(i)=pmf(i)+1;
        end
    end
end
pmf= pmf ./SampleNumber; 


%Plot Probability mass function 
plot(pmf, '-black','linewidth',2.5); 
hold on;
plot(prob,'--r','linewidth',2.5);  


% When Lamda=10
SampleNumber=1000;            
n=21;
lamda=10;  

prob=zeros(1,n);
probSum=zeros(1,n);

% Analytical Result
for k=1:n;
    prob(k)= exp(-lamda) * lamda^k / factorial(k);
    probSum(k)=sum(prob(1:k));
end 

XValue=0:n;

% Simulation Result
sample=zeros(SampleNumber,1);  A=rand(SampleNumber,1); 
for i=1:SampleNumber;
    for j=1:n; 
        if A(i) < probSum(j);
            sample(i)=XValue(j);
            break;
        end   
    end 
end

% Draw probablity mass function
pmf=zeros(n,1);
for i=1:n;
    for j=1:SampleNumber;
        if sample(j)== XValue(i);
           pmf(i)=pmf(i)+1;
        end
    end
end
pmf= pmf ./SampleNumber; 

%Plot Probability mass function 
plot(pmf, '-g', 'linewidth',2.5); 
hold on;
plot(prob,'--b','linewidth',2.5);  

%Labelling
xlabel('Random Variable'); ylabel('Probability Mass Function'); 
legend('Simulations lamda=3','Analytical lamda=3','Simulations lamda=10','Analytical lamda=10');
title('Probability Mass Function of Poission Distribution');

