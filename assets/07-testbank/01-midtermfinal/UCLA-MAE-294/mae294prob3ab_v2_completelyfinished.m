close all;
clear all;
clc;
format short
% Points Define
P0 = [1 3 -2];
P1 = [2 5 4];
P2 = [-3 4 8];
P3 = [3 8 14];
P4 = [7 -5 -2];

dP0 = [0 0 0];
dP4 = [0 0 0];

A= [1/3 1/6 0 0 0;...
    1/6 2/3 1/6 0 0;...
    0 1/6 2/3 1/6 0;...
    0 0 1/6 2/3 1/6;...
    0 0 0 1/6 1/3];

C= [P1-P0-dP0;...
    P2+P0-2*P1;...
    P3+P1-2*P2;...
    P4+P2-2*P3;...
    dP4+P3-P4];

B= (A^-1)*C;
ddp0 = B(1,:)';
ddp1 = B(2,:)';
ddp2 = B(3,:)';
ddp3 = B(4,:)';
ddp4 = B(5,:)';

u = linspace(0,1,101);
for i = 1:length(u)
    U(:,i) = [1-u(i); u(i); 1/6*(-u(i)^3+3*u(i)^2-2*u(i)); 1/6*(u(i)^3-u(i))];
pu0(:,i) = P0'*U(1,i)+P1'*U(2,i)+ddp0*U(3,i)+ddp1*U(4,i);
pu1(:,i) = P1'*U(1,i)+P2'*U(2,i)+ddp1*U(3,i)+ddp2*U(4,i);
pu2(:,i) = P2'*U(1,i)+P3'*U(2,i)+ddp2*U(3,i)+ddp3*U(4,i);
pu3(:,i) = P3'*U(1,i)+P4'*U(2,i)+ddp3*U(3,i)+ddp4*U(4,i);
end

figure
plot3(pu0(1,:),pu0(2,:),pu0(3,:),'r');
hold all
grid on
normal = plot3(pu1(1,:),pu1(2,:),pu1(3,:),'r');
plot3(pu2(1,:),pu2(2,:),pu2(3,:),'r');
plot3(pu3(1,:),pu3(2,:),pu3(3,:),'r');
scatter3(P0(1),P0(2),P0(3),'b*');
scatter3(P1(1),P1(2),P1(3),'r*');
scatter3(P2(1),P2(2),P2(3),'g*');
scatter3(P3(1),P3(2),P3(3),'m*');
scatter3(P4(1),P4(2),P4(3),'k*');


t = [0 3 8 12 20];

L0 = t(2)-t(1);
L1 = t(3)-t(2);
L2 = t(4)-t(3);
L3 = t(5)-t(4);

dP0 = [0 0 0];
dP4 = [0 0 0];

A= [L0/3 L0/6 0 0 0;...
    L0/6 (L0+L1)/3 L1/6 0 0;...
    0 L1/6 (L1+L2)/3 L2/6 0;...
    0 0 L2/6 (L2+L3)/3 L3/6;...
    0 0 0 L2/6 L3/3];

C= [(P1-P0)/L0-dP0;...
    (P2-P1)/L1-(P1-P0)/L0;...
    (P3-P2)/L2-(P2-P1)/L1;...
    (P4-P3)/L3-(P3-P2)/L2;...
    dP4+(P3-P4)/L3];

B= (A^-1)*C;
ddp0 = B(1,:)';
ddp1 = B(2,:)';
ddp2 = B(3,:)';
ddp3 = B(4,:)';
ddp4 = B(5,:)';

% u = linspace(0,1,101);
lengthlong = 100;
tou0 = linspace(0,L0,lengthlong);
tou1 = linspace(0,L1,lengthlong);
tou2 = linspace(0,L2,lengthlong);
tou3 = linspace(0,L3,lengthlong);

for i = 1:lengthlong
    pt0(:,i) = (1-tou0(i)/L0)*P0' + tou0(i)/L0*P1' + 1/6*(-(tou0(i)/L0)^3+3*(tou0(i)/L0)^2-2*tou0(i)/L0)*L0^2*ddp0 + 1/6*((tou0(i)/L0)^3-(tou0(i)/L0))*L0^2*ddp1;
    pt1(:,i) = (1-tou1(i)/L1)*P1' + tou1(i)/L1*P2' + 1/6*(-(tou1(i)/L1)^3+3*(tou1(i)/L1)^2-2*tou1(i)/L1)*L1^2*ddp1 + 1/6*((tou1(i)/L1)^3-(tou1(i)/L1))*L1^2*ddp2;
    pt2(:,i) = (1-tou2(i)/L2)*P2' + tou2(i)/L2*P3' + 1/6*(-(tou2(i)/L2)^3+3*(tou2(i)/L2)^2-2*tou2(i)/L2)*L2^2*ddp2 + 1/6*((tou2(i)/L2)^3-(tou2(i)/L2))*L2^2*ddp3;
    pt3(:,i) = (1-tou3(i)/L3)*P3' + tou3(i)/L3*P4' + 1/6*(-(tou3(i)/L3)^3+3*(tou3(i)/L3)^2-2*tou3(i)/L3)*L3^2*ddp3 + 1/6*((tou3(i)/L3)^3-(tou3(i)/L3))*L3^2*ddp4;
end

nonnormal = plot3(pt0(1,:),pt0(2,:),pt0(3,:),'b');
plot3(pt1(1,:),pt1(2,:),pt1(3,:),'b');
plot3(pt2(1,:),pt2(2,:),pt2(3,:),'b');
plot3(pt3(1,:),pt3(2,:),pt3(3,:),'b');
p0pt = scatter3(P0(1),P0(2),P0(3),'bo');
p1pt = scatter3(P1(1),P1(2),P1(3),'ro');
p2pt = scatter3(P2(1),P2(2),P2(3),'go');
p3pt = scatter3(P3(1),P3(2),P3(3),'mo');
p4pt = scatter3(P4(1),P4(2),P4(3),'ko');
text(P0(1)+.25,P0(2)+.25,P0(3)+.25,'P_0');
text(P1(1)+.25,P1(2)+.25,P1(3)+.25,'P_1');
text(P2(1)+.25,P2(2)+.25,P2(3)+.25,'P_2');
text(P3(1)+.25,P3(2)+.25,P3(3)+.25,'P_3');
text(P4(1)+.25,P4(2)+.25,P4(3)+.25,'P_4');

legend([normal,nonnormal,p0pt,p1pt,p2pt,p3pt,p4pt],'P(u)_N_o_r_m_a_l_i_z_e','P(u)_N_o_n_-_N_o_r_m_a_l_i_z_e','P_0','P_1','P_2','P_3','P_4')