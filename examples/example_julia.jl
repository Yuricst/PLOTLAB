"""
Example with Julia
"""

include("../src/PLOTLAB.jl")

PLOTLAB.close_all()     # close all figure
fig = PLOTLAB.figure(
	3,
	size=[200,200,500,500],
	box=true
)                       # create new figure

# plot Earth
ticks = [-1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5]
PLOTLAB.plot_earth_geoid(1, ticks)

