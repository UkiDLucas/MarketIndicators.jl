using Dates

function condense_dates(dates::Array{String,1}, date_format="yy/mdd")
    columns = length(dates)
    results = Array{String, 1}(undef, columns) # define array to hold x-axis values

    for i in 1:columns
        results[i] = string( Dates.format(Date(dates[i]), date_format)  ) 
    end
    
    return results
end

println("usage: 
                dates = condense_dates( df[1] ) # ::Array{String,1}
                dates = condense_dates( df[1], \"mm/dd/yyy\" ) # ::Array{String,1}
        ")
