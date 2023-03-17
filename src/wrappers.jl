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
function plot_earth_geoid(radius::Float64, ticks)
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
	quiver3(xs, ys, zs, us, vs, ws; scale::Real=1.0, lw::Real=1.0, color="red")

Plot 3D quiver on current figure.
"""
function quiver3(xs, ys, zs, us, vs, ws; scale::Real=1.0, lw::Real=1.0, color="red")
	color_str = handle_color(color)
	if isnothing(scale)
		mat"quiver3($xs, $ys, $zs, $us, $vs, $ws, \"Color\", $color_str, \"LineWidth\", $lw)"
	else
		mat"quiver3($xs, $ys, $zs, $us, $vs, $ws, $scale, \"Color\", $color_str, \"LineWidth\", $lw)"
	end
end


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `saveas` function
"""
function saveas(fig, filename::String)
	mat"saveas(gcf, $filename)"
	println("Saved gcf to $filename")
end


# """
# $(TYPEDSIGNATURES)
#
# Get x, y, z coordinates of ellipsoid wireframe
# """
# function celestial_body(center, erad, prad, npanels)
# 	return mat"celestial_body($center, $erad, $prad, $npanels)"
# end


"""
Plot sphere to existing figure using `sphere()` and `surf()` functions.
"""
function plot3_sphere(center::Vector, r::Real, n::Int=20)
	mat"[X,Y,Z] = sphere($n);"
	_X = @mget X
	_Y = @mget Y
	_Z = @mget Z
	X2 = _X * r + center[1]*ones(size(_X))
	Y2 = _Y * r + center[2]*ones(size(_Y))
	Z2 = _Z * r + center[3]*ones(size(_Z))
	mat"surf($X2, $Y2, $Z2)"
end


"""
Investigate matrix with `spy()` function.
"""
function spy(matrix, marker_spec::String="ro")
	mat"spy($matrix, $marker_spec)"
end


"""
	plot_moon(radii::Vector{Float64}, center::Vector{Float64}, rotate_180::Int=1)

Plot Moon with topology map.
Radii given in [x,y,z] directions, and center [x,y,z].
If `rotate_180==1`, then map is rotated by 180 deg about [0,0,1].
"""
function plot_moon(radii::Vector{Float64}, center::Vector{Float64}, rotate_180::Int=1)
  # unpack arguments
  rx, ry, rz = radii[1:3]
  cx, cy, cz = center[1:3]
  mat"plot_moon($rx, $ry, $rz, $cx, $cy, $cz, $rotate_180)"
end
