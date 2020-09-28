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


if show_help
    println("
        usage:
              show_help = true
              include(\"dataset_IO.jl\") 
    ")
end




function available_datasets()
    file_name="_DataSets.csv"
    date_format="yyyy-mm-dd"
    df = CSV.read( file_name, dateformat=date_format)

    return df[:,[1,2]]
end

if show_help
    println("
        usage:
              # returns a DataFrame with all available data sets (name, file_path)
              df = available_datasets() 
    ")
    println("
        usage: 
              # 5th dataset: DJIA, 
              # 2nd column: file-name
              dataset_file_name = available_datasets()[5,2] 
    ")
end






function fetch_dataset(
    file_name="TPLGX", 
    date_format="yyyy.mm.dd", 
    dir="D:\\Drive\\market_indicators_data\\original\\"
    )

    df = CSV.read(dir * file_name, dateformat=date_format)
    return df
end


if show_help
    println("
        usage: 
              df = fetch_dataset(
                                 dataset_file_name, 
                                 date_format=\"u/dd/yy\", # format the saved dates are in
                                 dir=\"/mnt/data/indicators/original/\" ) # location of your data directory
    ")
end








function save_dataset(
    df::DataFrame,
    file_name="unknown", 
    dir="D:\\Drive\\market_indicators_data\\derived\\"
    )


    file_path = dir*file_name
    
    CSV.write(dir*file_name, df, delim=',', header=true)
    
    return file_path
end



function preview_data(df)
    println("
    Usage:
          preview_data(df)
          preview_data(df[1:2,1:3])
    ")
    
    all_rows = size(df)[1]
    show_rows = 20
    
    if all_rows < show_rows
        show_rows = all_rows
    end
    
    interval = convert(Int64, round(all_rows/show_rows, digits=0))
    rows = collect(1:interval:all_rows)
    show(df[ rows, :], allcols=true) # do NOT limit number of columns if more than 6
end




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







if show_help
    println("
        usage: 
              include(\"dataset_IO.jl\") 
              file_path = save_dataset(
                                       df::DataFrame,
                                       file_name=\"my_file_name.csv\", 
                                       dir=\"/mnt/data/indicators/derived/\" ) # location of your data directory
    ")
end






file_ISM_Mfc_Emp = "data/united-states.ism-manufacturing-employment.csv"
file_Markkit_Mfc_PMI = "data/united-states.markit-manufacturing-pmi.csv"
file_initial_jobless_claims = "data/united-states.initial-jobless-claims.csv"

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

println("function: df = fetch_data(file_path, date_format=\"yyyy-mm-dd\" )")

# TEST
#df = fetch_data(file_ISM_Mfc_Emp, "yyyy.mm.dd")

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

# df = shift_dates_by_days!(df3, -90)
println("function: df = shift_dates_by_days!(df, shift_days=-1, date_column=1)")

first_date = Date("Jan. 1, 1900", "u. dd, yyyy")

day_one = Dates.datetime2rata(first_date) # typeof(rate_die) = Int64

function days_since_day_one(df, row, date_column) 
    date = df[row, date_column] # type Date
    rata_die = Dates.datetime2rata(date) 
    rata_die = rata_die - day_one
    return rata_die
end

println("function: rata_die = days_since_day_one(df, row, date_column) ")

function update_rata_die!(df, days_column=1, date_column=2)
    rows = size(df)[1] # first part of the returned tupple

    for row = 1:rows
        days = days_since_day_one(df, row, date_column)
        # println(days)
        df[row, days_column] = days
    end
    return df
end

println("function: df = update_rata_die!(df, days_column=1, date_column=2)")

function insert_rata_die_column!(df)
    rows = size(df)[1] # first number of the tuple
    # https://stackoverflow.com/a/63731422/6312771
    insertcols!(df, 1,  :Day => 1:rows, makeunique=true) # insert as column 1, populate with 1,2,3,..
    return df
end
println("function: df = insert_rata_die_column!(df)")








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


