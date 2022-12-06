```@meta
CurrentModule = TensorMarket
```

# TensorMarket

This is a repository for sparse tensor file storage.

Currently supporting the following formats:

* `.ttx` through [`ttread()`](@ref) and [`ttwrite()`](@ref).

    * The `.ttx` format is a straightforward generalization of [`.mtx`](https://math.nist.gov/MatrixMarket/formats.html) to support arbitrarily many indices. The file should specify `tensor` instead of `matrix`, but otherwise is the same. The `.ttx` format is also supported by the [TACO](http://tensor-compiler.org/) sparse tensor compiler.

* [`.tns`](http://frostt.io/tensors/file-formats.html) through [`tnsread()`](@ref) and [`tnswrite()`](@ref)

    * The `.tns` format is the format used by the FROSTT tensor collection.

```@index
```

```@autodocs
Modules = [TensorMarket]
```
