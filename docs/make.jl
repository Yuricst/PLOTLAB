"""
Make documentation
"""

using Documenter
using DocStringExtensions
push!(LOAD_PATH,"../src/")
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
		"Gallery" => "gallery.md",
	],
	# assets=[
    #     "assets/logo.png",  # for logo
    # ],
)


deploydocs(;
    repo   = "github.com/yuricst/PLOTLAB",
    target = "build",
    branch = "gh-pages",
)
