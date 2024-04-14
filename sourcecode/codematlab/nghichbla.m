clc; 
qx=zeros(3001,2);
qdx=zeros(3001,2);
qddx=zeros(3001,2);
i=1;
for t=0:0.01:30
    qx(i,2)=q(1,i);
    qx(i,1)=t;
    qdx(i,2)=qd(1,i);
    qdx(i,1)=t;
    qddx(i,2)=qdd(1,i);
    qddx(i,1)=t;
    i=i+1;
end