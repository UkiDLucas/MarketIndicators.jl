symbol_to_predict = "DJIA"
symbol_to_predict = "AAPL"
symbol_to_predict = "VIX"
symbol_to_predict = "NVDA"

features_to_analyze = 
[
  
"GSPC_Avg005"
,"GSPC_Avg010"
,"GSPC_Avg030"
,"GSPC_Avg060"
,"GSPC_Avg090"
,"GSPC_Avg120"
,"GSPC_Avg180"
  
,"BTC_USD_Avg005"
,"BTC_USD_Avg010"
,"BTC_USD_Avg030"
,"BTC_USD_Avg060"
,"BTC_USD_Avg090"
,"BTC_USD_Avg120"
,"BTC_USD_Avg180"
  
,"DALLAS_FED_MFC_Avg005"
,"DALLAS_FED_MFC_Avg010"
,"DALLAS_FED_MFC_Avg030"
,"DALLAS_FED_MFC_Avg060"
,"DALLAS_FED_MFC_Avg090"
,"DALLAS_FED_MFC_Avg120"
,"DALLAS_FED_MFC_Avg180"
  
,"GOLD_Avg005"
,"GOLD_Avg010"
,"GOLD_Avg030"
,"GOLD_Avg060"
,"GOLD_Avg090"
,"GOLD_Avg120"
,"GOLD_Avg180"
  
,"GELYF_Avg005"
,"GELYF_Avg010"
,"GELYF_Avg030"
,"GELYF_Avg060"
,"GELYF_Avg090"
,"GELYF_Avg120"
,"GELYF_Avg180"
  
,"US_PEND_HOME_SALE_M_Avg005"
,"US_PEND_HOME_SALE_M_Avg010"
,"US_PEND_HOME_SALE_M_Avg030"
,"US_PEND_HOME_SALE_M_Avg060"
,"US_PEND_HOME_SALE_M_Avg090"
,"US_PEND_HOME_SALE_M_Avg120"
,"US_PEND_HOME_SALE_M_Avg180"
  
,"TNX_Avg005"
,"TNX_Avg010"
,"TNX_Avg030"
,"TNX_Avg060"
,"TNX_Avg090"
,"TNX_Avg120"
,"TNX_Avg180"
  
,"TSLA_Avg005"
,"TSLA_Avg010"
,"TSLA_Avg030"
,"TSLA_Avg060"
,"TSLA_Avg090"
,"TSLA_Avg120"
,"TSLA_Avg180"
  
,"US_BUILD_PERM_Avg005"
,"US_BUILD_PERM_Avg010"
,"US_BUILD_PERM_Avg030"
,"US_BUILD_PERM_Avg060"
,"US_BUILD_PERM_Avg090"
,"US_BUILD_PERM_Avg120"
,"US_BUILD_PERM_Avg180"
  
,"BYDDF_Avg005"
,"BYDDF_Avg010"
,"BYDDF_Avg030"
,"BYDDF_Avg060"
,"BYDDF_Avg090"
,"BYDDF_Avg120"
,"BYDDF_Avg180"
  
,"US_INDS_PROD_M_Avg005"
,"US_INDS_PROD_M_Avg010"
,"US_INDS_PROD_M_Avg030"
,"US_INDS_PROD_M_Avg060"
,"US_INDS_PROD_M_Avg090"
,"US_INDS_PROD_M_Avg120"
,"US_INDS_PROD_M_Avg180"
  
,"US_ISM_MFC_EMPL_Avg005"
,"US_ISM_MFC_EMPL_Avg010"
,"US_ISM_MFC_EMPL_Avg030"
,"US_ISM_MFC_EMPL_Avg060"
,"US_ISM_MFC_EMPL_Avg090"
,"US_ISM_MFC_EMPL_Avg120"
,"US_ISM_MFC_EMPL_Avg180"
  
,"US_INIT_JOB_CLAIM_Avg005"
,"US_INIT_JOB_CLAIM_Avg010"
,"US_INIT_JOB_CLAIM_Avg030"
,"US_INIT_JOB_CLAIM_Avg060"
,"US_INIT_JOB_CLAIM_Avg090"
,"US_INIT_JOB_CLAIM_Avg120"
,"US_INIT_JOB_CLAIM_Avg180"
  
,"US_UNEMPLOY_RATE_Avg005"
,"US_UNEMPLOY_RATE_Avg010"
,"US_UNEMPLOY_RATE_Avg030"
,"US_UNEMPLOY_RATE_Avg060"
,"US_UNEMPLOY_RATE_Avg090"
,"US_UNEMPLOY_RATE_Avg120"
,"US_UNEMPLOY_RATE_Avg180"
  
,"NVDA_Avg005"
,"NVDA_Avg010"
,"NVDA_Avg030"
,"NVDA_Avg060"
,"NVDA_Avg090"
,"NVDA_Avg120"
,"NVDA_Avg180"
  
,"NRMGX_Avg005"
,"NRMGX_Avg010"
,"NRMGX_Avg030"
,"NRMGX_Avg060"
,"NRMGX_Avg090"
,"NRMGX_Avg120"
,"NRMGX_Avg180"
  
,"US_HOUS_STRS_M_Avg005"
,"US_HOUS_STRS_M_Avg010"
,"US_HOUS_STRS_M_Avg030"
,"US_HOUS_STRS_M_Avg060"
,"US_HOUS_STRS_M_Avg090"
,"US_HOUS_STRS_M_Avg120"
,"US_HOUS_STRS_M_Avg180"
  
,"HD_Avg005"
,"HD_Avg010"
,"HD_Avg030"
,"HD_Avg060"
,"HD_Avg090"
,"HD_Avg120"
,"HD_Avg180"
  
,"US_GDP_Q_Avg005"
,"US_GDP_Q_Avg010"
,"US_GDP_Q_Avg030"
,"US_GDP_Q_Avg060"
,"US_GDP_Q_Avg090"
,"US_GDP_Q_Avg120"
,"US_GDP_Q_Avg180"
  
,"VIX_Avg005"
,"VIX_Avg010"
,"VIX_Avg030"
,"VIX_Avg060"
,"VIX_Avg090"
,"VIX_Avg120"
,"VIX_Avg180"
  
,"TPLGX_Avg005"
,"TPLGX_Avg010"
,"TPLGX_Avg030"
,"TPLGX_Avg060"
,"TPLGX_Avg090"
,"TPLGX_Avg120"
,"TPLGX_Avg180"
  
,"US_ISM_MFC_PMI_Avg005"
,"US_ISM_MFC_PMI_Avg010"
,"US_ISM_MFC_PMI_Avg030"
,"US_ISM_MFC_PMI_Avg060"
,"US_ISM_MFC_PMI_Avg090"
,"US_ISM_MFC_PMI_Avg120"
,"US_ISM_MFC_PMI_Avg180"
  
,"VINIX_Avg005"
,"VINIX_Avg010"
,"VINIX_Avg030"
,"VINIX_Avg060"
,"VINIX_Avg090"
,"VINIX_Avg120"
,"VINIX_Avg180"
  
,"VBTLX_Avg005"
,"VBTLX_Avg010"
,"VBTLX_Avg030"
,"VBTLX_Avg060"
,"VBTLX_Avg090"
,"VBTLX_Avg120"
,"VBTLX_Avg180"
  
,"RERGX_Avg005"
,"RERGX_Avg010"
,"RERGX_Avg030"
,"RERGX_Avg060"
,"RERGX_Avg090"
,"RERGX_Avg120"
,"RERGX_Avg180"
  
,"CRSP_Avg005"
,"CRSP_Avg010"
,"CRSP_Avg030"
,"CRSP_Avg060"
,"CRSP_Avg090"
,"CRSP_Avg120"
,"CRSP_Avg180"
  
,"BABA_Avg005"
,"BABA_Avg010"
,"BABA_Avg030"
,"BABA_Avg060"
,"BABA_Avg090"
,"BABA_Avg120"
,"BABA_Avg180"
  
,"DJIA_Avg005"
,"DJIA_Avg010"
,"DJIA_Avg030"
,"DJIA_Avg060"
,"DJIA_Avg090"
,"DJIA_Avg120"
,"DJIA_Avg180"
  
,"AAPL_Avg005"
,"AAPL_Avg010"
,"AAPL_Avg030"
,"AAPL_Avg060"
,"AAPL_Avg090"
,"AAPL_Avg120"
,"AAPL_Avg180"
     
]

