# PLOTLAB
Plotting spacecraft trajectories

### MATLAB requirements

- MATLAB version: developped on 2020a
- Toolboxes: 
	- Mapping Toolbox (for `plot_earth_geoid()` function)


### Usage via Julia

1. Make sure `MATLAB.jl` works on local Julia environment
2. `git clone` this repository & `cd` into `PLOTLAB`, then on Julia REPL `]dev .`


### Usage via MATLAB

1. `git clone` this repository
2. `addpath` to the `matlab` directory, e.g.

```matlab
addpath('/path/to/PLOTLAB/matlab')
```