CustomersServed=0;
CustomersDropped=0;

Feedback1=0;
Feedback2=0;

No_arrive1=0;     
No_arrive2=0;     
No_depart1=0;     
No_depart2=0; 

n=0;      

n1=0;
n2=0;

r1=6;      
r2=8; 

mu1=8;     
mu2=10;     

arrival1_op = inf*ones(1, 10000);
departed1_op = inf*ones(1, 10000);
arrival2_op = inf*ones(1, 10000);
departed2_op = inf*ones(1, 10000);

time_arrived1 = poissrnd(r1);
time_arrived2 = poissrnd(r2);

servivetime1 = exprnd(1/mu1);
servivetime2 = exprnd(1/mu2);

time_departed1 = servivetime1 + time_arrived1;
time_departed2 = servivetime2 + time_arrived2;

time_arrived_feedback1=inf;
time_arrived_feedback2=inf;
time_departed_feedback1=inf;
time_departed_feedback2=inf;
 
small=inf;
small= min([time_arrived1 time_arrived2 time_departed1 time_departed2 time_arrived_feedback1 time_arrived_feedback2 time_departed_feedback1 time_departed_feedback2]);


eventNum = 0; 
SystemState = zeros(2*10000,1);
SystemStateTime = SystemState;
while CustomersServed<10000
    if (time_arrived1 == small) 
       if n1<=3
            n1 = n1+1;
            n = n+1;
            t = time_arrived1;
            eventNum = eventNum + 1;
            SystemState(eventNum) =  n;
            SystemStateTime(eventNum) = t;
            No_arrive1 = No_arrive1 + 1;
            time_arrived1 = t + poissrnd(r1); 
            if n1>=1,
                servivetime1 = exprnd(1/mu1);
                time_departed1 = t + servivetime1;
            end
            arrival1_op(No_arrive1) = t;
            
       else
           CustomersDropped=CustomersDropped+1;
       end
    elseif (time_arrived2 == small)  
       if n2<=4
            n2 = n2+1;
            n = n+1;
            t = time_arrived2;
            eventNum = eventNum + 1;
            SystemState(eventNum) =  n;
            SystemStateTime(eventNum) = t;
            No_arrive2 = No_arrive2 + 1;
            time_arrived2 = t + poissrnd(r2);
            if n2>=1,
                servivetime2 = exprnd(1/mu2);
                time_departed2 = t + servivetime2;
            end
            arrival2_op(No_arrive2) = t;
            
       else
           CustomersDropped=CustomersDropped+1;
       end
    elseif (time_arrived_feedback1 == small)  
       if n1<=3
            n1 = n1+1;
            n = n+1;
            t = time_arrived_feedback1;
            eventNum = eventNum + 1;
            SystemState(eventNum) =  n;
            SystemStateTime(eventNum) = t;
            No_arrive1 = No_arrive1 + 1;
            time_arrived_feedback1=inf;
            fd_ser1 = exprnd(1/mu1);
            time_departed_feedback1 = t + fd_ser1;
            arrival1_op(No_arrive1) = t;
       else
           CustomersDropped=CustomersDropped+1;
       end
    elseif (time_arrived_feedback2 == small)  
       if n2<=4
            n2 = n2+1;
            n = n+1;
            t = time_arrived_feedback2;
            eventNum = eventNum + 1;
            SystemState(eventNum) =  n;
            SystemStateTime(eventNum) = t;
            No_arrive2 = No_arrive2 + 1;
            time_arrived_feedback2 =inf;
            fd_ser2 = exprnd(1/mu2);
            time_departed_feedback2 = t + fd_ser2;
            arrival2_op(No_arrive2) = t;
       else
           CustomersDropped=CustomersDropped+1;
       end   
    elseif (time_departed1 == small)   
        t = time_departed1;
        n1 = n1-1;
        n=n-1;
        eventNum = eventNum + 1;
        SystemState(eventNum) =  n;
        SystemStateTime(eventNum) = t;
        No_depart1 = No_depart1 + 1;
        if n1==0, 
            time_departed1 = inf;
        else
            servivetime1 = exprnd(1/mu1);
            time_departed1 = t + servivetime1;
        end
        departed1_op(No_depart1) = t;
        CustomersServed=CustomersServed+1;
        Feedback1=mod((Feedback1+1),2);
        if(Feedback1==0)
            time_arrived_feedback2=t+1;     
        else
            time_arrived_feedback2=inf;
        end
    elseif (time_departed2 == small) 
        t = time_departed2;
        n2 = n2-1;
        n=n-1;
        eventNum = eventNum + 1;
        SystemState(eventNum) =  n;
        SystemStateTime(eventNum) = t;
        No_depart2 = No_depart2 + 1;
        if n2==0, 
            time_departed2 = inf;
        else
            servivetime2 = exprnd(1/mu2);
            time_departed2 = t + servivetime2;
        end
        departed2_op(No_depart2) = t;
        CustomersServed=CustomersServed+1;
        Feedback2=mod((Feedback2+1),4);
        if(Feedback2==0)
            time_arrived_feedback1=t+1;    
        else
            time_arrived_feedback1=inf;
        end
    elseif (time_departed_feedback1 == small)   
        t = time_departed_feedback1;
        n1 = n1-1;
        n=n-1;
        eventNum = eventNum + 1;
        SystemState(eventNum) =  n;
        SystemStateTime(eventNum) = t;
        No_depart1 = No_depart1 + 1;
        time_departed_feedback1=inf;
        if n1==0, 
            time_departed1 = inf;
        end
        departed1_op(No_depart1) = t;
        CustomersServed=CustomersServed+1;
        Feedback1=mod((Feedback1+1),2);
        if(Feedback1==0)
            time_arrived_feedback2=t+1;    
        else
            time_arrived_feedback2=inf;
        end
    elseif (time_departed_feedback2 == small) 
        t = time_departed_feedback2;
        n2 = n2-1;
        n=n-1;
        eventNum = eventNum + 1;
        SystemState(eventNum) =  n;
        SystemStateTime(eventNum) = t;
        No_depart2 = No_depart2 + 1;
        time_departed_feedback2=inf;
        if n2==0, 
            time_departed2 = inf;
        end
        departed2_op(No_depart2) = t;
        CustomersServed=CustomersServed+1;
        Feedback2=mod((Feedback2+1),4);
        if(Feedback2==0)
            time_arrived_feedback1=t+1;    
        else
            time_arrived_feedback1=inf;
        end
       
    end
    


