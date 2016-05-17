function ekf(x0,y0,P,Q,R,N,tar)
% N = 50;
T = 1;
X = zeros(4,N);
% init states
% X(:,1) = [-100,2,200,20];
X(:,1) = tar;
Z = zeros(1,N);
% Q = (1e-3)*diag([0.5 1]);
Q = (1e-3)*Q;
% R = 5;

F = [1,T,0,0;0,1,0,0;0,0,1,T;0,0,0,1];
G = [T^2/2 0;T,0;0,T^2/2;0,T ];

for t = 2:N
   X(:,t)  = F*X(:,t-1)+G*sqrtm(Q)*randn(2,1);
end

% x0 = 200;
% y0 = 300;
Xstation= [x0,y0];% x0 , y0
for t = 1:N
    Z(t)=Dist(X(:,t),Xstation) + sqrtm(R)*randn(1);
end

% start EKF
Xekf = zeros(4,N);
Xekf(:,1) = X(:,1);
P0 = diag(P);
for i =2:N
    Xn = F*Xekf(:,i-1);     % predicet
    P1 = F*P0*F' + G*Q*G';  % predict var
    dd=  Dist(Xn,Xstation); % estimate distance
    
    % solve yakobe
    H = [Xn(1,1)-x0/dd,0,(Xn(3,1)-y0)/dd,0]; % 一阶近似
    K = P1*H'*inv(H*P1*H'+R);    % 增益
    Xekf(:,i) = Xn + K*(Z(:,i)-dd); % state update
    P0 = (eye(4) - K*H)*P1; % error variance update
end

% analy error 
err = zeros(1,N);
for i= 1:N
    err(i) = Dist(X(:,i),Xekf(:,i));
end

figure;
hold on;grid on;
plot(X(1,:),X(3,:),'-s','MarkerFace','g');
plot(Xekf(1,:),Xekf(3,:),'-s','MarkerFace','r');
legend('Real Value','EKF Value');
xlabel('x-place');
ylabel('y-place');
title('Extended Kalman Filter');
hold off;

figure;
hold on;grid on;
plot(err,'-s','MarkerFace','r');
legend('Error Distance');
xlabel('Time/s');
ylabel('Estimate Distance Error');
title('Extended Kalman Filter');
hold off;

end

function out = Dist(X,XX)
L = size(XX,1);
if(L == 4)
   out = sqrt((X(1)-XX(1))^2 + (X(3)-XX(3))^2);
else
    out = sqrt((X(1) - XX(1))^2 + (X(2) - XX(2))^2);
end
   
end