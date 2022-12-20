# PLOTLAB
Plotting spacecraft trajectories

`PLOTLAB` provides quick recipies for plotting trajectories using the MATLAB engine.
`PLOTLAB.jl` is a Julia wrapper to these MATLAB routines for generating plots directly from Julia, based on [`MATLAB.jl`](https://github.com/JuliaInterop/MATLAB.jl). 


## MATLAB requirements

- MATLAB license
- MATLAB version: developped on 2020a
- Toolboxes: 
	- Mapping Toolbox (for `plot_earth_geoid()` function)


## Usage via Julia

1. Make sure `MATLAB.jl` works on local Julia environment (install MATLAB, install `csh`)
2. `git clone` this repository & `cd` into `PLOTLAB`, then on Julia REPL `]dev .`
3. `using PLOTLAB` or `import PLOTLAB`

#### Julia Depenencies
- `MATLAB.jl`, `DocStringExtensions`

#### Examples

```julia
import PLOTLAB

PLOTLAB.close_all()     # close all figure
fig = PLOTLAB.figure(
	3,
	size=[200,200,500,500],
	box=true
)                       # create new figure

# plot Earth
ticks = [-1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5]
PLOTLAB.plot_earth_geoid(1, ticks)

# save
PLOTLAB.saveas(fig, "example_geoid.png")
```

- See `./examples` for more

## Usage via MATLAB

The MATLAB routines can of course be used directly by adding path. 

1. `git clone` this repository
2. `addpath` to the `src/matlab` directory in MATLAB, i.e.

```matlab
addpath('/path/to/PLOTLAB/src/matlab')
```


## Main functions

#### Plotting spheres: 

- Obtain coordinates of 3D ellipsoid as wireframe: `celestial_body()`
- Plot Earth with coast lines: `plot_earth_geoid()`


## Gallery

- Geoid plot

<p align="center">
    <img src="./examples/example_geoid.png" width="550" title="example_geoid">
</p>
