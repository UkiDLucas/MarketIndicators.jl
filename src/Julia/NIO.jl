dataset_file_name = "NIO.csv"
path_data_original = "../Data/original/"
date_original_format = "yyyy-mm-dd"
original_value_column = 3 # High
last_position_change = "2020-09-30"

#include("../Julia/MarketIndicators.jl") 
include("../Julia/functions.jl")

println("Run this file from the directory where this file is located.")
pwd()

#data = available_datasets() # uncomment to see all available datasets

df = fetch_dataset(dataset_file_name, date_original_format , path_data_original )
record_count = size(df)[1]
println("data dimentions: ", size(df) )

#using Statistics
#describe(df)

columns = preview_data(df) # uncomment to see the data
println()

col_ind = 1
insertcols!(df, col_ind, :Rata_Die => zeros(Int64, record_count); makeunique = true )

update_rata_die!(df, 1, 2)
#first(df, 6)

#columns = preview_data(df, 3)
println()
# Comment out once done reviewing

using Plots

record_count = size(df)[1]
rows = 1:record_count
dates = format_dates( df[rows,2] , "m/d/yy")

gr()
plot(          dates, # x-axis: dates
               [  df[rows, original_value_column]    ], # y-axis
    label    = [  columns[ original_value_column]   "" ]  ,
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )
# Extract only the columns to be kept

using DataFrames
df = DataFrame( Day      = df[:,1],                     # 1 
                Date     = df[:,2],                     # 2 
                Value    = df[:,original_value_column], # 3 
                Original = df[:,original_value_column]  # 4 
               )

columns = preview_data(df)
println()

# Quantize the values

data_original = df[:, 4] # keep original for display comparison later

quantize_column!(df, 3)

columns = preview_data(df)
println()
# Comment out once done reviewing

using Plots

count = size(df)[1]
rows = 1:count
dates = format_dates( df[rows,2] , "m/d/yy")

gr()
plot(          dates, # x-axis: dates
               [  df[rows,3]    ], # y-axis
    label    = [  columns[3] ""   ]  ,
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )
populate_missing_dates!(df)

df = sort(df, [:Day]);
count = size(df)[1]
#first(df, 6)
# columns = preview_data(df)
println()
# Comment out once done reviewing

using Plots
count = size(df)[1]
rows = 1:count
dates = format_dates( df[rows,2] , "m/d/yy")

gr()
plot(          dates, # x-axis: dates
               [  df[rows,3]    ], # y-axis
    label    = [ columns[3]    ""  ],
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )
column_to_average = 3
averages005 = calculate_average(df, 5,   column_to_average )
averages030 = calculate_average(df, 30,  column_to_average )
averages090 = calculate_average(df, 90,  column_to_average )
averages180 = calculate_average(df, 180, column_to_average )
averages365 = calculate_average(df, 365, column_to_average )
println()

insertcols!(df, 5,  :Avg005   => averages005  , makeunique=true)
insertcols!(df, 6,  :Avg030   => averages030  , makeunique=true)
insertcols!(df, 7,  :Avg090   => averages090  , makeunique=true)
insertcols!(df, 8,  :Avg180   => averages180  , makeunique=true)
insertcols!(df, 9,  :Avg365   => averages365  , makeunique=true)

#using Statistics
#describe(df)
using Plots
count = size(df)[1]
days_back = 90
rows = count-days_back:count
dates = format_dates( df[rows,2] , "m/d/yy")

gr()
plot(   dates, # x-axis: dates
        [  df[rows,3] position_column[rows] averages005[rows] averages030[rows] averages090[rows] averages180[rows] 
        ], # y-axis
    label    = 
        [ columns[3] "position" "5-day avg" "30-day avg" "90-day avg" "180-day avg"  ""  ],
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )
#using Statistics
#describe(df)

save_dataset(df, dataset_file_name, "../Data/processed/" );


