module BaseModelica

using ModelingToolkit
using Automa

"""
Holds the name of the package, the models in the package, and eventually BaseModelica records.
"""
struct BaseModelicaPackage
    name::Any
    model::Any
end

"""
Represents a BaseModelica model.
"""
struct BaseModelicaModel
    name::Any
    description::Any
    parameters::Any
    variables::Any
    equations::Any
    initialequations::Any
end

struct BaseModelicaParameter
    type::Any
    name::Any
    value::Any
    description::Any
end

struct BaseModelicaVariable
    type::Any
    name::Any
    description::Any
end

struct BaseModelicaEquation
    lhs::Any
    rhs::Any
    description::Any
end

struct BaseModelicaInitialEquation
    lhs::Any
    rhs::Any
    description::Any
end

# needed to parse derivatives in equations correctly
@variables t
der = Differential(t)

#Includes
include("parser.jl")
include("conversion.jl")
"""
    parse_basemodelica(filename::String)::ODESystem

Parses a BaseModelica .mo file into a ModelingToolkit ODESystem.

## Example

```julia
parse_basemodelica("testfiles/NewtonCoolingBase.mo")
```
"""
function parse_basemodelica(filename::String)
    model = parse_file(filename)
    baseModelica_to_ModelingToolkit(model.model)
end

export parse_basemodelica

end
