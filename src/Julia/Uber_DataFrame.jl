dir="../Data/processed/"
dataset_file_name = "uber.csv"

include("../Julia/functions.jl") 
include("../Julia/IndicatorData.jl") 
include("../Julia/function_format_rata_die_to_us_date.jl")
include("../Julia/function_trim_DataFrames.jl")
println()

data = Dict{String, IndicatorData}()

## Do NOT use "^" in names as in "^VIX"
addIndicator!(data, "AAPL", "AAPL.csv" )
addIndicator!(data, "VIX", "^VIX.csv" )
addIndicator!(data, "DJIA", "^DJI.csv" )
addIndicator!(data, "US_ISM_MFC_EMP"  , "united-states.ism-manufacturing-employment.csv" )
addIndicator!(data, "US_HOUS_STRT_M"  , "united-states.housing-starts-mm.csv" )
addIndicator!(data, "US_ISM_MFC_PMI"  , "united-states.ism-manufacturing-pmi.csv" )
addIndicator!(data, "US_INIT_JOBLESS" , "united-states.initial-jobless-claims.csv" )
addIndicator!(data, "US_GDP_Q"        , "united-states.gross-domestic-product-qq.csv" )
addIndicator!(data, "NIO"             , "NIO.csv" )
addIndicator!(data, "NVDA"            , "NVDA.csv" )




print()

data

data["AAPL"].min_rata_die

using Statistics
describe(data["AAPL"].df)

trim_DataFrames!(data) # include("../Julia/function_trim_DataFrames.jl")

## Print POSSIBLE fields for UBER DataFrame

for key in keys(data) 
    #df = data[key].df
    columns = names(data[key].df)
    for i in 1:length(columns)
        println(",", data[key].name, "_",columns[i], " = data[\"", data[key].name, "\"].df[:,:", columns[i], "] ") 
    end
end

