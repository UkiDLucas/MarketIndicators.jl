function toFloat64(column)
    new_column = map(x -> (
            x = ismissing(x) ? "" : x;  # no method matching tryparse(::Type{Float64}, ::Missing)
            x = tryparse(Float64, x);   # returns: Float64 or nothing
            isnothing(x) ? missing : x; # options: missing, or "", or 0.0, or nothing
            ), column)  # input 
    # returns Array{Float64,1} OR Array{Union{Missing, Float64},1}
    return new_column
end






function XtoFloat64(data_array)
    println("NOT FINISHED")
    
    record_count = size(data_array)[1]
    new_array = [ 0.0, 0.0, 0.0, 0.0, Base.missing] # Union{Missing, Float64}[0.0, 0.0, 0.0, 0.0, missing]
    println(new_array)
    for i in 1:record_count
        value = data_array[i] 
        println(value)
        if ismissing(value)
            value = Base.missing
            println("ismissing ", value)
        elseif isnothing(value)
            println("isnothing ", value)
            value = Base.missing
        else
            println("tryparse ", value)
           value = tryparse(Float64, value)
        end 
        new_array[i] = value
    end #for
    return new_array
end # function

# https://stackoverflow.com/a/65163457/6312771
#data_array = ["1.2", "-1e3", "", Base.missing, "NA"]
#data = toFloat64(data_array)