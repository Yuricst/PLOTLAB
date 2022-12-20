"""
Make documentation
"""

using Documenter
push!(LOAD_PATH, "../src/")
using PLOTLAB

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
    #     "assets/psyche_symbol.png",  # for logo
    # ],
)


deploydocs(;
    repo="github.com/yuricst/PLOTLAB",
)