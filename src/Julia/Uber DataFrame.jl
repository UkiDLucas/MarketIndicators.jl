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

oldest_common_day = maximum([
        minimum(df1[:,1]) 
        ,minimum(df2[:,1]) 
        ,minimum(df3[:,1])
        ,minimum(df4[:,1])
        ,minimum(df5[:,1])
        ])
#735975


newest_common_day = minimum([
        maximum(df1[:,1])
        , maximum(df2[:,1])
        , maximum(df3[:,1])
        , maximum(df4[:,1])
        , maximum(df5[:,1])
        ])
#737718

df1_min_id = find_day(df1, oldest_common_day)
df1_max_id = find_day(df1, newest_common_day)
df1_rows_range = df1_min_id:df1_max_id

df2_min_id = find_day(df2, oldest_common_day)
df2_max_id = find_day(df2, newest_common_day)
df2_rows_range = df2_min_id:df2_max_id

df3_min_id = find_day(df3, oldest_common_day)
df3_max_id = find_day(df3, newest_common_day)
df3_rows_range = df3_min_id:df3_max_id

df4_min_id = find_day(df4, oldest_common_day)
df4_max_id = find_day(df4, newest_common_day)
df4_rows_range = df4_min_id:df4_max_id

df5_min_id = find_day(df5, oldest_common_day)
df5_max_id = find_day(df5, newest_common_day)
df5_rows_range = df5_min_id:df5_max_id

using DataFrames
uber_df = DataFrame(  Day                   = df1[df1_rows_range,1] 
                     ,Date                  = df1[df1_rows_range,2] 
                     ,DJIA_Value            = df1[df1_rows_range,3] 
                     ,DJIA_Original         = df1[df1_rows_range,4] 
                     ,DJIA_Avg005           = df1[df1_rows_range,5] 
                     ,DJIA_Avg030           = df1[df1_rows_range,6] 
                     ,DJIA_Avg090           = df1[df1_rows_range,7] 
                     ,DJIA_Avg180           = df1[df1_rows_range,8] 
                     ,DJIA_Avg365           = df1[df1_rows_range,9]
    
                     ,ISM_MFC_EMP_Value     = df2[df2_rows_range,3]
                     ,ISM_MFC_EMP_Original  = df2[df2_rows_range,4] 
                     ,ISM_MFC_EMP_Avg090    = df2[df2_rows_range,7] 
                     ,ISM_MFC_EMP_Avg180    = df2[df2_rows_range,8] 
                     ,ISM_MFC_EMP_Avg365    = df2[df2_rows_range,9]
    
                     ,HOUSE_SRT_MM_Value    = df3[df3_rows_range,3]
                     ,HOUSE_SRT_MM_Original = df3[df3_rows_range,4] 
                     ,HOUSE_SRT_MM_Avg090   = df3[df3_rows_range,5] 
                     ,HOUSE_SRT_MM_Avg180   = df3[df3_rows_range,6] 
                     ,HOUSE_SRT_MM_Avg365   = df3[df3_rows_range,7]
    
                     ,MFC_MPI_Value         = df4[df4_rows_range,3]
                     ,MFC_MPI_Original      = df4[df4_rows_range,4] 
                     ,MFC_MPI_Avg090        = df4[df4_rows_range,5] 
                     ,MFC_MPI_Avg180        = df4[df4_rows_range,6] 
                     ,MFC_MPI_Avg365        = df4[df4_rows_range,7]
    
    
                     ,VIX_Value             = df5[df5_rows_range,3] 
                     ,VIX_Original          = df5[df5_rows_range,4] 
                     ,VIX_Avg005            = df5[df5_rows_range,5] 
                     ,VIX_Avg030            = df5[df5_rows_range,6] 
                     ,VIX_Avg090            = df5[df5_rows_range,7] 
                     ,VIX_Avg180            = df5[df5_rows_range,8] 
                     ,VIX_Avg365            = df5[df5_rows_range,9] 
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
               [  uber_df[rows,7] uber_df[rows,12] uber_df[rows,17] uber_df[rows,22] uber_df[rows,29]       ], # y-axis
    label    = [       columns[7]      columns[12]      columns[17]      columns[22] columns[29]   "" ],
    legend   =:bottom, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )

save_dataset(uber_df, dataset_file_name, "../Data/processed/");


