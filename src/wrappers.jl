"""
Wrapers to MATLAB functions
"""


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `close all` function
"""
function close_all()
	mat"close all"
end


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `close all` function along with plot configurations.
"""
function figure(
	view=3;
	size=[200,200,700,700],
	grid::Bool=true,
	axis_equal::Bool=true,
	box::Bool=true,
	hold_on::Bool=true,
	xlabel::String="x",
	ylabel::String="y",
	zlabel::String="z",
	xlim=nothing,
	ylim=nothing,
	zlim=nothing,
)
	fig = mat"figure('Position', $size)"

	# configure plot
	if grid == true
		mat"grid on"
	end

	mat"view($view)"

	if axis_equal == true
		mat"axis equal"
	end

	if box == true
		mat"box on"
	end

	if hold_on == true
		mat"hold on"
	end

	# labels
	is_3d = false
	if typeof(view) == Int
		if view == 3
			is_3d = true
		end
	else  # if giving camera angles
		is_3d = true
	end
	mat"xlabel($xlabel)"
	mat"ylabel($ylabel)"
	if is_3d
		mat"zlabel($zlabel)"
	end

	# limits to axes
	if isnothing(xlim) == false
		mat"xlim($xlim)"
	end
	if isnothing(ylim) == false
		mat"ylim($ylim)"
	end
	if is_3d == true && isnothing(zlim) == false
		mat"zlim($zlim);"
	end
	return fig
end


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `close all` function along with plot configurations.
"""
function figure!(grid::Bool=true, view::Int=3, axis_equal::Bool=true, box::Bool=true)
	# configure plot
	if grid == true
		mat"grid on"
	end

	mat"view($view)"

	if axis_equal == true
		mat"axis equal"
	end

	if box
		mat"box on"
	end
	return
end



"""
$(TYPEDSIGNATURES)

Plot Earth wireframe to current MATLAB figure with coastlines.
"""
function plot_earth_geoid(radius::Real, ticks)
	mat"plot_earth_geoid($radius, $ticks)"
end


function handle_color(color)
	if typeof(color) == Vector{Float64}
		r,g,b = color
		color_str = "[$r, $g, $b]"
	elseif typeof(color) == String
		color_str = color
	elseif typeof(color) == RGB{Float64} || typeof(color) == RGBA{Float64}
		r,g,b = color.r, color.g, color.b
		color_str = "[$r, $g, $b]"
	elseif typeof(color) == Symbol
		color_symbol = Colors.parse(RGBA{Float64}, color)
		r,g,b = color_symbol.r, color_symbol.g, color_symbol.b
		color_str = "[$r, $g, $b]"
	else
		println("Could not recognize color of type: ", typeof(color))
	end
	return color_str
end



"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `plot` function.
"""
function plot(xs, ys; lw::Real=1.0, color="blue", marker=nothing)
	color_str = handle_color(color)
	if isnothing(marker)
		mat"plot($xs, $ys, \"Color\", $color_str, \"LineWidth\", $lw)"
	else
		mat"plot($xs, $ys, \"Color\", $color_str, \"LineWidth\", $lw, \"Marker\", $marker)"
	end
end


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `plot3` function.
"""
function plot3(xs, ys, zs; lw::Real=1.0, color="blue", marker=nothing)
	color_str = handle_color(color)
	if isnothing(marker)
		mat"plot3($xs, $ys, $zs, \"Color\", $color_str, \"LineWidth\", $lw)"
	else
		mat"plot3($xs, $ys, $zs, \"Color\", $color_str, \"LineWidth\", $lw, \"Marker\", $marker)"
	end
end


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `scatter` function.
"""
function scatter(xs, ys; size=5, color="blue", marker::String='o')
	color_str = handle_color(color)
	mat"scatter3($xs, $ys, \"Size\", $size, \"Color\", $color_str, \"Marker\", $marker)"
end



"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `scatter3` function.
"""
function scatter3(xs, ys, zs; size=5.0, color="blue", marker::String='o')
	color_str = handle_color(color)
	mat"scatter3($xs, $ys, $zs)"
	#, \"MarkerSize\", $size, \"Color\", $color, \"Marker\", $marker)"
end


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `saveas` function
"""
function saveas(fig, filename::String)
	mat"saveas(gcf, $filename)"
	println("Saved gcf to $filename")
end


"""
$(TYPEDSIGNATURES)

Get x, y, z coordinates of ellipsoid wireframe
"""
function celestial_body(center, erad, prad, npanels)
	return mat"celestial_body($center, $erad, $prad, $npanels)"
end
