clf;
%
%% First figure
v= 3;
a = 4;
figure(1);
subplot(121)
fplot(@(x) -1/2*x^4+2*v*x^2+a*x,'r');xlabel('U'); ylabel('V(U;v,\alpha)');
title('Potential V(U;v,\alpha)')
interestpoints = [2.60167, 2, -2.26180, -1.2,  -0.33987];
yval = -1/2*interestpoints.^4+2*v*interestpoints.^2+a*interestpoints;
ylim([-10,40])
xL = xlim;
yL = ylim;
line([0 0], yL,'Color','k');
line(xL, [0 0],'Color','k');
set(gca,'XTick',[], 'YTick', []);
names = {'U_b'; 'U_c'; 'U_a'};
set(gca,'xtick',[-2.26180,-0.33987,2.60167],'xticklabel',names)
yline([35,yval,-5],'--',{'\beta_0','\beta_1','\beta_2','\beta_3','\beta_4','\beta_5','\beta_6'})



xlimit = 4.5;
ylimit = 4.5;
subplot(1,2,2)
title('Phase portrait')
hold on
[X,Y] = meshgrid(linspace(-xlimit,xlimit,1000),linspace(-ylimit,ylimit,1000));
clear betalines
yval = [29, yval,-5];
Colors = {'k','r','b', 'g', 'c', 'm', 'y'};
for index1 = 1:length(yval)
    beta = yval(index1);
    if ~any(index1 == [2,4,6])
        tol = 10^(-1);
    else
        tol = 10^(-2);
    end
    Indices = abs(Y.^2/2+(-X.^4/2+2*v*X.^2+a*X)-beta)<=tol;
    betalines{index1} = [X(Indices),Y(Indices)];
    scatter(betalines{index1}(:,1),betalines{index1}(:,2),1,Colors{index1})
end
text(2.60167-0.15,2, '\beta_0', 'Color', 'k');text(2.60167-0.15,1, '\beta_1', 'Color', 'r');text(2.60167-1,0.4, '\beta_2', 'Color', 'b');text(2.60167-1.5,0.4, '\beta_3', 'Color', 'g');text(2.60167-2,0.4, '\beta_4', 'Color', 'c');
text(-0.33987-0.5,0.4,'\beta_5', 'Color', 'm'); text(-3.8,0.4,'\beta_6', 'Color', 'y');
clear X Y
[X,Y] = meshgrid(linspace(-xlimit,xlimit,16),linspace(-ylimit,ylimit,16));
U = Y;
V = -(-2*X.^3+4*v*X+a);
Un = U./sqrt(U.^2+V.^2)/3;
Vn = V./sqrt(U.^2+V.^2)/3;
quiver(X,Y,Un,Vn,0,'color', [0 0.5 0]); xlim([-xlimit,xlimit]);ylim([-ylimit,ylimit])
line([0 0], yL,'LineStyle','--','Color','k');
line(xL, [0 0],'LineStyle','--','Color','k');
set(gca,'XTick',[], 'YTick', []);
text(xlimit+0.1,0,'U_1'); text(0,ylimit-0.2,'U_2');text(-2.26180+0.1,0.1,'U_b');text(-0.33987+0.1,0.1,'U_c');text(2.60167+0.1,0.1,'U_a');
scatter([-2.26180,-0.33987,2.60167],[0,0,0],'o','MarkerEdgeColor','k','MarkerFaceColor','k')

clear all
%% Second figure
v= 0;
a = 12;
figure(2);
subplot(121)
fplot(@(x) -1/2*x^4+2*v*x^2+a*x,'r');xlabel('U'); ylabel('V(U;v,\alpha)');
title('Potential V(U;v,\alpha)')
interestpoints = [(a/2)^(1/3),1];
yval = -1/2*interestpoints.^4+2*v*interestpoints.^2+a*interestpoints;
ylim([-10,40])
xL = xlim;
yL = ylim;
line([0 0], yL,'Color','k');
line(xL, [0 0],'Color','k');
set(gca,'XTick',[], 'YTick', []);
names = {'U_a'};
set(gca,'xtick',[(a/2)^(1/3)],'xticklabel',names)
yline(yval,'--',{'\beta_1','\beta_2'})



