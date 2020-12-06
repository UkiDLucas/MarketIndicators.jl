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
addIndicator!(data, "US_ISM_MFC_EMP", "united-states.ism-manufacturing-employment.csv" )
addIndicator!(data, "US_HOUS_SRTS_M", "united-states.housing-starts-mm.csv" )
addIndicator!(data, "US_ISM_MFC_PMI", "united-states.ism-manufacturing-pmi.csv" )

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
,DJIA_Avg030 = data["DJIA"].df[:,:Avg030] 
,DJIA_Avg060 = data["DJIA"].df[:,:Avg060] 
,DJIA_Avg090 = data["DJIA"].df[:,:Avg090] 
,DJIA_Avg120 = data["DJIA"].df[:,:Avg120] 
,DJIA_Avg180 = data["DJIA"].df[:,:Avg180] 
,DJIA_Avg365 = data["DJIA"].df[:,:Avg365] 

,AAPL_Original = data["AAPL"].df[:,:Original] 
,AAPL_Quantized = data["AAPL"].df[:,:Quantized] 
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

#,US_HOUS_SRTS_M_Original = data["US_HOUS_SRTS_M"].df[:,:Original] 
#,US_HOUS_SRTS_M_Quantized = data["US_HOUS_SRTS_M"].df[:,:Quantized] 
#,US_HOUS_SRTS_M_Avg030 = data["US_HOUS_SRTS_M"].df[:,:Avg030] 
#,US_HOUS_SRTS_M_Avg060 = data["US_HOUS_SRTS_M"].df[:,:Avg060] 
#,US_HOUS_SRTS_M_Avg090 = data["US_HOUS_SRTS_M"].df[:,:Avg090] 
#,US_HOUS_SRTS_M_Avg180 = data["US_HOUS_SRTS_M"].df[:,:Avg180] 
#,US_HOUS_SRTS_M_Avg365 = data["US_HOUS_SRTS_M"].df[:,:Avg365] 
)
using Statistics
describe(uber_df)

columns = print_colunms(uber)
println()

using Plots

record_count = size(uber)[1]
rows = 1:record_count
dates = format_dates( uber[rows,2] , "m/d/yy")

gr()
plot( dates, # x-axis: dates
     [ 
        uber[rows,5] uber[rows,8] uber[rows,14] uber[rows,16] uber[rows,20] uber[rows,23] uber[rows,28] uber[rows,31] uber[rows,36] uber[rows,38]         
    ], # y-axis
    label = [      
          columns[5]   columns[8]   columns[14]   columns[16]   columns[20]    columns[23]  columns[28]    columns[31]  columns[36]   columns[38] "" 
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
df_training   = uber[1:today_id-3,:] # train up 3 days ago
df_prediction = uber[today_id-60:record_count,:] # show predictions up to 60 days ago

println()

save_dataset(df_training,   "uber_training.csv"  , "../Data/processed/");
save_dataset(df_prediction, "uber_prediction.csv", "../Data/processed/");


