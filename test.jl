using NLPModels, LinearAlgebra, Krylov
using Ipopt, NLPModelsIpopt
using JSOSolvers

include("AugLagModel.jl")
include("al.jl")

nlp = ADNLPModel(x->(x[1] - 1)^2 + 100*(x[2] - x[1]^2)^2, [-1.2; 1.0],
                lvar = [0.0; 0.0], uvar = [1.0; 1.0], c = x->[x[1] + x[2] - 1], lcon = [0.0], ucon = [0.0])
x, fx, normgL, normc, k = al(nlp)

nlp = ADNLPModel(x -> (x[1] - 1)^2 + 4 * (x[2] - 3)^2, zeros(2),
                 c=x->[sum(x) - 1.0], lcon = [0.0], ucon = [0.0])
x, fx, normgL, normc, k = al(nlp)