xlimit = 4.5;
ylimit = 4.5;
subplot(1,2,2)
title('Phase portrait')
hold on
[X,Y] = meshgrid(linspace(-xlimit,xlimit,1000),linspace(-ylimit,ylimit,1000));

clear betalines
Colors = {'r','b'};
for index1 = 1:length(yval)
    beta = yval(index1);
    tol = 10^(-1);
    Indices = abs(Y.^2/2+(-X.^4/2+2*v*X.^2+a*X)-beta)<=tol;
    betalines{index1} = [X(Indices),Y(Indices)];
    scatter(betalines{index1}(:,1),betalines{index1}(:,2),1,Colors{index1})
end
text((a/2)^(1/3)-0.1,1, '\beta_1', 'Color', 'r');text(2.60167-1.5,0.4, '\beta_2', 'Color', 'b');
clear X Y
[X,Y] = meshgrid(linspace(-xlimit,xlimit,16),linspace(-ylimit,ylimit,16));
U = Y;
V = -(-2*X.^3+4*v*X+a);
Un = U./sqrt(U.^2+V.^2)/3;
Vn = V./sqrt(U.^2+V.^2)/3;
quiver(X,Y,Un,Vn,0,'color', [0 0.5 0]); xlim([-xlimit,xlimit]);ylim([-ylimit,ylimit])
line([0 0], yL,'LineStyle','--','Color','k');
line(xL, [0 0],'LineStyle','--','Color','k');
set(gca,'XTick',[], 'YTick', []);
text(xlimit+0.1,0,'U_1'); text(0,ylimit-0.2,'U_2');text((a/2)^(1/3)+0.1,0.15,'U_a');
scatter((a/2)^(1/3),0,'o','MarkerEdgeColor','k','MarkerFaceColor','k')

%}
clear all
%% Third figure
v= 2;
a = 0;
figure(3);
subplot(121)
fplot(@(x) -1/2*x^4+2*v*x^2+a*x,'r');xlabel('U'); ylabel('V(U;v,\alpha)');
title('Potential V(U;v,\alpha)')
interestpoints = [0, -1, -2, 2];
yval = -1/2*interestpoints.^4+2*v*interestpoints.^2+a*interestpoints;
ylim([-20,20])
xL = xlim;
yL = ylim;
line([0 0], yL,'Color','k');
line(xL, [0 0],'Color','k');
set(gca,'XTick',[], 'YTick', []);
names = {'U_a','U_b', 'U_c'};
set(gca,'xtick',[-2,0,2],'xticklabel',names)
yline(yval,'--',{'\beta_3','\beta_2','\beta_1','\beta_1'})


xlimit = 4.5;
ylimit = 4.5;
subplot(1,2,2)
title('Phase portrait')
hold on
[X,Y] = meshgrid(linspace(-xlimit,xlimit,1000),linspace(-ylimit,ylimit,1000));

clear betalines
Colors = {'g','b','r','r'};
for index1 = 1:length(yval)
    beta = yval(index1);

    tol = 10^(-1.5);

    Indices = abs(Y.^2/2+(-X.^4/2+2*v*X.^2+a*X)-beta)<=tol;
    betalines{index1} = [X(Indices),Y(Indices)];
    scatter(betalines{index1}(:,1),betalines{index1}(:,2),1,Colors{index1})
