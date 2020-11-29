
function find_day(df::DataFrame, day::Int64)
    #found_items = df[df.Day .== uber_min_day, 1] # Array{Float64,1}
    bit_array_01 = ( df.Day .== day )
    
    for id in 1:13066
        if bit_array_01[id] == true
            #println(id, " ", bit_array_01[id])
            return id
        end
    end
end
