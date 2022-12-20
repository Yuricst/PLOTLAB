function [xx,yy,zz] = celestial_body(center, erad, prad, npanels)
% Get plotting coordinates for 3D ellipsoids
%
% Args: 
%     erad: equatorial radius
%     prad: polar radius
%
% Returns:
%     [xx,yy,zz] coordinates for plotting
%
% Example:
%    globe = surf(xx, yy, zz, 'FaceColor', 'none',...
%				'EdgeColor', 'black',...
%                'LineWidth', 0.05);
% ------------------------------------------------------------------ %

[ xx, yy, zz ] = ellipsoid(0, 0, 0, erad, erad, prad, npanels);
xx = xx + center(1) * ones(size(xx));
yy = yy + center(2) * ones(size(yy));
zz = zz + center(3) * ones(size(zz));
end