%Exponential Distribution 
function NormallD()


% When mu=10 sigmaSquar=5

SampleNumber=1000; 
n=25;
mu=10; 
sigmaSquar=5; 
sigma=sqrt(sigmaSquar);

XValue=-2:n; 
prob=zeros(1,n);  
U1=0; U2=0;
V1=0;     V2=0;
S=5;
X=0;   Y=0;

% Analaticaly
for i=1:n;
 prob(i)= quad(@(i)exp((-i.^2)./2).*((2./(sqrt(2.*pi)))),.005,i); 

end

% Simulation
sample=zeros(1,SampleNumber);
for i=1:SampleNumber/2;
    while S>1
      U1=rand(1,1); U2=rand(1,1);
      V1=2.*U1-1;     V2=2.*U2-1;  
      S=V1^2+V2^2;
    end
    
    if S<=1
        X=sqrt((-2.*log(S))./S).*V1; 
        Y=sqrt((-2.*log(S))./S).*V2;
        S=5;
    end 
end

for i=1:SampleNumber/2;
    sample(i)=X;
end

for j=SampleNumber/2:SampleNumber;
    sample(j)=Y;
end
samplex=ceil(max(sample));
sampley=ceil(min(sample));
sample= sample .* sigma+mu;

cdf=zeros(n,1);
for i=1:n,
    for j=1:SampleNumber;
        if sample(j)<=XValue(i);
            cdf(i)=cdf(i)+1;
        end
    end
end
cdf=cdf./SampleNumber;



%Plot the cumulative distribution function
plot(cdf,'-y','linewidth',2.3); hold on; 
plot(prob,'--r','linewidth',2.3);  
   
%legend('Simulations','Analytical');

 
% When mu=1 sigmaSquar=10

SampleNumber=1000;
n=15;
mu=1;
sigmaSquar=10;

sigma=sqrt(sigmaSquar);
XValue=-2:n; prob2=zeros(1,n);  
U1=0; U2=0;
V1=0;     V2=0;
S=5;
X=0;   Y=0;

% Analaticaly
for i=1:n,
  prob2(i)= quad(@(i)exp((-i.^2)./2).*((2./(sqrt(2.*pi)))),0,i); 
end
%Simulation
sample=zeros(1,SampleNumber);
for i=1:SampleNumber/2;
    while S>1
      U1=rand(1,1); U2=rand(1,1);
      V1=2.*U1-1;     V2=2.*U2-1;  
      S=V1^2+V2^2;
    end
    
    if S<=1
        X=sqrt((-2.*log(S))./S).*V1; 
        Y=sqrt((-2.*log(S))./S).*V2;
        S=5;
    end 
end

for i=1:SampleNumber/2;
    sample(i)=X;
end

for j=SampleNumber/2:SampleNumber;
    sample(j)=Y;
end

sample= sample .* sigma+mu;

cdf2=zeros(n,1);
for i=1:n,
    for j=1:SampleNumber;
        if sample(j)<=XValue(i);
            cdf2(i)=cdf2(i)+1;
        end
    end
end
cdf2=cdf2./SampleNumber;



%Plot Probability mass function 
plot(cdf2, '-g', 'linewidth',2.5); 
xlabel('Random Variable'); ylabel('Cumulative Distribution Function'); 
hold on;
plot(prob2,'--b','linewidth',2.5);  
legend('Simulations mu=10 ,sigmaSquar=5','Analytical   mu=1 sigmaSquar=10','Simulations  mu=10 sigmaSquar=5','Analytical     mu=1 sigmaSquar=10');
title('Normal Distribution');