end
text(-2-0.1,1, '\beta_1', 'Color', 'r');text(-1+.1,0.4, '\beta_2', 'Color', 'b');text(-0.1,0.4, '\beta_3', 'Color', 'g');
clear X Y
[X,Y] = meshgrid(linspace(-xlimit,xlimit,16),linspace(-ylimit,ylimit,16));
U = Y;
V = -(-2*X.^3+4*v*X+a);
Un = U./sqrt(U.^2+V.^2)/3;
Vn = V./sqrt(U.^2+V.^2)/3;
quiver(X,Y,Un,Vn,0,'color', [0 0.5 0]); xlim([-xlimit,xlimit]);ylim([-ylimit,ylimit])
line([0 0], yL,'LineStyle','--','Color','k');
line(xL, [0 0],'LineStyle','--','Color','k');
set(gca,'XTick',[], 'YTick', []);
text(xlimit+0.1,0,'U_1'); text(0,ylimit-0.2,'U_2');text(-2+0.1,0.15,'U_a');text(0.1,0.15,'U_b');text(2+0.1,0.15,'U_c');
scatter([-2,0,2],[0,0,0],'o','MarkerEdgeColor','k','MarkerFaceColor','k')

clear all
%% fourth figure
v= 3/(4*2^(1/3));
a = -1;
figure(4);
subplot(121)
fplot(@(x) -1/2*x^4+2*v*x^2+a*x,'r');xlabel('U'); ylabel('V(U;v,\alpha)');
title('Potential V(U;v,\alpha)')
interestpoints = [-1.25992, -.5, 0.629955];
yval = -1/2*interestpoints.^4+2*v*interestpoints.^2+a*interestpoints;
ylim([-5,5])
xL = xlim;
yL = ylim;
line([0 0], yL,'Color','k');
line(xL, [0 0],'Color','k');
set(gca,'XTick',[], 'YTick', []);
names = {'U_a','U_b'};
set(gca,'xtick',[-1.25992, 0.629955],'xticklabel',names)
yline(yval,'--',{'\beta_1','\beta_2','\beta_3'})



xlimit = 4.5;
ylimit = 4.5;
subplot(1,2,2)
title('Phase portrait')
hold on
[X,Y] = meshgrid(linspace(-xlimit,xlimit,1000),linspace(-ylimit,ylimit,1000));

clear betalines
Colors = {'r','b','g'};
for index1 = 1:length(yval)
    beta = yval(index1);
    if index1 == 1
        tol = 10^(-1.8);
    elseif index1 == 2
        tol = 10^(-2);
    else
        tol = 10^(-2.5);
    end
    Indices = abs(Y.^2/2+(-X.^4/2+2*v*X.^2+a*X)-beta)<=tol;
    betalines{index1} = [X(Indices),Y(Indices)];
    scatter(betalines{index1}(:,1),betalines{index1}(:,2),1,Colors{index1})
end
text(-1.25992-0.1,1, '\beta_1', 'Color', 'r');text(-.5+.1,0.4, '\beta_2', 'Color', 'b');text(0.629955-0.1,0.4, '\beta_3', 'Color', 'g');
clear X Y
[X,Y] = meshgrid(linspace(-xlimit,xlimit,16),linspace(-ylimit,ylimit,16));
U = Y;
V = -(-2*X.^3+4*v*X+a);
Un = U./sqrt(U.^2+V.^2)/3;
Vn = V./sqrt(U.^2+V.^2)/3;
quiver(X,Y,Un,Vn,0,'color', [0 0.5 0]); xlim([-xlimit,xlimit]);ylim([-ylimit,ylimit])
line([0 0], yL,'LineStyle','--','Color','k');
line(xL, [0 0],'LineStyle','--','Color','k');
set(gca,'XTick',[], 'YTick', []);
text(xlimit+0.1,0,'U_1'); text(0,ylimit-0.2,'U_2');text(-1.25992+0.1,0.15,'U_a');text(0.629955+0.1,0.15,'U_b');
scatter([-1.25992,0.629955],[0,0],'o','MarkerEdgeColor','k','MarkerFaceColor','k')