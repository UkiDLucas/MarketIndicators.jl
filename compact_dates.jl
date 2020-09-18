include("available_datasets.jl"); 
dataset_file_name = available_datasets()[5,2]

include("fetch_dataset.jl"); 
df = fetch_dataset(dataset_file_name)
df[1]
using Dates

function compact_dates(dates) # df[:,1]  # Array of e.g. "1948-03-31"
    columns = length(dates)
    periods = Array{String, 1}(undef, columns) # define array to hold x-axis values


    for i in 1:length(dates)
        periods[i] = string( Dates.format(Date(dates[i]), "u'yy")  ) # e.g. Mar'48
    end

    return periods
end

println("usage: 
                dates = compact_dates( df[1] )
        ")
dates = compact_dates( df[1] )

