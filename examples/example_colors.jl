"""
Example for various ways of plotting colors
"""

using Plots   # for defining color palettes

include("../src/PLOTLAB.jl")

function trajectory_random(steps::Int=1000)
    ts = LinRange(0, 4*2π, steps)
    ω = rand()
    ϕ, ϕz = π*rand(), π*rand()
    radius = 0.3rand() + 0.7
    coord = zeros(3,length(ts))
    for (i,t) in enumerate(ts)
        coord[:,i] = radius * sin(0.2t) * [
            sin(ω*t + ϕ),
            cos(ω*t + ϕ),
            cos(0.1t + ϕz)
        ]
    end
    return coord
end

traj1 = trajectory_random()
traj2 = trajectory_random()
traj3 = trajectory_random()
traj4 = trajectory_random()

color_list = cgrad(:hawaii)

PLOTLAB.close_all()

PLOTLAB.figure()
PLOTLAB.plot3(traj1[1,:], traj1[2,:], traj1[3,:], lw=1.5, color="blue")           # MATLAB color names
PLOTLAB.plot3(traj2[1,:], traj2[2,:], traj2[3,:], lw=1.5, color=:gold)            # Julia color symbol
PLOTLAB.plot3(traj3[1,:], traj3[2,:], traj3[3,:], lw=1.5, color=[1.0, 0.0, 0.0])  # vector [r,g,b]
PLOTLAB.plot3(traj4[1,:], traj4[2,:], traj4[3,:], lw=1.5, color=color_list[1])    # color object
