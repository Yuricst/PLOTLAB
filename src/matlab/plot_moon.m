function [xM,yM,zM] = plot_moon(rx, ry, rz, cx, cy, cz, rotate_180)
[xM,yM,zM] = sphere(50);
hPlanet = surf(xM*rx+cx,...
    yM*ry+cy, zM*rz+cz,...
    'FaceColor','blue','EdgeColor','none');
topo = fliplr(imread('lunar_topo.jpg'));
set(hPlanet,'facecolor','texture','cdata',topo,...
    'edgecolor','none');
if rotate_180==1
  rotate(hPlanet,[0,0,1],180);
end
end
