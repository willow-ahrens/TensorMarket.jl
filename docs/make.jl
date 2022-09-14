using TensorMarket
using Documenter

DocMeta.setdocmeta!(TensorMarket, :DocTestSetup, :(using TensorMarket); recursive=true)

makedocs(;
    modules=[TensorMarket],
    authors="Willow Ahrens",
    repo="https://github.com/willow-ahrens/TensorMarket.jl/blob/{commit}{path}#{line}",
    sitename="TensorMarket.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://willow-ahrens.github.io/TensorMarket.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/willow-ahrens/TensorMarket.jl",
    devbranch="main",
)
