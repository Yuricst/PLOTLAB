# PLOTLAB
Plotting spacecraft trajectories

`PLOTLAB` provides quick recipies for plotting trajectories using the MATLAB engine.
`PLOTLAB.jl` is a Julia wrapper to these MATLAB routines for generating plots directly from Julia, based on `MATLAB.jl`. 


### MATLAB requirements

- MATLAB license
- MATLAB version: developped on 2020a
- Toolboxes: 
	- Mapping Toolbox (for `plot_earth_geoid()` function)


### Usage via Julia

1. Make sure `MATLAB.jl` works on local Julia environment
2. `git clone` this repository & `cd` into `PLOTLAB`, then on Julia REPL `]dev .`
3. `using PLOTLAB` or `import PLOTLAB`

#### Julia Depenencies
- `MATLAB.jl`, `DocStringExtensions`


### Usage via MATLAB

1. `git clone` this repository
2. `addpath` to the `matlab` directory, e.g.

```matlab
addpath('/path/to/PLOTLAB/matlab')
```


### Main functions

Plotting Earth: 

- MATLAB function: `plot_earth_geoid()`