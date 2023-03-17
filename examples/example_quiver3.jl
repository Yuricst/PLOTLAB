"""
Example for quiver
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
thrusts = trajectory_random()
PLOTLAB.close_all()

PLOTLAB.figure()
PLOTLAB.plot3(traj1[1,:], traj1[2,:], traj1[3,:], lw=1.5, color=:dodgerblue)

N_quiver = 100
step = Int(round(size(traj1,2)/N_quiver))
PLOTLAB.quiver3(traj1[1,1:step:end], traj1[2,1:step:end], traj1[3,1:step:end],
    thrusts[1,1:step:end], thrusts[2,1:step:end], thrusts[3,1:step:end],
    scale=0.5, color=:red)

# save
PLOTLAB.saveas(fig, "example_quiver3.png")
