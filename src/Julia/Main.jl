## Directory where I store original data (copied form the Web, etc.)
# original_data_directory = "DATA\\original\\" # Windows 10
original_data_directory = "../DATA/original/" # MacOS

#include("MarketIndicators.jl")
include("function_update_yahoo_finance.jl")
include("function_fetch_web_data.jl")
include("preprocess_csv.jl")
include("functions.jl") 
include("function_toFloat64.jl")
include("IndicatorData.jl") 
include("function_format_rata_die_to_us_date.jl")
include("function_trim_DataFrames.jl")
include("function_print_columns_features.jl")


function print_date_time()
    println("============== ", Dates.DateTime(Dates.now() ), " ==============")
end # function

print_date_time(); 

while true
    #fetch_web_data( "../DATA/Indicators.csv", original_data_directory ); 
    #include("Uber_DataFrame.jl"); print_date_time(); 

    #global symbol_to_predict = "AAPL"
    #include("predict_Julia_TuriCreate.jl"); print_date_time(); 
    
    symbol_to_predict = "AAPL" 
    include("predict_AAPL.jl"); print_date_time();

    symbol_to_predict = "BABA" 
    include("predict_BABA.jl"); print_date_time(); 
    
    #include("predict_BRK-B.jl"); print_date_time(); 
    #include("predict_BYC_USD.jl"); print_date_time(); 
    #include("predict_BYDDF.jl"); print_date_time(); 
    #include("predict_CRSP.jl"); print_date_time(); 
    #include("predict_DJIA.jl"); print_date_time(); 
    #include("predict_F.jl"); print_date_time(); 
    #include("predict_FB.jl"); print_date_time(); 
    #include("predict_GELYF.jl"); print_date_time(); 
    #include("predict_GOOG.jl"); print_date_time(); 
    #include("predict_GSPC.jl"); print_date_time(); 
    #include("predict_HD.jl"); print_date_time(); 
    #include("predict_MSFT.jl"); print_date_time(); 
    #include("predict_NVDA.jl"); print_date_time();  
    #include("predict_QCOM.jl"); print_date_time(); 
    #include("predict_RUT.jl"); print_date_time(); 
    #include("predict_TM.jl"); print_date_time(); 
    #include("predict_TPLGX.jl"); print_date_time();  
    #include("predict_TSLA.jl"); print_date_time();
    #include("predict_VIX.jl"); print_date_time(); 
    #include("predict_WMT.jl"); print_date_time();     
    
    
    
    
    nap_time = 60*60*6 # seconds * minutes * hours
    print_date_time(); println("going to sleep for ", nap_time/(60*60), " hours" )
    sleep(nap_time) 
end # while loop