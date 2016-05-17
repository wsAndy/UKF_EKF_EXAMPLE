function ukf(x0,y0,P,Q,R,N,tar)
% 本次使用原来的算式，自己写吧
% 自己写的还是错的，这个真的是错的吗，还是使用的方程不对????
% X0 = [-100,2,200,20];
X0 = tar;
Xstation = [x0,y0];
% N = 50;
T = 1;
% P = eye(4);
P = diag([P]);
% R = 5;
% Q = (1e-3)*diag([0.5 1]);
Q = (1e-3)*Q;

L = size(X0,2);
alpha = 1;
beta = 2;
lamda = 3 - L;
Wm = zeros(1,2*L+1);
Wc = zeros(1,2*L+1);
for i = 1:2*L+1
    Wm(i) = 1/(2*(L+lamda));
    Wc(i) = Wm(i);
end
Wm(1) = lamda / (L+lamda);
Wc(1) = lamda / (L+lamda) + (1-alpha^2 +beta);
 
v = sqrtm(R)*randn(1,N);

F = [1,T,0,0;0,1,0,0;0,0,1,T;0,0,0,1];
G = [T^2/2,0;T,0;0,T^2/2;0,T];
X(:,1) = X0;
for t = 2:N
   X(:,t) = F*X(:,t-1) + G*sqrtm(Q)*randn(2,1);
end

for t =1:N
    Z(t) = h(X(:,t),Xstation) + v(t);
end
Xukf = zeros(4,N);
Xukf(:,1) = X(:,1);
%


for t = 2:N
   Xest = Xukf(:,t-1); 
   
   % get first sigma set 
   cho = (chol((P*(L+lamda))))'; % ..abs!!!!!!!!!!!
   for k = 1:L
       Xmid(:,k) = Xest + cho(:,k);
       Xright(:,k) = Xest - cho(:,k);
   end
   Xsigma = [Xest Xmid Xright]; % sigma
   
   % second step, predict sigma
%    Xsigma_pre = getSigmaPre(Xsigma);
   Xsigma_pre = F*Xsigma;
   
   % third step
   
   Xsigma_pre_est = zeros(L,1);
   for k =1:2*L+1
       Xsigma_pre_est = Xsigma_pre_est + Wm(k)*Xsigma_pre(:,k);
   end
   P_pre_est = zeros(L,L);
   for k =1:2*L+1
       P_pre_est = P_pre_est + Wc(k)*(Xsigma_pre_est-Xsigma_pre(:,k))*(Xsigma_pre_est-Xsigma_pre(:,k))';
   end
   P_pre_est = P_pre_est + G*Q*G' ; % !!! 是不是漏下了噪声
   
   
   %forth setp
   chor = (chol((L+lamda)*P_pre_est))';
   for k =1:L
       Xmid(:,k) = Xsigma_pre_est + chor(:,k);
       Xright(:,k) = Xsigma_pre_est - chor(:,k);
   end
   Xsigma_new = [Xsigma_pre_est Xmid Xright];
   
   % fifth step 
   Zsig = zeros(1,2*L+1);
   for k =1:2*L+1
       Zsig(:,k) =h(Xsigma_new(:,k),Xstation);  
   end
   
   % sixth step
   Z_est = 0;
   for k =1:2*L+1
       Z_est = Z_est + Wm(k)*Zsig(:,k);
   end
   PZZ = 0;
   for k =1:2*L+1
       PZZ = PZZ + Wc(k)*(Zsig(:,k) - Z_est)*(Zsig(:,k) - Z_est)';
   end
   PZZ = PZZ + R;
       
   PXZ = 0;
   for k =1:2*L+1
       PXZ = PXZ + Wc(k)*(Xsigma_new(:,k) - Xsigma_pre_est)*(Zsig(:,k) - Z_est)';
   end
   
   % seventh step
   K = PXZ*inv(PZZ);
   
   % eighth step
   Xest = Xsigma_pre_est + K*(Z(t) - Z_est);
   P = P_pre_est - K*PZZ*K';
   Xukf(:,t) = Xest;
   
   
    
end

% judge error 
for i =1:N
    err(i) = Dist(X(:,i),Xukf(:,i));
end

figure;
hold on;grid on;
plot(Xukf(1,:),Xukf(3,:),'-s','MarkerFace','g');
plot(X(1,:),X(3,:),'-r.');
legend('Ukf Estimate Value','Real Value');
xlabel('x-place');
ylabel('y-place');
title('Unscented Kalman Filter');
hold off;

figure;
hold on;grid on;
plot(err,'-s','MarkerFace','r');
legend('Dist Estimate Error');
title('Unscented Kalman Filter');
xlabel('Time/s');
ylabel('Estimate Distance Error');
hold off;


end

function out = Dist(x,xx)
 out = sqrt((x(1) - xx(1))^2 + (x(3) - xx(3))^2);
end

function out = h(X,XX)
    a = X(1);
    b = X(2);
    out = sqrt((a-XX(1))^2+(b-XX(2))^2);
end