println()

## uncomment for the first run
# import Pkg
# Pkg.add("PyCall")
# Pkg.add("Conda")
# ENV["PYTHON"] = "/opt/anaconda3/envs/turi/bin/python"
# /opt/anaconda3/envs/turi/lib/python3.6/site-packages/
# Pkg.build("PyCall")

include("../Julia/functions.jl") 
data_path="../DATA/processed/uber_training.csv"
column_to_predict = symbol_to_predict * "_Original"

using PyCall
tc = pyimport("turicreate")
data = tc.SFrame(data_path)
println()

# Make a train-test split
train_data, test_data = data.random_split(0.8)

println( size(train_data) )
println( size(test_data)  )

model = tc.regression.create( 
    train_data, 
    target = column_to_predict, 
    features = features_to_analyze, 
    validation_set="auto", 
    verbose=true
)

#TODO: write this in a loop to select the best model
# Evaluate the model and save the results into a dictionary
results = model.evaluate( test_data ) #test_data[0:2531]
results

rmse = results["rmse"]
rmse = round(rmse, digits=2)

max_error = results["max_error"]
max_error = round(max_error, digits=2)

println( "max_error: ", max_error, ", rmse: ", rmse )
# max_error: 1069.27, rmse: 184.6
# max_error: 65.35, rmse: 32.6            predict: ^DJIA added: US_INIT_JOBLESS
# max_error: 1875.39, rmse: 443.59        predict: ^DJIA commented out: "DJIA_Quantized"
# max_error: 1339.76, rmse: 373.94        predict: ^DJIA commented out: "DJIA_Quantized"
# max_error: 916.19, rmse: 231.24       predict: ^DJIA with "DJIA_Avg005"

