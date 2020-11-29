using Dates
function format_dates(dates, date_format="yy/mdd")
    # dates Array{String,1}
    columns = length(dates)
    results = Array{String, 1}(undef, columns) # define array to hold x-axis values

    for i in 1:columns
        if typeof(dates[i]) == Date
            results[i] = convert(String, Dates.format( dates[i], date_format ) )
        end
        if typeof(dates[i]) == String
            results[i] = convert( String,  Dates.format( Date(dates[i]), date_format ) )
        end 
    end

    return results
end