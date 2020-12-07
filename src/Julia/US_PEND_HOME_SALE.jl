dataset_file_name = "united-states.pending-home-sales-mm.csv"
date_original_format = "yyyy.mm.dd"
column_to_keep = 2 # Column number in the original file e.g. High or ActualValue
predict_days = 30 # number of days to predict

#verbose = true
verbose = false

path_data_original  = "../Data/original/"
path_data_processed = "../Data/processed/"
include("../Julia/functions.jl") 
println()

## show available datasets
#data = available_datasets() # uncomment to see all available datasets

# Read DataFrame from the CSV file.
df = fetch_dataset(dataset_file_name, date_original_format , path_data_original )

if verbose
    preview_data(df)
end

println()

if verbose
    using Statistics
    describe(df)
end

include("../Julia/function_toFloat64.jl")

using DataFrames
df = DataFrame( 
                  Date      = df[:,1]               # 2 
                , Original  = toFloat64( df[:,column_to_keep] )  # 3 
                , Quantized = toFloat64( df[:,column_to_keep] )  # 4 
               )

df = sort(df, [ :Date ]);

if verbose
    columns = preview_data(df)
end
println()

## Insert the Rata Die Column
record_count = size(df)[1]
insert_localtion = 1
insertcols!(df, insert_localtion, :Rata_Die => zeros(Int64, record_count); makeunique = true )
println()

using Dates
columns = names(df)
if verbose
    println(columns)
end

future_rata_die = Dates.datetime2rata( today() ) + predict_days # Int64  days from now
future_date = Dates.rata2datetime( future_rata_die) # Date
println(future_date)
push!(df, [ future_rata_die future_date 0.0 0.0 ])

## sort by Day (Rata Die)
df = sort(df, [:Rata_Die]);
if verbose
    ## show last row
    last_row = size(df)[1]
    df[last_row,:]
end

update_rata_die!(df, 1, 2)

if verbose
    first(df, 6)
    println("Inserted Rata Die")
end

populate_missing_dates!(df)

df = sort(df, [:Rata_Die]);

## remove last row
record_count = size(df)[1]
df = df[1:record_count-1,:]

if verbose
    println( preview_data(df) )
    println()
end

if verbose
    using Plots
    count = size(df)[1]
    rows = 1:count
    dates = format_dates( df[rows,2] , "m/d/yy")

    gr()
    plot(          dates, # x-axis: dates
                   [ df[rows,:Quantized]    ], # y-axis
        label    = [ "Quantized"  ""],
        legend   =:topleft, 
                  # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
        xlabel   = "time",
        ylabel   = "indicators",
        size     = (980, 400), # width, height
        layout = (1, 1) # number of graphs: vertically, horizontally
        )
end

data_original = df[:,3] # keep original for display comparison later

quantize_column!(df,4)

if verbose
    using Statistics
    describe(df)
end

if verbose
    using Plots

    count = size(df)[1]
    rows = 1:count
    dates = format_dates( df[rows,2] , "m/d/yy")

    gr()
    plot(          dates, # x-axis: dates
                   [  df[rows,:Quantized]    ], # y-axis
        label    = [  "Quantized" ""   ]  ,
        legend   =:topleft, 
                  # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
        xlabel   = "time",
        ylabel   = "indicators",
        size     = (980, 400), # width, height
        layout = (1, 1) # number of graphs: vertically, horizontally
        )
end

averages005 = calculate_average(df, 5,   :Quantized )
averages030 = calculate_average(df, 30,  :Quantized )
averages060 = calculate_average(df, 60,  :Quantized )
averages090 = calculate_average(df, 90,  :Quantized )
averages120 = calculate_average(df, 120, :Quantized )
averages180 = calculate_average(df, 180, :Quantized )
println()

if verbose
    using Plots

    columns = names(df)
    record_count = size(df)[1]
    days_back = 700
    rows = record_count-days_back:record_count # count-days_back:count
    dates = format_dates( df[rows,2] , "m/d/yy")

    gr()
    plot( dates, # x-axis: dates
        [ 
            df[rows,:Quantized] averages005[rows] averages030[rows] averages060[rows] averages120[rows] averages180[rows]  
        ], # y-axis
        label    = [ "Quantized" "averages005" "averages030" "averages060" "averages120" "averages180"   ""],
        legend   =:topleft, 
                  # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
        xlabel   = "time",
        ylabel   = "indicators",
        size     = (980, 400), # width, height
        layout = (1, 1) # number of graphs: vertically, horizontally
        )
end

insertcols!(df,  5,  :Avg005   => averages005  , makeunique=true)
insertcols!(df,  6,  :Avg030   => averages030  , makeunique=true)
insertcols!(df,  7,  :Avg060   => averages060  , makeunique=true)
insertcols!(df,  8,  :Avg090   => averages090  , makeunique=true)
insertcols!(df,  9,  :Avg120   => averages120  , makeunique=true)
insertcols!(df, 10,  :Avg180   => averages180  , makeunique=true)

if verbose
    using Statistics
    describe(df)
end

## Always show
using Statistics
describe(df)

save_dataset(df, dataset_file_name, path_data_processed );
println("Finished and saved to ", dataset_file_name)