small= min([time_arrived1 time_arrived2 time_departed1 time_departed2 time_arrived_feedback1 time_arrived_feedback2 time_departed_feedback1 time_departed_feedback2]);
    
    
    
    
end

c_zero=0;
c_two=0;
c_nine=0;
for i=1:(2*10000)
    if SystemState(i)==0
        c_zero=c_zero+1;
    end
    if SystemState(i)==2
        c_two=c_two+1;
    end
    if SystemState(i)==9
        c_nine=c_nine+1;
    end
end
c_zero = c_zero/(2*10000);
c_two = c_two/(2*10000);
c_nine = c_nine/(2*10000);
server1_average_time=0;
server2_average_time=0;
for i=1:No_arrive1
    server1_average_time=server1_average_time+(departed1_op(i)-arrival1_op(i));
end
for i=1:No_arrive2
    server2_average_time=server2_average_time+(departed2_op(i)-arrival2_op(i));
end

server1_average_time=server1_average_time/No_arrive1;
server2_average_time=server2_average_time/No_arrive2;

fprintf('Probability (0 customer) = %f\n',c_zero);
fprintf('Probability (2 customer) = %f\n',c_two);
fprintf('Probability (9 customer) = %f\n',c_nine);
fprintf('No. of customers dropped = %f\n',CustomersDropped);
fprintf('Server1 (Avg Response Time) = %f\n',server1_average_time);
fprintf('Server1 (Avg Response Time) = %f\n',server2_average_time);