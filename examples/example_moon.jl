"""
Plot Moon
"""

include("../src/PLOTLAB.jl")

PLOTLAB.close_all()
fig = PLOTLAB.figure(3)

# plot Moon
radii = [1737.0, 1737.0, 1737.0]
center = [0.0,0.0,0.0]
PLOTLAB.plot_moon(radii, center)

# save
PLOTLAB.saveas(fig, "example_moon.png")
