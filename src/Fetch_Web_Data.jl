## This code still does not run
## Error: Download failed: curl: URL, maybe it can only work from the browser (notebook)?
## ERROR: LoadError: failed process: 
## Process(`/usr/bin/curl -s -S -g -L -f -o 
## ./DATA/original/NVDA.csv 
## 'https://query1.finance.yahoo.com/v7/finance/download/NVDA?period1=916963200&period2=1606655177&interval=1d&events=history'`, 
## ProcessExited(23)) [23]


## Directory where I store original data (copied form the Web, etc.)
# original_data_directory = "DATA\\original\\" # Windows 10
original_data_directory = "src/DATA/original/" # MacOS

#include("MarketIndicators.jl")
include("function_update_yahoo_finance.jl")

using CSV, DataFrames, Dates
file_path = "src/DATA/_DataSets.csv"
date_format="mm/dd/yyyy" # 9/14/2020
df = CSV.read( file_path, DataFrame, dateformat="$date_format" )
df[:, [1,3] ]

names(df)

row_count = size(df)[1]

while true
    println("============== ", Dates.DateTime(Dates.now() ), " ==============")
    
    for row in 1:row_count
        indicatior_name  = df[row, 1]
        file_name        = df[row, 2]
        url              = df[row, 3]
        if !isnothing(findfirst("finance.yahoo.com", url))
            url = update_yahoo_finance(url)
        end
        download( url , string(original_data_directory * file_name ) )
        println( "- downloaded: ", indicatior_name, " 
            -- ", file_name, "
            -- ", url ) 
        r_array = (rand(1)*9).+1  # 1.0.. to 9.9.. seconds
        r = r_array[1]
        sleep(r)            # to prevent being blocked
    end
    
    nap_time = 60*60*4 # seconds * minutes * hours
    println("going to sleep for ", nap_time/(60*60), " hours" )
    sleep(nap_time) 
end