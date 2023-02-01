module PLOTLAB

using MATLAB
using DocStringExtensions
using Colors

# add path to matlab functions
matlab_path = string(joinpath(dirname(@__FILE__), "matlab"))
mat"addpath($matlab_path)"

include("wrappers.jl")

export plot_earth_geoid

end # module
