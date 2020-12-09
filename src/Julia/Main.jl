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
    print_date_time(); fetch_web_data(df ); 
    print_date_time(); include("preprocess_DJI.jl")
    print_date_time(); include("preprocess_VIX.jl")
    print_date_time(); include("preprocess_AAPL.jl")
    print_date_time(); include("preprocess_NVDA.jl") 
    print_date_time(); include("preprocess_NIO.jl") # fix Rata_Die
    print_date_time(); include("preprocess_US_GDP_Q.jl")  
    print_date_time(); include("US_HOUS_STRT_M.jl")
    print_date_time(); include("ISM_Manufacturing_PMI.jl")
    print_date_time(); include("ISM_Manufacturing_Employment.jl")
    print_date_time(); include("US_INIT_JOBLESS.jl")  
    print_date_time(); include("US_PEND_HOME_SALE.jl") 
    
    print_date_time(); include("Uber_DataFrame.jl")

    print_date_time(); include("predict_NVDA.jl")
    print_date_time(); include("predict_VIX.jl")
    print_date_time(); include("predict_AAPL.jl")
    print_date_time(); include("predict_NIO.jl")
   
    print_date_time(); include("preditct_DJIA.jl")
    
    
    

    nap_time = 60*60*4 # seconds * minutes * hours
    print_date_time(); println("going to sleep for ", nap_time/(60*60), " hours" )
    sleep(nap_time) 
end # while loop