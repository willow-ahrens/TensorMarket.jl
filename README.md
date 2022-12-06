# TensorMarket

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://willow-ahrens.github.io/TensorMarket.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://willow-ahrens.github.io/TensorMarket.jl/dev/)
[![Build Status](https://github.com/willow-ahrens/TensorMarket.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/willow-ahrens/TensorMarket.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/willow-ahrens/TensorMarket.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/willow-ahrens/TensorMarket.jl)

This is a repository for sparse tensor file storage. 

Currently supporting the following formats:

* `.ttx` through [`ttread()`]() and [`ttwrite()`]().

    * The `.ttx` format is a straightforward generalization of [`.mtx`](https://math.nist.gov/MatrixMarket/formats.html) to support arbitrarily many indices. The file should specify `tensor` instead of `matrix`, but otherwise is the same. The `.ttx` format is also supported by the [TACO](http://tensor-compiler.org/) sparse tensor compiler.

* [`.tns`](http://frostt.io/tensors/file-formats.html) through [`tnsread()`]() and [`tnswrite()`]()

    * The `.tns` format is the format used by the FROSTT tensor collection.