# """
# Wrapers to MATLAB functions
# """


"""
$(TYPEDSIGNATURES)

Wrap to MATLAB's `close all` function
"""
function close_all()
	mat"close all"
end


# """
# $(TYPEDSIGNATURES)

# Wrap to MATLAB's `close all` function along with plot configurations.
# """
# function figure(
# 	view::Int=3;
# 	size=[200,200,700,700],
# 	grid::Bool=true,
# 	axis_equal::Bool=true,
# 	box::Bool=true,
# 	hold_on::Bool=true,
# )
# 	fig = mat"figure('Position', $size)"

# 	# configure plot
# 	if grid == true
# 		mat"grid on"
# 	end

# 	mat"view($view)"
	
# 	if axis_equal == true
# 		mat"axis equal"
# 	end

# 	if box == true
# 		mat"box on"
# 	end

# 	if hold_on == true
# 		mat"hold on"
# 	end
# 	return fig
# end


# # """
# # $(TYPEDSIGNATURES)

# # Wrap to MATLAB's `close all` function along with plot configurations.
# # """
# # function figure!(grid::Bool=true, view::Int=3, axis_equal::Bool=true, box::Bool=true)
# # 	# configure plot
# # 	if grid == true
# # 		mat"grid on"
# # 	end

# # 	mat"view($view)"
	
# # 	if axis_equal == true
# # 		mat"axis equal"
# # 	end

# # 	if box
# # 		mat"box on"
# # 	end
# # 	return
# # end



# """
# $(TYPEDSIGNATURES)

# Plot Earth wireframe to current MATLAB figure with coastlines.
# """
# function plot_earth_geoid(radius::Real, ticks)
# 	mat"plot_earth_geoid(1, $ticks)"
# end


# """
# $(TYPEDSIGNATURES)

# Wrap to MATLAB's `plot3` function.
# """
# function plot3(xs, ys, zs; lw::Real=1.0, color="blue")
# 	mat"plot3($xs, $ys, $zs, \"Color\", $color)"
# end


# """
# $(TYPEDSIGNATURES)

# Wrap to MATLAB's `saveas` function
# """
# function saveas(fig, filename::String)
# 	mat"saveas(gcf, $filename)"
# 	println("Saved gcf to $filename")
# end