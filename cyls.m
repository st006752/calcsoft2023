[xc1,yc1,zc1] = cylinder(0.1,32);
zc1 = zc1 - 0.5;
[xc2,yc2,zc2] = cylinder(0.05,32);
zc2 = 2*zc2-1;
figure('Position',[0,100,640,480])
cols1 = ones([size(zc1),3]);
cols1(:,:,1) = 0.5*cols1(:,:,1);
cols1(:,:,2) = 0.7*cols1(:,:,2);
cols1(:,:,3) = 0.2*cols1(:,:,3);
surf(xc1,yc1,zc1,cols1);
hold on;
cols2 = ones([size(zc1),3]);
cols2(:,:,1) = 0.2*cols2(:,:,1);
cols2(:,:,2) = 0.5*cols2(:,:,2);
cols2(:,:,3) = 0.7*cols2(:,:,3);
surf(xc2,yc2,zc2,cols2)
xlim([-1,1]);xlabel('x')
ylim([-1,1]);ylabel('y')
zlim([-1,1]);zlabel('z')
axis equal

figure('Position',[641,100,640,480])

for phi = 0:pi/32:pi/3
  deltaz = 0;

  M = [...
  cos(phi)  0 sin(phi) 0;...
  0         1 0        0;...
  -sin(phi) 0 cos(phi) deltaz;...
  0         0 0         1];

  coo = M*[xc2(:)';yc2(:)';zc2(:)';ones(1,numel(xc2))];

  xc3 = reshape(coo(1,:),size(xc2));
  yc3 = reshape(coo(2,:),size(yc2));
  zc3 = reshape(coo(3,:),size(zc2));

  hold off
  surf(xc1,yc1,zc1,cols1);
  hold on;
  surf(xc3,yc3,zc3,cols2);
  xlim([-1,1]);xlabel('x')
  ylim([-1,1]);ylabel('y')
  zlim([-1,1]);zlabel('z')
  axis equal
  drawnow
  pause(1/24)
  end
