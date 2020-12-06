
function trim_DataFrames!(data::Dict{String,IndicatorData})
    oldest = get_oldest_common_day(data)
    println("oldest = ", oldest, " ", typeof(oldest))

    newest = get_newest_common_day(data)
    println("newest = ", newest, " ", typeof(oldest))

    
    ## Iterate thru each Indicator
    for key in keys(data) 
        println(" - BEFORE ", data[key].name, " size ", size( data[key].df) ) 
           
        oldest_row = find_day(data[key].df, oldest)
        newest_row = find_day(data[key].df, newest)
        
        data[key].df = data[key].df[oldest_row:newest_row, :] # trimming rows, columns stays same
        println(" - AFTER  ", data[key].name, " size ", size( data[key].df) ) 
    end
end



function get_newest_common_day(data::Dict{String,IndicatorData})
    v = Int64[]

    for key in keys(data) 
        println(" - ", data[key].name, " max_rata_die = ", data[key].max_rata_die ) 
        push!(v, data[key].max_rata_die)
    end
    return minimum( v)
end


function get_oldest_common_day(data::Dict{String,IndicatorData})
    v = Int64[]

    for key in keys(data) 
        println(" - ", data[key].name, " min_rata_die = ", data[key].min_rata_die ) 
        push!(v, data[key].min_rata_die)
    end
    return maximum( v)
end