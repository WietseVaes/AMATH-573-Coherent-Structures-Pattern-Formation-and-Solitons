a = @(k) exp(-k.^2/4)*sqrt(pi);
t = 0:0.1:200;
res1 = zeros(length(t),1);
res2 = zeros(length(t),1);
for i = 1:length(t)
    res1(i) = integral(@(k) a(k).*exp(1i*k.*(1 - k).*t(i))/(2*pi),-Inf,Inf);
    res2(i) = integral(@(k) a(k).*exp(1i*k.*(2 - k).*t(i))/(2*pi),-Inf,Inf);
end

exact1 = @(t) real(exp(t.^2./(-1-4i*t))./(sqrt(1+4i*t)));
exact2 = @(t) real(exp(4*t.^2./(-1-4i*t))./(sqrt(1+4i*t)));

dom1 = @(t) exp(-1/16)*cos(1/4*(t-pi))/(2*sqrt(t));
dom2 = @(t) exp(-1/4)*cos((t-pi/4))/(2*sqrt(t));

figure(); hold on;
 plot(t,res1,'-x')
 fplot(exact1,[0,200],'-o')
 fplot(dom1,[0,200],'-*')
 legend('numerical integrations', 'exact solution', 'dominant behavior')
xlabel('t'); hold off
ylabel('\psi')

figure(); hold on;
 plot(t,res2,'-x')
 fplot(exact2,[0,200],'-o')
 fplot(dom2,[0,200],'-*')
 legend('numerical integrations', 'exact solution', 'dominant behavior')
xlabel('t')
ylabel('\psi')


