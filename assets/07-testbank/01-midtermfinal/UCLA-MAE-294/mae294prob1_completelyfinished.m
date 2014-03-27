close all;
clear all;
clc;
%%
for i = 1
syms a b c d e f u v t
% u = a.*t.^2+b.*t+c;
% v = d.*t.^2+e.*t+f;

x = u;
y = v;
z = sin(u)+cos(v)+5;
p = [x;y;z];
% subs(p,[t,a,b,c,d,e,f],[1,1,1,1,1,1,1])

p_u = diff(p,u);
p_v = diff(p,v);
nbar = cross(p_u,p_v)/norm(cross(p_u,p_v));

p_uu = diff(p_u,u);
p_vv = diff(p_v,v);
p_uv = diff(p_u,v);

D = [dot(nbar,p_uu) dot(nbar,p_uv); dot(nbar,p_uv) dot(nbar,p_vv)];
G = [dot(p_u,p_u) dot(p_u,p_v); dot(p_u,p_v) dot(p_v,p_v)];
% pretty(D)
u1 = a.*t.^2+b.*t+c;
v1 = d.*t.^2+e.*t+f;
pt = subs(p,[u,v],[u1,v1]);
pt_t = diff(pt,t);
pt_tt = diff(pt_t,t);
Nbar = cross(cross(pt_t,pt_tt),pt_t)/norm(cross(cross(pt_t,pt_tt),pt_t));

% Constant K
k = norm(cross(pt_t,pt_tt))/norm(pt_t)^3;
% Constant Kn
dudt = diff(u1,t);
dvdt = diff(v1,t);
ubardot = [dudt;dvdt];
kn = (ubardot'*D*ubardot)/(ubardot'*G*ubardot);

knbar = kn*nbar;

kbar = k*Nbar;

kg = kbar-knbar;
normkg = kg;
end
%% everything before this is correct!

% Found values for a,b,c,d,e,f (NOTE: Might set d=0)
c1 = -pi/2;
f1 = 3*pi/4;
%% Assume 5 variable has 3 unknowns
d1 = 0; % this was originally the 6 variable so set to zero!
e1 = -(3*pi/4+pi/2);
% a1 = linspace(-3.4,-3.30,5);
a1 = -3.3750;
%% Assume 6 variable has 4 unknowns
% a1 = #;
% b1 = #;
% c1 = #;
% e1 = #;
%% Note Order of substitution matters!!!
% t1 = linspace(0,1,101);
% 
% normkg = norm(kg);
% normkg = subs(normkg,[u,v],[u1,v1]);
% normkg = subs(normkg,[c,d,e,f],[c1,d1,e1,f1]);
% kgvalue = zeros(1,length(t1));
% storekgindex = 100;
% aa = 0;
% bb = 0;
% for i = 1:length(a1)
% %     for j = 1:length(b1)
%         for k = 1:length(t1) 
%         kgvalue(k) = subs(normkg,[a,b,t],[a1(i),5*pi/4-a1(i),t1(k)]);
%         kgval = vpa(kgvalue,10);
%         end
%         kgindex = ((sum(kgval.^2))^.5)/10;
%         kgindex = abs(kgindex);
%             if kgindex < storekgindex
%                 storekgindex = kgindex
%                 aa = a1(i)
%                 bb = 5*pi/4-a1(i);
%             end
% %     end
% end

%% Plot

figure
u = linspace(-2*pi,2*pi,25);
v = linspace(-2*pi,2*pi,25);
[u,v] = meshgrid(u,v);
x = u;
y = v;
z = sin(u)+cos(v)+5;
surf(x,y,z);
hold all

startpt = scatter3(-pi/2,3*pi/4,sin(-pi/2)+cos(3*pi/4)+5,'*b','linewidth',5);
end__pt = scatter3(3*pi/4,-pi/2,sin(3*pi/4)+cos(-pi/2)+5,'*k','linewidth',5);
alpha(.25);
xlabel('x'); ylabel('y'); zlabel('z')
aarange = [2  ,-2.7718,-3.3556,-3.3750];
bbrange = [7.3,6.7048, 7.2825,  7.3020];
kgindex = [0.17959, 100,  0.152709, 0.150739];
aa = aarange(4);
bb = bbrange(4);

