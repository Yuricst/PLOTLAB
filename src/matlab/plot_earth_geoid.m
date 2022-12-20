function plot_earth_geoid(radius, ticks)
% Get plotting coordinates for 3D ellipsoids
%
% Args: 
%     radius: radius of globe
%     ticks: ticks for x, y, and z axes
%
% Example:
%    globe = plot_earth_geoid(1.0, [-1.5, -1, -0.5, 0, 0.5, 1, 1.5]);
% ------------------------------------------------------------------ %

	% plot earth
	axesm('globe', 'Geoid', [radius, 0], 'Grid', 'on');
	axis on;
	view(3);
	% Add an opaque surface
	base = zeros(180,360); baseref = [1 90 0];
	% fill surface in white
	hs = meshm(base,baseref,size(base),'HandleVisibility','off');
	colormap white;
	% plot coast lines
	load coastlines;  
	plotm(coastlat, coastlon, 'k','HandleVisibility','off');  % plot coast lines 

	xticks(ticks);
	yticks(ticks);
	zticks(ticks);
end