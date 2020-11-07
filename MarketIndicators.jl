# import Pkg; Pkg.add("CSV")
using CSV

# import Pkg; Pkg.add("Dates")
using Dates

# import Pkg; Pkg.add("DataFrames")
using DataFrames

# https://docs.julialang.org/en/v1/stdlib/Dates/#Dates.now-Tuple{}
# https://github.com/JuliaLang/julia/issues/37480

function updated() 
    println( "Last update: ", Dates.format(Dates.now(), "u. d, yyyy HH:MM"))
end


using CSV, DataFrames





function available_datasets()
    file_name="_DataSets.csv"
    date_format="yyyy-mm-dd"
    df = CSV.read( file_name, dateformat=date_format)

    return df[:,[1,2]]
end





using DataFrames, CSV
function fetch_dataset( 
        file_name="TPLGX.csv", 
        date_format="yyyy.mm.dd", 
        dir="DATA\\original\\"
    )

    file_path = dir * file_name
    println(file_path)

    df = CSV.read(file_path, dateformat=date_format)
    df = sort(df, [:Date]);
    return df
end








function save_dataset(
        df::DataFrame,
        file_name="undefined.csv", 
        dir="./Data/processed/"
    )

    file_path = dir*file_name
    CSV.write( file_path, df, delim=',' ) # , header=true
    return file_path
end



function preview_data(df, show_rows = 6)
    all_rows = size(df)[1]
    
    if all_rows < show_rows
        show_rows = all_rows
    end
    
    interval = convert(Int64, round(all_rows/show_rows, digits=0))
    rows = collect(1:interval:all_rows)
    show(df[ rows, :], allcols=true) # do NOT limit number of columns if more than 6

    println("\n Dataset dimentions: ", size(df) )
    println("\n Column numbering:")
    columns = names(df)
    for i in 1:length(columns)
        println(i, " ", columns[i])
    end
    return columns
end


  



using Dates
function format_dates(dates, date_format="yy/mdd")
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






function fetch_data(file_path, date_format="yyyy-mm-dd")
    isfile(file_path) || # does file exist locally?
        download( string("https://raw.githubusercontent.com/UkiDLucas/MarketIndicators.jl/master/", 
            file_path), # URL
        file_path) # save it as name
    
    return CSV.read(        # returns DataFrame
        file_path, 
        dateformat="$date_format"
        )
end








function shift_dates_by_days!(df::DataFrame, shift_days::Int64=-1, date_column::Int64=1)
    rows = size(df)[1]
    
    for row in 1:rows
        original = Date(df[row, date_column]) 
        shifted = original + Dates.Day(shift_days)
        # println("original ", original, " ", shift_days, " shift ", shifted)
        df[row, date_column] = shifted
    end
    return df
end






using Dates






function update_rata_die!(df, days_column=1, date_column=2)
    rows = size(df)[1] # first part of the returned tupple

    for row = 1:rows
        df[row, days_column] = Dates.datetime2rata( Date(df[row, date_column]) ) 
    end
    return df
end




function add_rata_die_column!(df)
    rows = size(df)[1] # first number of the tuple
    # https://stackoverflow.com/a/63731422/6312771
    insertcols!(df, 1,  :Rata_Die => 1:rows, makeunique=true) # insert as column 1, populate with 1,2,3,..
    #insert!(df, 1, zeros(Int64, rows), :Rata_Die)

    update_rata_die!(df, 1, 2) # Rata_Die column, Date column
    columns = preview_data(df)
end







using Statistics 

# Fit dataset in range [-128, 127]
# https://www.tensorflow.org/lite/performance/quantization_spec?hl=fi
# https://en.wikipedia.org/wiki/Standard_score
# https://www.wikihow.com/Calculate-Standard-Deviation
# http://www.differencebetween.net/science/difference-between-average-and-mean/
# 
function quantize_column!(df::DataFrame, column_number::Int64)
    original = df[:, column_number] # Array{Float64,1}
 
    min = minimum(original)
    max = maximum(original)
    #population_mean = mean(original)
    #standard_deviation = std(original)
    
    bias = (0 - min)/(max-min)
    println("bias for 0 value: ", bias)
    
    items = length(original)
    
    for i in 1:items
        #value = (original[i] - population_mean) / standard_deviation
        value = (original[i] -min)/(max-min)   # normalization formula to range 0.0 to 1.0
        #value = value + bias
        value = value * 255                    # 0.0 to 255
        value = value - 128                    # -128 to 127
        value = round(value, digits=0)         # 0.00 
        #value = convert(Int64, value)         # if DataFrame column is of type Float64, it will not save Int64
        df[i, column_number] = value
    end
    println("Normalization was performend using formula y=(((x-min)/(max-min))*255)-128 ") #TODO extract method
    println("minimum = $min")
    println("maximum = $max")
    println("Save these values for later to run model preditions")
    return (min, max)
end




using Statistics
function add_overal_mean!(df)
    record_count = size(df)[1]
    column_count = size(df)[2]
    
    insert!(df, column_count+1, zeros(Float64, record_count), :Mean)
    mean_actual = round(mean(df1[3]), digits=1) 
    #a = zeros(record_count)
    for row in 1:record_count
        df[row, column_count+1]= mean_actual
    end
end


# leave last
println("")


using DataFrames, Statistics

function calculate_average(df::DataFrame, average_days=90, column_to_average=3)
    record_count = size(df)[1]
    averages = zeros(Float64, record_count) # empty array
    
    for i in average_days:record_count
        day_this = df[i,1] # rata die 
        previous_interval_values = df[i-average_days+1:i, column_to_average]
        avg = round( mean(previous_interval_values) , digits=2) 
        averages[i] = avg
    end
    return averages
end






function position_on_date(df, date_string="2020-09-25")
    date = Date(date_string, "yyyy-mm-dd") # typeof Date
    found_items = df[df.Date .== date, 3] # Array{Float64,1}, find all rows for given date, and get value from column 3  

    record_count = size(df)[1]    # number of rows in the whole dataset
    position = zeros(Float64, record_count) # zero-fill array

    position .= found_items[1]

    # if length(found_items) > 0
    #     for i in 1:record_count
    #         position[i] = found_items[1]
    #     end
    # end

    return position
end





using Printf
function update_yahoo_finance(uri::String, interval = "1d")
    str_interval = "&interval=" * interval
    str_events = "&events=history"
    unix_date_now = @sprintf("%.0f", Dates.datetime2unix(Dates.now()))
    cut_position = findfirst("period2=", uri)[end] # take only second element of the tuple
    str_begining = uri[1:cut_position]
    uri = str_begining * unix_date_now * str_interval * str_events
    return uri
end


println() # prevents the last function from printing