using DataFrames
uber = DataFrame(  

 Rata_Die = data["DJIA"].df[:,:Rata_Die] # Array{Int64,1}
,Date = data["DJIA"].df[:,:Date] 
    
,VIX_Original = data["VIX"].df[:,:Original] 
,VIX_Quantized = data["VIX"].df[:,:Quantized] 
,VIX_Avg030 = data["VIX"].df[:,:Avg030] 
,VIX_Avg060 = data["VIX"].df[:,:Avg060] 
,VIX_Avg090 = data["VIX"].df[:,:Avg090] 
,VIX_Avg120 = data["VIX"].df[:,:Avg120] 
,VIX_Avg180 = data["VIX"].df[:,:Avg180] 
,VIX_Avg365 = data["VIX"].df[:,:Avg365] 
    
,US_ISM_MFC_PMI_Original = data["US_ISM_MFC_PMI"].df[:,:Original] 
,US_ISM_MFC_PMI_Quantized = data["US_ISM_MFC_PMI"].df[:,:Quantized] 
,US_ISM_MFC_PMI_Avg030 = data["US_ISM_MFC_PMI"].df[:,:Avg030] 
,US_ISM_MFC_PMI_Avg060 = data["US_ISM_MFC_PMI"].df[:,:Avg060] 
,US_ISM_MFC_PMI_Avg090 = data["US_ISM_MFC_PMI"].df[:,:Avg090] 
,US_ISM_MFC_PMI_Avg180 = data["US_ISM_MFC_PMI"].df[:,:Avg180] 
,US_ISM_MFC_PMI_Avg365 = data["US_ISM_MFC_PMI"].df[:,:Avg365] 

,DJIA_Original = data["DJIA"].df[:,:Original] 
,DJIA_Quantized = data["DJIA"].df[:,:Quantized] 
,DJIA_Avg005 = data["DJIA"].df[:,:Avg005] 
,DJIA_Avg030 = data["DJIA"].df[:,:Avg030] 
,DJIA_Avg060 = data["DJIA"].df[:,:Avg060] 
,DJIA_Avg090 = data["DJIA"].df[:,:Avg090] 
,DJIA_Avg120 = data["DJIA"].df[:,:Avg120] 
,DJIA_Avg180 = data["DJIA"].df[:,:Avg180] 

,AAPL_Original = data["AAPL"].df[:,:Original] 
,AAPL_Quantized = data["AAPL"].df[:,:Quantized] 
,AAPL_Avg005 = data["AAPL"].df[:,:Avg005] 
,AAPL_Avg030 = data["AAPL"].df[:,:Avg030] 
,AAPL_Avg060 = data["AAPL"].df[:,:Avg060] 
,AAPL_Avg090 = data["AAPL"].df[:,:Avg090] 
,AAPL_Avg120 = data["AAPL"].df[:,:Avg120] 
,AAPL_Avg180 = data["AAPL"].df[:,:Avg180] 

,US_ISM_MFC_EMP_Original = data["US_ISM_MFC_EMP"].df[:,:Original] 
,US_ISM_MFC_EMP_Quantized = data["US_ISM_MFC_EMP"].df[:,:Quantized] 
,US_ISM_MFC_EMP_Avg030 = data["US_ISM_MFC_EMP"].df[:,:Avg030] 
,US_ISM_MFC_EMP_Avg060 = data["US_ISM_MFC_EMP"].df[:,:Avg060] 
,US_ISM_MFC_EMP_Avg090 = data["US_ISM_MFC_EMP"].df[:,:Avg090] 
,US_ISM_MFC_EMP_Avg120 = data["US_ISM_MFC_EMP"].df[:,:Avg120] 
,US_ISM_MFC_EMP_Avg180 = data["US_ISM_MFC_EMP"].df[:,:Avg180] 
,US_ISM_MFC_EMP_Avg365 = data["US_ISM_MFC_EMP"].df[:,:Avg365] 
    
,US_INIT_JOBLESS_Quantized = data["US_INIT_JOBLESS"].df[:,:Quantized] 
,US_INIT_JOBLESS_Avg005 = data["US_INIT_JOBLESS"].df[:,:Avg005] 
,US_INIT_JOBLESS_Avg030 = data["US_INIT_JOBLESS"].df[:,:Avg030] 
,US_INIT_JOBLESS_Avg060 = data["US_INIT_JOBLESS"].df[:,:Avg060] 
,US_INIT_JOBLESS_Avg090 = data["US_INIT_JOBLESS"].df[:,:Avg090] 
,US_INIT_JOBLESS_Avg120 = data["US_INIT_JOBLESS"].df[:,:Avg120] 
,US_INIT_JOBLESS_Avg180 = data["US_INIT_JOBLESS"].df[:,:Avg180] 
    
,US_GDP_Q_Quantized = data["US_GDP_Q"].df[:,:Quantized] 
,US_GDP_Q_Avg005 = data["US_GDP_Q"].df[:,:Avg005] 
,US_GDP_Q_Avg030 = data["US_GDP_Q"].df[:,:Avg030] 
,US_GDP_Q_Avg060 = data["US_GDP_Q"].df[:,:Avg060] 
,US_GDP_Q_Avg090 = data["US_GDP_Q"].df[:,:Avg090] 
,US_GDP_Q_Avg120 = data["US_GDP_Q"].df[:,:Avg120] 
,US_GDP_Q_Avg180 = data["US_GDP_Q"].df[:,:Avg180] 
    
,NIO_Original = data["NIO"].df[:,:Original] 
,NIO_Quantized = data["NIO"].df[:,:Quantized] 
,NIO_Avg005 = data["NIO"].df[:,:Avg005] 
,NIO_Avg030 = data["NIO"].df[:,:Avg030] 
,NIO_Avg060 = data["NIO"].df[:,:Avg060] 
,NIO_Avg090 = data["NIO"].df[:,:Avg090] 
,NIO_Avg120 = data["NIO"].df[:,:Avg120] 
,NIO_Avg180 = data["NIO"].df[:,:Avg180] 
    
,NVDA_Original = data["NVDA"].df[:,:Original] 
,NVDA_Quantized = data["NVDA"].df[:,:Quantized] 
,NVDA_Avg005 = data["NVDA"].df[:,:Avg005] 
,NVDA_Avg030 = data["NVDA"].df[:,:Avg030] 
,NVDA_Avg060 = data["NVDA"].df[:,:Avg060] 
,NVDA_Avg090 = data["NVDA"].df[:,:Avg090] 
,NVDA_Avg120 = data["NVDA"].df[:,:Avg120] 
,NVDA_Avg180 = data["NVDA"].df[:,:Avg180] 

,US_HOUS_STRT_M_Original = data["US_HOUS_STRT_M"].df[:,:Original] 
,US_HOUS_STRT_M_Quantized = data["US_HOUS_STRT_M"].df[:,:Quantized] 
,US_HOUS_STRT_M_Avg005 = data["US_HOUS_STRT_M"].df[:,:Avg005] 
,US_HOUS_STRT_M_Avg030 = data["US_HOUS_STRT_M"].df[:,:Avg030] 
,US_HOUS_STRT_M_Avg060 = data["US_HOUS_STRT_M"].df[:,:Avg060] 
,US_HOUS_STRT_M_Avg090 = data["US_HOUS_STRT_M"].df[:,:Avg090] 
,US_HOUS_STRT_M_Avg120 = data["US_HOUS_STRT_M"].df[:,:Avg120] 
,US_HOUS_STRT_M_Avg180 = data["US_HOUS_STRT_M"].df[:,:Avg180] 
)
using Statistics
describe(uber)

columns = print_colunms(uber)
println()

using Plots

record_count = size(uber)[1]
rows = 1:record_count
dates = format_dates( uber[rows,2] , "m/d/yy")

gr()
plot( dates, # x-axis: dates
     [ 
        uber[rows,8] uber[rows,15] uber[rows,20] uber[rows,28] uber[rows,39] uber[rows,45] uber[rows,53] uber[rows,57] uber[rows,65]  uber[rows,78]         
    ], # y-axis
    label = [      
        columns[8]     columns[15]   columns[20]   columns[28] columns[39]   columns[45]   columns[53] columns[57] columns[65] columns[78] "" 
    ],
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )

savefig("../../indicators.png")

record_count = size(uber)[1]
today_rata = Dates.datetime2rata( today() )
today_id = find_day(uber, today_rata)

# I am putting overlap in the sets to see the behavior
df_training   = uber[1:today_id-5,:] # train up 5 days ago, I want to see real prediction for last few days.
df_prediction = uber[today_id-90:record_count,:] # show predictions up to 90 days ago

println()

save_dataset(df_training,   "uber_training.csv"  , "../Data/processed/");
save_dataset(df_prediction, "uber_prediction.csv", "../Data/processed/");