%% Output exact
kgvalue = [0.453608752441664,0.405013187734662,0.355447058166346,0.307834301930028,0.264062998494107,0.225109013701969,0.191261994686797,0.162360309451305,0.137986239363890,0.117606876736186,0.100665046625847,0.0866317283110205,0.0750320139259332,0.0654544542925672,0.0575508663903690,0.0510312542617348,0.0456566894775775,0.0412317719930536,0.0375975150188826,0.0346250320633063,0.0322101414414434,0.0302688657217008,0.0287337394259881,0.0275508154893175,0.0266772599658079,0.0260794338574541,0.0257313743735027,0.0256136020216731,0.0257121930256198,0.0260180679438016,0.0265264568162694,0.0272365087020329,0.0281510191854857,0.0292762534164800,0.0306218445438557,0.0322007479673151,0.0340292305380661,0.0361268704657725,0.0385165379485283,0.0412243181217451,0.0442793265828088,0.0477133534981151,0.0515602556688548,0.0558549983946410,0.0606322335108284,0.0659242917441218,0.0717584744764069,0.0781535630582934,0.0851155360682526,0.0926326089654793,0.100669893186364,0.109164205570127,0.118019812980134,0.127106109129591,0.136258300396118,0.145282025121854,0.153962376889505,0.162077057056391,0.169412473320698,0.175780767859563,0.181035281217659,0.185082045322243,0.187885582167205,0.189468384205834,0.189904643465399,0.189309742673042,0.187827505466945,0.185617185925611,0.182841777345476,0.179658629893450,0.176212772172654,0.172632857752978,0.169029355324235,0.165494462947696,0.162103213468011,0.158915301515410,0.155977260930802,0.153324725441041,0.150984597981785,0.148977027877025,0.147317149076641,0.146016569123461,0.145084621082634,0.144529403034391,0.144358635127358,0.144580365136018,0.145203551796512,0.146238552161168,0.147697535615158,0.149594843512600,0.151947309862491,0.154774555224970,0.158099262966552,0.161947444208710,0.166348695087402,0.171336447194895,0.176948209151140,0.183225793982636,0.190215523185023,0.197968393804160,0.206540189361779];
kgindex = kgindex(4);
a2 = aa;
b2 = bb;
storekgindex = kgindex;
t = 0:.01:1;
u1 = a2.*t.^2+b2.*t+c1;
v1 = d1.*t.^2+e1.*t+f1;
p = [u1;v1];
z1 = sin(u1)+cos(v1)+5;
line = plot3(u1,v1,z1,'r','linewidth',5);

kgmax = max(abs(kgvalue));
kgmean = mean(abs(kgvalue));
legend([startpt,end__pt,line],'Start Pt','End Pt','Geodesic Line')
title('Geodesic Path Plot')
axis equal
fprintf('This programs finds the Kg and Kg-index.\n\n')
fprintf('Equation for Kg is:\n')
fprintf('Kg_Vector = K_Vector - Kn_Vector\n\n')

fprintf('The general equation u(t) and v(t) we used are:\n')
fprintf('u(t) = a*t^2+b*t+c\n')
fprintf('v(t) = d*t+e\n')

fprintf('\n\nThe values for the equation above are:\n')
fprintf('a ='); disp(a1);
fprintf('b ='); disp(b2);
fprintf('c ='); disp(c1);
fprintf('d ='); disp(e1);
fprintf('e ='); disp(f1);

fprintf('Kg index:'); disp(storekgindex);
fprintf('Kg max:'); disp(kgmax);
fprintf('Kg mean:'); disp(kgmean);

Kg_Vector = kg;
K_Vector = kbar;
Kn_bar = knbar;
fprintf('Type Kg_Vector, K_Vector, or Kn_bar for full symbolic equations.')
%% Output Wrong
% a2 = 2;
% b2 = 5*pi/4-a2;
% t = 0:.01:1;
% u1 = a2.*t.^2+b2.*t+c1;
% v1 = d1.*t.^2+e1.*t+f1;
% p = [u1;v1];
% z1 = sin(u1)+cos(v1)+5;
% plot3(u1,v1,z1,'b','linewidth',5)
