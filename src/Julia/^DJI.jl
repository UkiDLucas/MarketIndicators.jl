dataset_file_name = "^DJI.csv"
path_data_original = "../Data/original/"
date_original_format = "yyyy-mm-dd"
column_to_keep = 3 # High

include("../Julia/functions.jl") 
println()

## show available datasets
#data = available_datasets() # uncomment to see all available datasets

# Read DataFrame from the CSV file.
df = fetch_dataset(dataset_file_name, date_original_format , path_data_original )

#preview_data(df)
println()

using Statistics
describe(df)

using DataFrames
df = DataFrame( 
                  Date      = df[:,1]               # 2 
                , Original  = df[:,column_to_keep]  # 3 
                , Quantized = df[:,column_to_keep]  # 4 
               )

df = sort(df, [ :Date ]);

#columns = preview_data(df)
println()

## Insert the Rata Die Column
record_count = size(df)[1]
col_ind = 1
insertcols!(df, col_ind, :Rata_Die => zeros(Int64, record_count); makeunique = true )
println()

using Dates
columns = names(df)
println(columns)

future_rata_die = Dates.datetime2rata( today() ) + 31 # days from now
future_date = Dates.rata2datetime( future_rata_die)
push!(df, [ future_rata_die future_date 0 0 ])

# sort by Day (Rata Die)
df = sort(df, [:Rata_Die]);

## show last row
#last_row = size(df)[1]
#df[last_row,:]

update_rata_die!(df, 1, 2)

#first(df, 6)
println("Inserted Rata Die")

populate_missing_dates!(df)

df = sort(df, [:Rata_Die]);

## remove last row
record_count = size(df)[1]
df = df[1:record_count-1,:]

println( preview_data(df) )
println()

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

data_original = df[:,3] # keep original for display comparison later

quantize_column!(df,4)

using Statistics
describe(df)

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

averages005 = calculate_average(df, 5,   :Quantized )
averages030 = calculate_average(df, 30,  :Quantized )
averages060 = calculate_average(df, 60,  :Quantized )
averages090 = calculate_average(df, 90,  :Quantized )
averages120 = calculate_average(df, 120, :Quantized )
averages180 = calculate_average(df, 180, :Quantized )
averages365 = calculate_average(df, 365, :Quantized )
println()

using Plots

columns = names(df)
record_count = size(df)[1]
days_back = 120
rows = record_count-days_back:record_count # count-days_back:count
dates = format_dates( df[rows,2] , "m/d/yy")

gr()
plot(          dates, # x-axis: dates
               [ df[rows,:Quantized] averages030[rows] averages060[rows] averages120[rows]  ], # y-axis
    label    = [ "Quantized" "averages030" "averages060" "averages120" ],
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )

insertcols!(df,  5,  :Avg030   => averages030  , makeunique=true)
insertcols!(df,  6,  :Avg060   => averages060  , makeunique=true)
insertcols!(df,  7,  :Avg090   => averages090  , makeunique=true)
insertcols!(df,  8,  :Avg120   => averages120  , makeunique=true)
insertcols!(df,  9,  :Avg180   => averages180  , makeunique=true)
insertcols!(df, 10,  :Avg365   => averages365  , makeunique=true)

using Statistics
describe(df)

using Statistics
describe(df)

save_dataset(df, dataset_file_name, "../Data/processed/" );
println("Finished and saved to ", dataset_file_name)
