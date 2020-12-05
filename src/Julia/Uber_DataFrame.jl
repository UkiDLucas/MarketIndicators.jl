dir="../Data/processed/"

dataset_file_name = "uber.csv"

file1 = "^DJI.csv"
file2 = "united-states.ism-manufacturing-employment.csv"
file3 = "united-states.housing-starts-mm.csv"
file4 = "united-states.ism-manufacturing-pmi.csv"
file5 = "^VIX.csv"


include("../Julia/functions.jl") 
println()

df1 = fetch_dataset( file1 , "yyyy-mm-dd", dir )

using Statistics
describe(df1)

df2 = fetch_dataset( file2 , "yyyy-mm-dd", dir )

using Statistics
describe(df2)

df3 = fetch_dataset( file3 , "yyyy-mm-dd", dir )

using Statistics
describe(df3)

df4 = fetch_dataset( file4 , "yyyy-mm-dd", dir )

using Statistics
describe(df3)

df5 = fetch_dataset( file5 , "yyyy-mm-dd", dir )

using Statistics
describe(df3)

using Dates

function format_rata_die_to_us_date(d)
    return Dates.format( rata2datetime(d) , "u. d, yyyy")
end

oldest_common_day = maximum([
         minimum(df1[:,1]) 
        ,minimum(df2[:,1]) 
        ,minimum(df3[:,1])
        ,minimum(df4[:,1])
        ,minimum(df5[:,1])
        ])


println("Oldest common day for df1 is ", format_rata_die_to_us_date( minimum(df1[:,1]))  )
println("Oldest common day for df2 is ", format_rata_die_to_us_date( minimum(df2[:,1]))  )
println("Oldest common day for df3 is ", format_rata_die_to_us_date( minimum(df3[:,1]))  )
println("Oldest common day for df4 is ", format_rata_die_to_us_date( minimum(df4[:,1]))  )
println("Oldest common day for df5 is ", format_rata_die_to_us_date( minimum(df5[:,1]))  )

println("Oldest common day is ", format_rata_die_to_us_date(oldest_common_day) )

newest_common_day = minimum([
          maximum(df1[:,1])
        , maximum(df2[:,1])
        , maximum(df3[:,1])
        , maximum(df4[:,1])
        , maximum(df5[:,1])
        ])

println("Newest common day for df1 is ", format_rata_die_to_us_date( maximum(df1[:,1]))  )
println("Newest common day for df2 is ", format_rata_die_to_us_date( maximum(df2[:,1]))  )
println("Newest common day for df3 is ", format_rata_die_to_us_date( maximum(df3[:,1]))  )
println("Newest common day for df4 is ", format_rata_die_to_us_date( maximum(df4[:,1]))  )
println("Newest common day for df5 is ", format_rata_die_to_us_date( maximum(df5[:,1]))  )

println("Newest common day is ", format_rata_die_to_us_date(newest_common_day) )

function trim_DataFrame(name::String, df::DataFrame, oldest_common_day::Int64,  newest_common_day::Int64)
    oldest_row = find_day(df, oldest_common_day)
    newest_row = find_day(df, newest_common_day)
    df = df[oldest_row:newest_row,:] # trimming
    println(name, " ", size(df)[1],"\n    ", names(df) )
    return df
end

df1 = trim_DataFrame("^DJI", df1, oldest_common_day, newest_common_day)
df2 = trim_DataFrame("mnfc_epmlt", df2, oldest_common_day, newest_common_day)
df3 = trim_DataFrame("hous_start", df3, oldest_common_day, newest_common_day)
df4 = trim_DataFrame("mnfc_PMI", df4, oldest_common_day, newest_common_day)
df5 = trim_DataFrame("^VIX", df5, oldest_common_day, newest_common_day)
println()

using DataFrames
uber_df = DataFrame(  Rata_Die              = df1[:,:Rata_Die] 
                     ,Date                  = df1[:,:Date] 
    
                     ,DJIA_Original         = df1[:,:Original] 
                     ,DJIA_Quantized        = df1[:,:Quantized] 
                     ,DJIA_Avg030           = df1[:,:Avg030] 
                     ,DJIA_Avg060           = df1[:,:Avg060] 
                     ,DJIA_Avg090           = df1[:,:Avg090] 
                     ,DJIA_Avg120           = df1[:,:Avg120] 
                     ,DJIA_Avg180          = df1[:,:Avg180] 
                     ,DJIA_Avg365          = df1[:,:Avg365] 
    
                     ,mnfc_epmlt_Original   = df2[:,:Original] 
                     ,mnfc_epmlt_Quantized  = df2[:,:Quantized]
                     ,mnfc_epmlt_Avg030     = df2[:,:Avg030]
                     ,mnfc_epmlt_Avg060     = df2[:,:Avg060]
                     ,mnfc_epmlt_Avg090     = df2[:,:Avg090] 
                     ,mnfc_epmlt_Avg120     = df1[:,:Avg120] 
                     ,mnfc_epmlt_Avg180     = df1[:,:Avg180]
                     ,mnfc_epmlt_Avg365    = df1[:,:Avg365] 
    
                     ,mnfc_PMI_Original     = df4[:,:Original] 
                     ,mnfc_PMI_Quantized    = df4[:,:Quantized] 
                     ,mnfc_PMI_Avg030       = df4[:,:Avg030]  
                     ,mnfc_PMI_Avg060       = df4[:,:Avg060]  
                     ,mnfc_PMI_Avg090       = df4[:,:Avg090] 
                    #,mnfc_PMI_Avg120       = df1[:,:Avg120] 
                     ,mnfc_PMI_Avg180       = df1[:,:Avg180] 
                     ,mnfc_PMI_Avg365       = df1[:,:Avg365] 
    
                     ,VIX_Original          = df5[:,:Original] 
                     ,VIX_Quantized         = df5[:,:Quantized] 
                     ,VIX_Avg030            = df5[:,:Avg030]  
                     ,VIX_Avg060            = df5[:,:Avg060]  
                     ,VIX_Avg090            = df5[:,:Avg090] 
                     ,VIX_Avg120            = df1[:,:Avg120] 
                     ,VIX_Avg180            = df1[:,:Avg180] 
                     ,VIX_Avg365            = df1[:,:Avg365] 

                   )
using Statistics
describe(uber_df)

columns = print_colunms(uber_df)
println()

using Plots

record_count = size(uber_df)[1]
rows = 1:record_count
dates = format_dates( uber_df[rows,2] , "m/d/yy")

gr()
plot(          dates, # x-axis: dates
               [ uber_df[rows,6] uber_df[rows,14] uber_df[rows,22] uber_df[rows,29]         ], # y-axis
    label    = [      columns[6]      columns[14]      columns[22]      columns[29]      "" ],
    legend   =:bottom, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )

record_count = size(uber_df)[1]
today_rata = Dates.datetime2rata( today() )
today_id = find_day(uber_df, today_rata)

df_training   = uber_df[1:today_id,:]
df_prediction = uber_df[today_id-1:record_count,:]
println()

save_dataset(df_training,   "uber_training.csv"  , "../Data/processed/");
save_dataset(df_prediction, "uber_prediction.csv", "../Data/processed/");


