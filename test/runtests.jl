using TensorMarket
using Test

@testset "TensorMarket.jl" begin
    # Write your tests here.
    matmul_result = (
        (
            [1, 3, 1, 3, 2, 4, 2, 4], 
            [1, 2, 3, 4, 1, 2, 3, 4], 
            [1, 1, 2, 2, 3, 3, 4, 4]
        ), 
        [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
    )
    @test tnsread("matmul_2-2-2.tns") == matmul_result
end
