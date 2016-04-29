%Geometric Distribution
function GeometricD()


% When  P=0.6
SampleNumber=1000; 
n=20; % suppose n to be 20
p=0.6;  

prob=zeros(1,n);
probSum=zeros(1,n);

% Analytical Results
for k=1:n;
    prob(k)= (1-p)^(k-1)* p ;
    probSum(k)=sum(prob(1:k));
end 

XValue=1:n;

%Simulation Results 
sample=zeros(SampleNumber,1);  A=rand(SampleNumber,1); 
for i=1:SampleNumber;
    for j=1:n; 
        if A(i) < probSum(j);
            sample(i)=XValue(j);
            break;
        end   
    end 
end

pmf=zeros(k,1);
% Draw probablity mass function
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



% When P=0.4
SampleNumber=1000;            
n=20; % suppose n to be 20
p=0.4;  
 
 
prob=zeros(1,n);
probSum=zeros(1,n);

% Analytical Result
for k=1:n;
    prob(k)= (1-p)^(k-1)* p ;
    probSum(k)=sum(prob(1:k));
end 

XValue=1:n;

% Simulation Result
sample=zeros(SampleNumber,1);  A=rand(SampleNumber,1); pmf=zeros(n,1);
for i=1:SampleNumber;
    for j=1:n; 
        if A(i) < probSum(j);
            sample(i)=XValue(j);
            break;
        end   
    end 
end

% Draw probablity mass function
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
legend('Simulations p=0.6','Analytical p=0.6','Simulations p=0.4','Analytical p=0.4');
title('Probability Mass Function of Gemetric Distribution');
