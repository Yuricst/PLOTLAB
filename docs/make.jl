"""
Make documentation
"""

using Documenter
using DocStringExtensions
push!(LOAD_PATH, "../src/")
#using PLOTLAB
include("../src/PLOTLAB.jl")

makedocs(
	sitename="PLOTLAB.jl",
	format   = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true"
    ),
	#format = :html,
	pages = [
		"Home" => "index.md",
		"API" => "api.md",
	],
	# assets=[
    #     "assets/logo.png",  # for logo
    # ],
)


deploydocs(;
    repo="github.com/yuricst/PLOTLAB",
)