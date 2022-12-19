function plot_earth_geoid(radius, ticks)

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
	load coast;  
	plotm(lat, long, 'k','HandleVisibility','off');  % plot coast lines 

	xticks(ticks);
	yticks(ticks);
	zticks(ticks);
end