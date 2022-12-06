using TensorMarket
using Test

@testset "TensorMarket.jl" begin
    test_dir = mktempdir()

    # tns read/write

    for (name, (I, V)) in [
        ("matmul_2-2-2", (
            (
                [1, 3, 1, 3, 2, 4, 2, 4], 
                [1, 2, 3, 4, 1, 2, 3, 4], 
                [1, 1, 2, 2, 3, 3, 4, 4]
            ), 
            [true, true, true, true, true, true, true, true]
        )),
        ("neurips-small", (
            (
                [1, 1, 1, 1, 1, 1, 15],
                [8, 37, 43, 81, 81, 48, 48],
                [16, 15, 15, 15, 12, 14, 16],
                [1, 1, 1, 1, 1, 1, 1]
            ),
            [2, 1, 1, 2, 1, 1, 1]
        )),
        ("lpi_itest6", (
            (
                [1, 2, 3, 4, 5, 6, 7, 8, 11, 2, 4, 5, 9, 10, 11, 1, 4, 6, 9, 10, 1, 5, 10, 7, 8, 3, 8, 7, 3],
                [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 13, 13, 13, 14, 14, 15, 15, 16, 17],
            ),
            [1.0, 1.0, 1.0, -1.0, -1.0, 1.0, -1.0, 1.0, -1.0, 1.0, -1.0, -1.0, 1.0, 1.0, 1.0, 0.8, 1.0, 1.0, -0.05, -0.04, 1.0, 1.0, -0.05, -3.0, 0.5, 2.0, 0.6, 1.0, -1.0]
        )),
        ("nil", (
            (),
            Bool[]
        )),
        ("scalar_int", (
            (),
            [42]
        )),
        ("scalar_float", (
            (),
            [42.0]
        )),
    ]

        @testset "tight read/write $name" begin
            ref_tns_file = joinpath(@__DIR__, "data", "$name.tns")
            #tnswrite(ref_tns_file, I, V)
            @test tnsread(ref_tns_file) == (I, V)

            res_tns_file = joinpath(test_dir, "$name-test.tns")
            tnswrite(res_tns_file, I, V)

            @test success(`diff --strip-trailing-cr $ref_tns_file $res_tns_file`)

            ref_ttx_file = joinpath(@__DIR__, "data", "$name.ttx")
            #ttwrite(ref_ttx_file, I, V, maximum.(I, init = 0))
            @test ttread(ref_ttx_file) == (I, V, maximum.(I, init=0))

            res_ttx_file = joinpath(test_dir, "$name-test.ttx")
            ttwrite(res_ttx_file, I, V, maximum.(I, init = 0))

            @test success(`diff --strip-trailing-cr $ref_ttx_file $res_ttx_file`)
        end
    end

    for (name, (I, V, size)) in [
        ("nil0bool", (
            (),
            Bool[],
            ()
        )),
        ("nil1int", (
            (
                [],
            ),
            Int[],
            (0,),
        )),
        ("nil2float", (
            (
                [],
                [],
            ),
            Float64[],
            (0, 0,)
        )),
        ("empty1int", (
            (
                [],
            ),
            Int[],
            (11,)
        )),
        ("empty2float", (
            (
                [],
                [],
            ),
            Float64[],
            (42, 43)
        ))
    ]

        @testset "tight read/write $name" begin
            ref_ttx_file = joinpath(@__DIR__, "data", "$name.ttx")
            #ttwrite(ref_ttx_file, I, V, size)
            @test ttread(ref_ttx_file) == (I, V, size)

            res_ttx_file = joinpath(test_dir, "$name-test.ttx")
            ttwrite(res_ttx_file, I, V, size)

            @test success(`diff --strip-trailing-cr $ref_ttx_file $res_ttx_file`)
        end
    end

end
