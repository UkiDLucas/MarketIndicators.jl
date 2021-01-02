#include("../Julia/IndicatorData.jl") # addIndicator!()

function trim_DataFrames!(data::Dict{String, IndicatorData.Indicator})
    oldest = get_oldest_common_day(data)
    println("oldest = ", oldest, " ", typeof(oldest))

    newest = get_newest_common_day(data)
    println("newest = ", newest, " ", typeof(oldest))

    
    ## Iterate thru each Indicator
    for key in keys(data) 
        local df = data[key].df
        #println(" - BEFORE ", data[key].name, " size ", size( df) ) 
        
        oldest_row = find_Rata_Die(df, oldest)
        newest_row = find_Rata_Die(df, newest)
        
        df = df[oldest_row:newest_row, :] # trimming rows, columns stays same
        #println(" - AFTER  ", data[key].name, " size ", size( df ) ) 
    end
end



function get_newest_common_day(data::Dict{String, IndicatorData.Indicator})
    v = Int64[]

    for key in keys(data) 
        println(" - ", data[key].name, " max_rata_die = ", data[key].max_rata_die ) 
        push!(v, data[key].max_rata_die)
    end
    return minimum( v)
end


function get_oldest_common_day(data::Dict{String, IndicatorData.Indicator})
    v = Int64[]

    for key in keys(data) 
        println(" - ", data[key].name, " min_rata_die = ", data[key].min_rata_die ) 
        push!(v, data[key].min_rata_die)
    end
    return maximum( v)
end