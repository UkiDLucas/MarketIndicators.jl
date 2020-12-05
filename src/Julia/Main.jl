## Directory where I store original data (copied form the Web, etc.)
# original_data_directory = "DATA\\original\\" # Windows 10
original_data_directory = "../DATA/original/" # MacOS

#include("MarketIndicators.jl")
include("function_update_yahoo_finance.jl")
include("function_fetch_web_data.jl")

using CSV, DataFrames, Dates
file_path = "../DATA/_DataSets.csv"
date_format="mm/dd/yyyy" # 9/14/2020
df = CSV.read( file_path, DataFrame, dateformat="$date_format" )
df[:, [1,3] ]

function print_date_time()
    println("============== ", Dates.DateTime(Dates.now() ), " ==============")
end # function

while true
        print_date_time()
    # fetch_web_data(df )
        print_date_time()
    include("^DJI.jl")
            print_date_time()
    include("^VIX.jl")
            print_date_time()
    include("US_Housing_Starts_mm.jl")
        print_date_time()
    include("ISM_Manufacturing_PMI.jl")
        print_date_time()
    include("ISM_Manufacturing_Employment.jl")
        print_date_time()
    include("Uber_DataFrame.jl")
        print_date_time()

    nap_time = 60*60*4 # seconds * minutes * hours
    println("going to sleep for ", nap_time/(60*60), " hours" )
    sleep(nap_time) 
end # while loop