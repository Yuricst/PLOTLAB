module PLOTLAB

try
	using MATLAB
	foo = hoge
catch
	println("Skipping MATLAB import!")
end

using DocStringExtensions

# add path to matlab functions
matlab_path = string(joinpath(dirname(@__FILE__), "matlab"))
mat"addpath($matlab_path)"

include("wrappers.jl")

export plot_earth_geoid

end # module