# Export to Core ML
model.export_coreml("../DATA/models/^DJI.mlmodel")

data_path="../DATA/processed/uber_prediction.csv"
data_predictions = tc.SFrame(data_path)

## Save predictions to an SArray
predictions = model.predict(data_predictions)
#get(predictions, 1)

println()

record_count = size(data_predictions)[1]
row = get(data_predictions, record_count-1)

feature_number = row.count
day = row["Rata_Die"]
date = row["Date"] # "2020-10-20"
original = row["DJIA_Original"]

println( "record_count data ", record_count )
println( "record_count predictions ", size(predictions)[1] )

println( "feature_number ", feature_number )
println( "Rata Die ", day )
println( "date ", date )
println( "original ", original )

using Dates
today_rata = Dates.datetime2rata( today() )

## Determine dataset size

initio = 1                                              # latin: start
finem  = size(predictions)[1] -1                        # latin: end
gradus = convert(Int64, round( finem/20, digits=0)  )   # latin: step

println("preditions set size: ", finem, ", step ", gradus)


## Declare variables
x_axis_dates      = Vector{Date}() # results in Array{Date,1}
y_axis_original   = Vector{Float64}()
y_axis_predicted  = Vector{Float64}()

println(symbol_to_predict, " ", finem, " ", typeof(x_axis_dates))

today_id  = 50 # not set yet

## step thru each prediction
for id in initio:finem
    row = get(data_predictions, id) # get a dictionary of data from the SFrame
    
    date_string = row["Date"] # e.g. "2020-10-20"
    date = Date(date_string) # 2020-09-07 Date
    if date == today()
        today_id = id
    end 
    #date = Dates.format(date, "u.d,yy" )
    #println("date ", date, " ", typeof(date))
    push!(x_axis_dates, date)
    
    predicted = get(predictions, id) # Float64
    predicted = round(predicted, digits=0)
    #println("predicted ", predicted, " ", typeof(predicted))
    append!(y_axis_predicted, predicted)
    
    
    original = row[ column_to_predict ]
    original = round(original, digits=0) # Float64
    #println("original ", original, " ", typeof(original)) 
    append!(y_axis_original, original)
end

## Format Dates for plotting
include("../Julia/function_format_dates.jl")
x_axis_dates = format_dates(x_axis_dates, "u. d, yy ")



t = today()# Date
t = format_dates([t], "u. d, yyyy") # Array{String,1}
t = t[1] # String
println("t = ", t, " - ", typeof(t))

println()

using Plots

#dates = format_dates( df[rows,2] , "m/d/yy")

gr()
plot(    x_axis_dates,
        [  y_axis_original y_axis_predicted 
        ], # y-axis
    label    = 
        [ symbol_to_predict "predictions"  "" ],
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "value",
    size     = (980, 400), # width, height
    layout = (1, 1), # number of graphs: vertically, horizontally
    )
## Add veritical today line
plot!([today_id], seriestype="vline", label=[ "Today "*t "" ],)


savefig("../images/predictions_" * symbol_to_predict * ".png")

## print prediction comparisons
println(symbol_to_predict, " ", today())

file_path = "../DATA/" * symbol_to_predict * "_predictions.csv"
open( file_path, "a") do file_handle # append
    
    for id in finem-10:finem
        if id < today_id + 4 # Allows to show Monday predition on Friday night.
            row = get(data_predictions, id) # get a dictionary of data from the SFrame
            date_string = row["Date"] # e.g. "2020-10-20"

            a = y_axis_predicted[id]
            b = y_axis_original[id]
            d = round(b-a, digits=3)
            date = convert(String, Dates.format( Date(date_string), "e, yyyy-mm-dd" ) )
            if id <= today_id
                println( date, "\t predicted ", a , "\t, but actual value was \t", b , "\t difference is ",  d  ) # di
            else
                println( date, "\t predicted ", a  ) # 

                txt_to_save =  
                    convert(String, Dates.format( today(), "yyyy-mm-dd" ) ) *","* 
                    convert(String, symbol_to_predict) *","* 
                    date_string *","* 
                    string(a) * "\n"
                
                write(file_handle, txt_to_save )
                
            end # if
        end #if 
    end # for
end # open file




