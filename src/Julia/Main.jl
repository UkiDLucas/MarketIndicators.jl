## Directory where I store original data (copied form the Web, etc.)
# original_data_directory = "DATA\\original\\" # Windows 10
original_data_directory = "../DATA/original/" # MacOS

#include("MarketIndicators.jl")
include("function_update_yahoo_finance.jl")
include("function_fetch_web_data.jl")
include("preprocess_csv.jl")
include("functions.jl") 
include("function_toFloat64.jl")

function print_date_time()
    println("============== ", Dates.DateTime(Dates.now() ), " ==============")
end # function

print_date_time();

while true
    fetch_web_data( "../DATA/Indicators.csv", original_data_directory ); 
    #include("preprocess_DJI.jl"); print_date_time(); 
    #include("Uber_DataFrame.jl"); print_date_time(); 
    #include("predict_NVDA.jl"); print_date_time(); 
    
    nap_time = 60*60*4 # seconds * minutes * hours
    print_date_time(); println("going to sleep for ", nap_time/(60*60), " hours" )
    sleep(nap_time) 
end # while loop