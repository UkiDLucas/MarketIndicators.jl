dir="../Data/processed/"
dataset_file_name = "uber.csv"


df = CSV.read( "../DATA/Indicators.csv", DataFrame)
row_count = size(df)[1]

data = Dict{String, IndicatorData}()

for row in 1:row_count
    indicator_full_name  = df[row, :Full_Name]
    url                  = df[row, :URL]
    symbol               = df[row, :Symbol]
    original_date_format = df[row, :Date_Format]
    column_to_keep       = df[row, :Column]

    println( "adding ", symbol  ) 
    ## Do NOT use "^" in names as in "^VIX"
    addIndicator!(data, symbol )

end # for loop
df = nothing # free the memory for gc()

#describe(data["AAPL"].df)

trim_DataFrames!(data) # include("../Julia/function_trim_DataFrames.jl")

## Print POSSIBLE fields for UBER DataFrame


for key in keys(data) 
    #df = data[key].df
    columns = names(data[key].df) # Symbols, not Strings
    for i in 1:length(columns)
        if occursin("Avg", string(columns[i]) ) # include only averages
            println(",", data[key].name, "_",columns[i], 
                " = data[\"", data[key].name, "\"].df[:,:", columns[i], "] ") 
        end # if
    end
end


## example column_name = data["SYMBOL"].df[:,:column_name] 

uber = DataFrame(  

 Rata_Die = data["VIX"].df[:,:Rata_Die] 
,Date = data["VIX"].df[:,:Date] 
 
,MSFT_Original = data["MSFT"].df[:,:Original] 
,MSFT_Quantized = data["MSFT"].df[:,:Quantized] 
,MSFT_Avg005 = data["MSFT"].df[:,:Avg005] 
,MSFT_Avg010 = data["MSFT"].df[:,:Avg010] 
,MSFT_Avg030 = data["MSFT"].df[:,:Avg030] 
,MSFT_Avg060 = data["MSFT"].df[:,:Avg060] 
,MSFT_Avg090 = data["MSFT"].df[:,:Avg090] 
,MSFT_Avg120 = data["MSFT"].df[:,:Avg120] 
,MSFT_Avg180 = data["MSFT"].df[:,:Avg180] 
 
,GSPC_Original = data["GSPC"].df[:,:Original] 
,GSPC_Quantized = data["GSPC"].df[:,:Quantized] 
,GSPC_Avg005 = data["GSPC"].df[:,:Avg005] 
,GSPC_Avg010 = data["GSPC"].df[:,:Avg010] 
,GSPC_Avg030 = data["GSPC"].df[:,:Avg030] 
,GSPC_Avg060 = data["GSPC"].df[:,:Avg060] 
,GSPC_Avg090 = data["GSPC"].df[:,:Avg090] 
,GSPC_Avg120 = data["GSPC"].df[:,:Avg120] 
,GSPC_Avg180 = data["GSPC"].df[:,:Avg180] 
 
,BTC_USD_Original = data["BTC_USD"].df[:,:Original] 
,BTC_USD_Quantized = data["BTC_USD"].df[:,:Quantized] 
,BTC_USD_Avg005 = data["BTC_USD"].df[:,:Avg005] 
,BTC_USD_Avg010 = data["BTC_USD"].df[:,:Avg010] 
,BTC_USD_Avg030 = data["BTC_USD"].df[:,:Avg030] 
,BTC_USD_Avg060 = data["BTC_USD"].df[:,:Avg060] 
,BTC_USD_Avg090 = data["BTC_USD"].df[:,:Avg090] 
,BTC_USD_Avg120 = data["BTC_USD"].df[:,:Avg120] 
,BTC_USD_Avg180 = data["BTC_USD"].df[:,:Avg180] 
 
,DALLAS_FED_MFC_Original = data["DALLAS_FED_MFC"].df[:,:Original] 
,DALLAS_FED_MFC_Quantized = data["DALLAS_FED_MFC"].df[:,:Quantized] 
,DALLAS_FED_MFC_Avg005 = data["DALLAS_FED_MFC"].df[:,:Avg005] 
,DALLAS_FED_MFC_Avg010 = data["DALLAS_FED_MFC"].df[:,:Avg010] 
,DALLAS_FED_MFC_Avg030 = data["DALLAS_FED_MFC"].df[:,:Avg030] 
,DALLAS_FED_MFC_Avg060 = data["DALLAS_FED_MFC"].df[:,:Avg060] 
,DALLAS_FED_MFC_Avg090 = data["DALLAS_FED_MFC"].df[:,:Avg090] 
,DALLAS_FED_MFC_Avg120 = data["DALLAS_FED_MFC"].df[:,:Avg120] 
,DALLAS_FED_MFC_Avg180 = data["DALLAS_FED_MFC"].df[:,:Avg180] 
 
,GOLD_Original = data["GOLD"].df[:,:Original] 
,GOLD_Quantized = data["GOLD"].df[:,:Quantized] 
,GOLD_Avg005 = data["GOLD"].df[:,:Avg005] 
,GOLD_Avg010 = data["GOLD"].df[:,:Avg010] 
,GOLD_Avg030 = data["GOLD"].df[:,:Avg030] 
,GOLD_Avg060 = data["GOLD"].df[:,:Avg060] 
,GOLD_Avg090 = data["GOLD"].df[:,:Avg090] 
,GOLD_Avg120 = data["GOLD"].df[:,:Avg120] 
,GOLD_Avg180 = data["GOLD"].df[:,:Avg180] 
 
,GELYF_Original = data["GELYF"].df[:,:Original] 
,GELYF_Quantized = data["GELYF"].df[:,:Quantized] 
,GELYF_Avg005 = data["GELYF"].df[:,:Avg005] 
,GELYF_Avg010 = data["GELYF"].df[:,:Avg010] 
,GELYF_Avg030 = data["GELYF"].df[:,:Avg030] 
,GELYF_Avg060 = data["GELYF"].df[:,:Avg060] 
,GELYF_Avg090 = data["GELYF"].df[:,:Avg090] 
,GELYF_Avg120 = data["GELYF"].df[:,:Avg120] 
,GELYF_Avg180 = data["GELYF"].df[:,:Avg180] 
 
,US_PEND_HOME_SALE_M_Original = data["US_PEND_HOME_SALE_M"].df[:,:Original] 
,US_PEND_HOME_SALE_M_Quantized = data["US_PEND_HOME_SALE_M"].df[:,:Quantized] 
,US_PEND_HOME_SALE_M_Avg005 = data["US_PEND_HOME_SALE_M"].df[:,:Avg005] 
,US_PEND_HOME_SALE_M_Avg010 = data["US_PEND_HOME_SALE_M"].df[:,:Avg010] 
,US_PEND_HOME_SALE_M_Avg030 = data["US_PEND_HOME_SALE_M"].df[:,:Avg030] 
,US_PEND_HOME_SALE_M_Avg060 = data["US_PEND_HOME_SALE_M"].df[:,:Avg060] 
,US_PEND_HOME_SALE_M_Avg090 = data["US_PEND_HOME_SALE_M"].df[:,:Avg090] 
,US_PEND_HOME_SALE_M_Avg120 = data["US_PEND_HOME_SALE_M"].df[:,:Avg120] 
,US_PEND_HOME_SALE_M_Avg180 = data["US_PEND_HOME_SALE_M"].df[:,:Avg180] 
 
,TNX_Original = data["TNX"].df[:,:Original] 
,TNX_Quantized = data["TNX"].df[:,:Quantized] 
,TNX_Avg005 = data["TNX"].df[:,:Avg005] 
,TNX_Avg010 = data["TNX"].df[:,:Avg010] 
,TNX_Avg030 = data["TNX"].df[:,:Avg030] 
,TNX_Avg060 = data["TNX"].df[:,:Avg060] 
,TNX_Avg090 = data["TNX"].df[:,:Avg090] 
,TNX_Avg120 = data["TNX"].df[:,:Avg120] 
,TNX_Avg180 = data["TNX"].df[:,:Avg180] 
 
,TM_Original = data["TM"].df[:,:Original] 
,TM_Quantized = data["TM"].df[:,:Quantized] 
,TM_Avg005 = data["TM"].df[:,:Avg005] 
,TM_Avg010 = data["TM"].df[:,:Avg010] 
,TM_Avg030 = data["TM"].df[:,:Avg030] 
,TM_Avg060 = data["TM"].df[:,:Avg060] 
,TM_Avg090 = data["TM"].df[:,:Avg090] 
,TM_Avg120 = data["TM"].df[:,:Avg120] 
,TM_Avg180 = data["TM"].df[:,:Avg180] 
 
,TSLA_Original = data["TSLA"].df[:,:Original] 
,TSLA_Quantized = data["TSLA"].df[:,:Quantized] 
,TSLA_Avg005 = data["TSLA"].df[:,:Avg005] 
,TSLA_Avg010 = data["TSLA"].df[:,:Avg010] 
,TSLA_Avg030 = data["TSLA"].df[:,:Avg030] 
,TSLA_Avg060 = data["TSLA"].df[:,:Avg060] 
,TSLA_Avg090 = data["TSLA"].df[:,:Avg090] 
,TSLA_Avg120 = data["TSLA"].df[:,:Avg120] 
,TSLA_Avg180 = data["TSLA"].df[:,:Avg180] 
 
,BYDDF_Original = data["BYDDF"].df[:,:Original] 
,BYDDF_Quantized = data["BYDDF"].df[:,:Quantized] 
,BYDDF_Avg005 = data["BYDDF"].df[:,:Avg005] 
,BYDDF_Avg010 = data["BYDDF"].df[:,:Avg010] 
,BYDDF_Avg030 = data["BYDDF"].df[:,:Avg030] 
,BYDDF_Avg060 = data["BYDDF"].df[:,:Avg060] 
,BYDDF_Avg090 = data["BYDDF"].df[:,:Avg090] 
,BYDDF_Avg120 = data["BYDDF"].df[:,:Avg120] 
,BYDDF_Avg180 = data["BYDDF"].df[:,:Avg180] 
 
,US_BUILD_PERM_Original = data["US_BUILD_PERM"].df[:,:Original] 
,US_BUILD_PERM_Quantized = data["US_BUILD_PERM"].df[:,:Quantized] 
,US_BUILD_PERM_Avg005 = data["US_BUILD_PERM"].df[:,:Avg005] 
,US_BUILD_PERM_Avg010 = data["US_BUILD_PERM"].df[:,:Avg010] 
,US_BUILD_PERM_Avg030 = data["US_BUILD_PERM"].df[:,:Avg030] 
,US_BUILD_PERM_Avg060 = data["US_BUILD_PERM"].df[:,:Avg060] 
,US_BUILD_PERM_Avg090 = data["US_BUILD_PERM"].df[:,:Avg090] 
,US_BUILD_PERM_Avg120 = data["US_BUILD_PERM"].df[:,:Avg120] 
,US_BUILD_PERM_Avg180 = data["US_BUILD_PERM"].df[:,:Avg180] 
 
,US_INDS_PROD_M_Original = data["US_INDS_PROD_M"].df[:,:Original] 
,US_INDS_PROD_M_Quantized = data["US_INDS_PROD_M"].df[:,:Quantized] 
,US_INDS_PROD_M_Avg005 = data["US_INDS_PROD_M"].df[:,:Avg005] 
,US_INDS_PROD_M_Avg010 = data["US_INDS_PROD_M"].df[:,:Avg010] 
,US_INDS_PROD_M_Avg030 = data["US_INDS_PROD_M"].df[:,:Avg030] 
,US_INDS_PROD_M_Avg060 = data["US_INDS_PROD_M"].df[:,:Avg060] 
,US_INDS_PROD_M_Avg090 = data["US_INDS_PROD_M"].df[:,:Avg090] 
,US_INDS_PROD_M_Avg120 = data["US_INDS_PROD_M"].df[:,:Avg120] 
,US_INDS_PROD_M_Avg180 = data["US_INDS_PROD_M"].df[:,:Avg180] 
 
,US_ISM_MFC_EMPL_Original = data["US_ISM_MFC_EMPL"].df[:,:Original] 
,US_ISM_MFC_EMPL_Quantized = data["US_ISM_MFC_EMPL"].df[:,:Quantized] 
,US_ISM_MFC_EMPL_Avg005 = data["US_ISM_MFC_EMPL"].df[:,:Avg005] 
,US_ISM_MFC_EMPL_Avg010 = data["US_ISM_MFC_EMPL"].df[:,:Avg010] 
,US_ISM_MFC_EMPL_Avg030 = data["US_ISM_MFC_EMPL"].df[:,:Avg030] 
,US_ISM_MFC_EMPL_Avg060 = data["US_ISM_MFC_EMPL"].df[:,:Avg060] 
,US_ISM_MFC_EMPL_Avg090 = data["US_ISM_MFC_EMPL"].df[:,:Avg090] 
,US_ISM_MFC_EMPL_Avg120 = data["US_ISM_MFC_EMPL"].df[:,:Avg120] 
,US_ISM_MFC_EMPL_Avg180 = data["US_ISM_MFC_EMPL"].df[:,:Avg180] 
 
,US_INIT_JOB_CLAIM_Original = data["US_INIT_JOB_CLAIM"].df[:,:Original] 
,US_INIT_JOB_CLAIM_Quantized = data["US_INIT_JOB_CLAIM"].df[:,:Quantized] 
,US_INIT_JOB_CLAIM_Avg005 = data["US_INIT_JOB_CLAIM"].df[:,:Avg005] 
,US_INIT_JOB_CLAIM_Avg010 = data["US_INIT_JOB_CLAIM"].df[:,:Avg010] 
,US_INIT_JOB_CLAIM_Avg030 = data["US_INIT_JOB_CLAIM"].df[:,:Avg030] 
,US_INIT_JOB_CLAIM_Avg060 = data["US_INIT_JOB_CLAIM"].df[:,:Avg060] 
,US_INIT_JOB_CLAIM_Avg090 = data["US_INIT_JOB_CLAIM"].df[:,:Avg090] 
,US_INIT_JOB_CLAIM_Avg120 = data["US_INIT_JOB_CLAIM"].df[:,:Avg120] 
,US_INIT_JOB_CLAIM_Avg180 = data["US_INIT_JOB_CLAIM"].df[:,:Avg180] 
 
,US_UNEMPLOY_RATE_Original = data["US_UNEMPLOY_RATE"].df[:,:Original] 
,US_UNEMPLOY_RATE_Quantized = data["US_UNEMPLOY_RATE"].df[:,:Quantized] 
,US_UNEMPLOY_RATE_Avg005 = data["US_UNEMPLOY_RATE"].df[:,:Avg005] 
,US_UNEMPLOY_RATE_Avg010 = data["US_UNEMPLOY_RATE"].df[:,:Avg010] 
,US_UNEMPLOY_RATE_Avg030 = data["US_UNEMPLOY_RATE"].df[:,:Avg030] 
,US_UNEMPLOY_RATE_Avg060 = data["US_UNEMPLOY_RATE"].df[:,:Avg060] 
,US_UNEMPLOY_RATE_Avg090 = data["US_UNEMPLOY_RATE"].df[:,:Avg090] 
,US_UNEMPLOY_RATE_Avg120 = data["US_UNEMPLOY_RATE"].df[:,:Avg120] 
,US_UNEMPLOY_RATE_Avg180 = data["US_UNEMPLOY_RATE"].df[:,:Avg180] 
  
,NVDA_Original = data["NVDA"].df[:,:Original] 
,NVDA_Quantized = data["NVDA"].df[:,:Quantized] 
,NVDA_Avg005 = data["NVDA"].df[:,:Avg005] 
,NVDA_Avg010 = data["NVDA"].df[:,:Avg010] 
,NVDA_Avg030 = data["NVDA"].df[:,:Avg030] 
,NVDA_Avg060 = data["NVDA"].df[:,:Avg060] 
,NVDA_Avg090 = data["NVDA"].df[:,:Avg090] 
,NVDA_Avg120 = data["NVDA"].df[:,:Avg120] 
,NVDA_Avg180 = data["NVDA"].df[:,:Avg180] 
 
,NRMGX_Original = data["NRMGX"].df[:,:Original] 
,NRMGX_Quantized = data["NRMGX"].df[:,:Quantized] 
,NRMGX_Avg005 = data["NRMGX"].df[:,:Avg005] 
,NRMGX_Avg010 = data["NRMGX"].df[:,:Avg010] 
,NRMGX_Avg030 = data["NRMGX"].df[:,:Avg030] 
,NRMGX_Avg060 = data["NRMGX"].df[:,:Avg060] 
,NRMGX_Avg090 = data["NRMGX"].df[:,:Avg090] 
,NRMGX_Avg120 = data["NRMGX"].df[:,:Avg120] 
,NRMGX_Avg180 = data["NRMGX"].df[:,:Avg180] 
 
,QCOM_Original = data["QCOM"].df[:,:Original] 
,QCOM_Quantized = data["QCOM"].df[:,:Quantized] 
,QCOM_Avg005 = data["QCOM"].df[:,:Avg005] 
,QCOM_Avg010 = data["QCOM"].df[:,:Avg010] 
,QCOM_Avg030 = data["QCOM"].df[:,:Avg030] 
,QCOM_Avg060 = data["QCOM"].df[:,:Avg060] 
,QCOM_Avg090 = data["QCOM"].df[:,:Avg090] 
,QCOM_Avg120 = data["QCOM"].df[:,:Avg120] 
,QCOM_Avg180 = data["QCOM"].df[:,:Avg180] 
 
,HD_Original = data["HD"].df[:,:Original] 
,HD_Quantized = data["HD"].df[:,:Quantized] 
,HD_Avg005 = data["HD"].df[:,:Avg005] 
,HD_Avg010 = data["HD"].df[:,:Avg010] 
,HD_Avg030 = data["HD"].df[:,:Avg030] 
,HD_Avg060 = data["HD"].df[:,:Avg060] 
,HD_Avg090 = data["HD"].df[:,:Avg090] 
,HD_Avg120 = data["HD"].df[:,:Avg120] 
,HD_Avg180 = data["HD"].df[:,:Avg180] 
 
,US_GDP_Q_Original = data["US_GDP_Q"].df[:,:Original] 
,US_GDP_Q_Quantized = data["US_GDP_Q"].df[:,:Quantized] 
,US_GDP_Q_Avg005 = data["US_GDP_Q"].df[:,:Avg005] 
,US_GDP_Q_Avg010 = data["US_GDP_Q"].df[:,:Avg010] 
,US_GDP_Q_Avg030 = data["US_GDP_Q"].df[:,:Avg030] 
,US_GDP_Q_Avg060 = data["US_GDP_Q"].df[:,:Avg060] 
,US_GDP_Q_Avg090 = data["US_GDP_Q"].df[:,:Avg090] 
,US_GDP_Q_Avg120 = data["US_GDP_Q"].df[:,:Avg120] 
,US_GDP_Q_Avg180 = data["US_GDP_Q"].df[:,:Avg180] 
 
,US_HOUS_STRS_M_Original = data["US_HOUS_STRS_M"].df[:,:Original] 
,US_HOUS_STRS_M_Quantized = data["US_HOUS_STRS_M"].df[:,:Quantized] 
,US_HOUS_STRS_M_Avg005 = data["US_HOUS_STRS_M"].df[:,:Avg005] 
,US_HOUS_STRS_M_Avg010 = data["US_HOUS_STRS_M"].df[:,:Avg010] 
,US_HOUS_STRS_M_Avg030 = data["US_HOUS_STRS_M"].df[:,:Avg030] 
,US_HOUS_STRS_M_Avg060 = data["US_HOUS_STRS_M"].df[:,:Avg060] 
,US_HOUS_STRS_M_Avg090 = data["US_HOUS_STRS_M"].df[:,:Avg090] 
,US_HOUS_STRS_M_Avg120 = data["US_HOUS_STRS_M"].df[:,:Avg120] 
,US_HOUS_STRS_M_Avg180 = data["US_HOUS_STRS_M"].df[:,:Avg180] 
 
,RUT_Original = data["RUT"].df[:,:Original] 
,RUT_Quantized = data["RUT"].df[:,:Quantized] 
,RUT_Avg005 = data["RUT"].df[:,:Avg005] 
,RUT_Avg010 = data["RUT"].df[:,:Avg010] 
,RUT_Avg030 = data["RUT"].df[:,:Avg030] 
,RUT_Avg060 = data["RUT"].df[:,:Avg060] 
,RUT_Avg090 = data["RUT"].df[:,:Avg090] 
,RUT_Avg120 = data["RUT"].df[:,:Avg120] 
,RUT_Avg180 = data["RUT"].df[:,:Avg180] 
 
,VIX_Original = data["VIX"].df[:,:Original] 
,VIX_Quantized = data["VIX"].df[:,:Quantized] 
,VIX_Avg005 = data["VIX"].df[:,:Avg005] 
,VIX_Avg010 = data["VIX"].df[:,:Avg010] 
,VIX_Avg030 = data["VIX"].df[:,:Avg030] 
,VIX_Avg060 = data["VIX"].df[:,:Avg060] 
,VIX_Avg090 = data["VIX"].df[:,:Avg090] 
,VIX_Avg120 = data["VIX"].df[:,:Avg120] 
,VIX_Avg180 = data["VIX"].df[:,:Avg180] 
 
,TPLGX_Original = data["TPLGX"].df[:,:Original] 
,TPLGX_Quantized = data["TPLGX"].df[:,:Quantized] 
,TPLGX_Avg005 = data["TPLGX"].df[:,:Avg005] 
,TPLGX_Avg010 = data["TPLGX"].df[:,:Avg010] 
,TPLGX_Avg030 = data["TPLGX"].df[:,:Avg030] 
,TPLGX_Avg060 = data["TPLGX"].df[:,:Avg060] 
,TPLGX_Avg090 = data["TPLGX"].df[:,:Avg090] 
,TPLGX_Avg120 = data["TPLGX"].df[:,:Avg120] 
,TPLGX_Avg180 = data["TPLGX"].df[:,:Avg180] 
 
,US_ISM_MFC_PMI_Original = data["US_ISM_MFC_PMI"].df[:,:Original] 
,US_ISM_MFC_PMI_Quantized = data["US_ISM_MFC_PMI"].df[:,:Quantized] 
,US_ISM_MFC_PMI_Avg005 = data["US_ISM_MFC_PMI"].df[:,:Avg005] 
,US_ISM_MFC_PMI_Avg010 = data["US_ISM_MFC_PMI"].df[:,:Avg010] 
,US_ISM_MFC_PMI_Avg030 = data["US_ISM_MFC_PMI"].df[:,:Avg030] 
,US_ISM_MFC_PMI_Avg060 = data["US_ISM_MFC_PMI"].df[:,:Avg060] 
,US_ISM_MFC_PMI_Avg090 = data["US_ISM_MFC_PMI"].df[:,:Avg090] 
,US_ISM_MFC_PMI_Avg120 = data["US_ISM_MFC_PMI"].df[:,:Avg120] 
,US_ISM_MFC_PMI_Avg180 = data["US_ISM_MFC_PMI"].df[:,:Avg180] 
 
,BRK_B_Original = data["BRK_B"].df[:,:Original] 
,BRK_B_Quantized = data["BRK_B"].df[:,:Quantized] 
,BRK_B_Avg005 = data["BRK_B"].df[:,:Avg005] 
,BRK_B_Avg010 = data["BRK_B"].df[:,:Avg010] 
,BRK_B_Avg030 = data["BRK_B"].df[:,:Avg030] 
,BRK_B_Avg060 = data["BRK_B"].df[:,:Avg060] 
,BRK_B_Avg090 = data["BRK_B"].df[:,:Avg090] 
,BRK_B_Avg120 = data["BRK_B"].df[:,:Avg120] 
,BRK_B_Avg180 = data["BRK_B"].df[:,:Avg180] 
 
,CRUDE_OIL_Original = data["CRUDE_OIL"].df[:,:Original] 
,CRUDE_OIL_Quantized = data["CRUDE_OIL"].df[:,:Quantized] 
,CRUDE_OIL_Avg005 = data["CRUDE_OIL"].df[:,:Avg005] 
,CRUDE_OIL_Avg010 = data["CRUDE_OIL"].df[:,:Avg010] 
,CRUDE_OIL_Avg030 = data["CRUDE_OIL"].df[:,:Avg030] 
,CRUDE_OIL_Avg060 = data["CRUDE_OIL"].df[:,:Avg060] 
,CRUDE_OIL_Avg090 = data["CRUDE_OIL"].df[:,:Avg090] 
,CRUDE_OIL_Avg120 = data["CRUDE_OIL"].df[:,:Avg120] 
,CRUDE_OIL_Avg180 = data["CRUDE_OIL"].df[:,:Avg180] 
 
,GOOG_Original = data["GOOG"].df[:,:Original] 
,GOOG_Quantized = data["GOOG"].df[:,:Quantized] 
,GOOG_Avg005 = data["GOOG"].df[:,:Avg005] 
,GOOG_Avg010 = data["GOOG"].df[:,:Avg010] 
,GOOG_Avg030 = data["GOOG"].df[:,:Avg030] 
,GOOG_Avg060 = data["GOOG"].df[:,:Avg060] 
,GOOG_Avg090 = data["GOOG"].df[:,:Avg090] 
,GOOG_Avg120 = data["GOOG"].df[:,:Avg120] 
,GOOG_Avg180 = data["GOOG"].df[:,:Avg180] 
 
,VINIX_Original = data["VINIX"].df[:,:Original] 
,VINIX_Quantized = data["VINIX"].df[:,:Quantized] 
,VINIX_Avg005 = data["VINIX"].df[:,:Avg005] 
,VINIX_Avg010 = data["VINIX"].df[:,:Avg010] 
,VINIX_Avg030 = data["VINIX"].df[:,:Avg030] 
,VINIX_Avg060 = data["VINIX"].df[:,:Avg060] 
,VINIX_Avg090 = data["VINIX"].df[:,:Avg090] 
,VINIX_Avg120 = data["VINIX"].df[:,:Avg120] 
,VINIX_Avg180 = data["VINIX"].df[:,:Avg180] 
 
,VBTLX_Original = data["VBTLX"].df[:,:Original] 
,VBTLX_Quantized = data["VBTLX"].df[:,:Quantized] 
,VBTLX_Avg005 = data["VBTLX"].df[:,:Avg005] 
,VBTLX_Avg010 = data["VBTLX"].df[:,:Avg010] 
,VBTLX_Avg030 = data["VBTLX"].df[:,:Avg030] 
,VBTLX_Avg060 = data["VBTLX"].df[:,:Avg060] 
,VBTLX_Avg090 = data["VBTLX"].df[:,:Avg090] 
,VBTLX_Avg120 = data["VBTLX"].df[:,:Avg120] 
,VBTLX_Avg180 = data["VBTLX"].df[:,:Avg180] 
 
,RERGX_Original = data["RERGX"].df[:,:Original] 
,RERGX_Quantized = data["RERGX"].df[:,:Quantized] 
,RERGX_Avg005 = data["RERGX"].df[:,:Avg005] 
,RERGX_Avg010 = data["RERGX"].df[:,:Avg010] 
,RERGX_Avg030 = data["RERGX"].df[:,:Avg030] 
,RERGX_Avg060 = data["RERGX"].df[:,:Avg060] 
,RERGX_Avg090 = data["RERGX"].df[:,:Avg090] 
,RERGX_Avg120 = data["RERGX"].df[:,:Avg120] 
,RERGX_Avg180 = data["RERGX"].df[:,:Avg180] 
 
,IXIC_Original = data["IXIC"].df[:,:Original] 
,IXIC_Quantized = data["IXIC"].df[:,:Quantized] 
,IXIC_Avg005 = data["IXIC"].df[:,:Avg005] 
,IXIC_Avg010 = data["IXIC"].df[:,:Avg010] 
,IXIC_Avg030 = data["IXIC"].df[:,:Avg030] 
,IXIC_Avg060 = data["IXIC"].df[:,:Avg060] 
,IXIC_Avg090 = data["IXIC"].df[:,:Avg090] 
,IXIC_Avg120 = data["IXIC"].df[:,:Avg120] 
,IXIC_Avg180 = data["IXIC"].df[:,:Avg180] 
  
,CRSP_Original = data["CRSP"].df[:,:Original] 
,CRSP_Quantized = data["CRSP"].df[:,:Quantized] 
,CRSP_Avg005 = data["CRSP"].df[:,:Avg005] 
,CRSP_Avg010 = data["CRSP"].df[:,:Avg010] 
,CRSP_Avg030 = data["CRSP"].df[:,:Avg030] 
,CRSP_Avg060 = data["CRSP"].df[:,:Avg060] 
,CRSP_Avg090 = data["CRSP"].df[:,:Avg090] 
,CRSP_Avg120 = data["CRSP"].df[:,:Avg120] 
,CRSP_Avg180 = data["CRSP"].df[:,:Avg180] 
 
,US_RETAIL_SALES_M_Original = data["US_RETAIL_SALES_M"].df[:,:Original] 
,US_RETAIL_SALES_M_Quantized = data["US_RETAIL_SALES_M"].df[:,:Quantized] 
,US_RETAIL_SALES_M_Avg005 = data["US_RETAIL_SALES_M"].df[:,:Avg005] 
,US_RETAIL_SALES_M_Avg010 = data["US_RETAIL_SALES_M"].df[:,:Avg010] 
,US_RETAIL_SALES_M_Avg030 = data["US_RETAIL_SALES_M"].df[:,:Avg030] 
,US_RETAIL_SALES_M_Avg060 = data["US_RETAIL_SALES_M"].df[:,:Avg060] 
,US_RETAIL_SALES_M_Avg090 = data["US_RETAIL_SALES_M"].df[:,:Avg090] 
,US_RETAIL_SALES_M_Avg120 = data["US_RETAIL_SALES_M"].df[:,:Avg120] 
,US_RETAIL_SALES_M_Avg180 = data["US_RETAIL_SALES_M"].df[:,:Avg180] 
  
,FB_Original = data["FB"].df[:,:Original] 
,FB_Quantized = data["FB"].df[:,:Quantized] 
,FB_Avg005 = data["FB"].df[:,:Avg005] 
,FB_Avg010 = data["FB"].df[:,:Avg010] 
,FB_Avg030 = data["FB"].df[:,:Avg030] 
,FB_Avg060 = data["FB"].df[:,:Avg060] 
,FB_Avg090 = data["FB"].df[:,:Avg090] 
,FB_Avg120 = data["FB"].df[:,:Avg120] 
,FB_Avg180 = data["FB"].df[:,:Avg180] 
 
,BABA_Original = data["BABA"].df[:,:Original] 
,BABA_Quantized = data["BABA"].df[:,:Quantized] 
,BABA_Avg005 = data["BABA"].df[:,:Avg005] 
,BABA_Avg010 = data["BABA"].df[:,:Avg010] 
,BABA_Avg030 = data["BABA"].df[:,:Avg030] 
,BABA_Avg060 = data["BABA"].df[:,:Avg060] 
,BABA_Avg090 = data["BABA"].df[:,:Avg090] 
,BABA_Avg120 = data["BABA"].df[:,:Avg120] 
,BABA_Avg180 = data["BABA"].df[:,:Avg180] 
  
,WMT_Original = data["WMT"].df[:,:Original] 
,WMT_Quantized = data["WMT"].df[:,:Quantized] 
,WMT_Avg005 = data["WMT"].df[:,:Avg005] 
,WMT_Avg010 = data["WMT"].df[:,:Avg010] 
,WMT_Avg030 = data["WMT"].df[:,:Avg030] 
,WMT_Avg060 = data["WMT"].df[:,:Avg060] 
,WMT_Avg090 = data["WMT"].df[:,:Avg090] 
,WMT_Avg120 = data["WMT"].df[:,:Avg120] 
,WMT_Avg180 = data["WMT"].df[:,:Avg180] 
 
,DJIA_Original = data["DJIA"].df[:,:Original] 
,DJIA_Quantized = data["DJIA"].df[:,:Quantized] 
,DJIA_Avg005 = data["DJIA"].df[:,:Avg005] 
,DJIA_Avg010 = data["DJIA"].df[:,:Avg010] 
,DJIA_Avg030 = data["DJIA"].df[:,:Avg030] 
,DJIA_Avg060 = data["DJIA"].df[:,:Avg060] 
,DJIA_Avg090 = data["DJIA"].df[:,:Avg090] 
,DJIA_Avg120 = data["DJIA"].df[:,:Avg120] 
,DJIA_Avg180 = data["DJIA"].df[:,:Avg180] 
 
,AAPL_Original = data["AAPL"].df[:,:Original] 
,AAPL_Quantized = data["AAPL"].df[:,:Quantized] 
,AAPL_Avg005 = data["AAPL"].df[:,:Avg005] 
,AAPL_Avg010 = data["AAPL"].df[:,:Avg010] 
,AAPL_Avg030 = data["AAPL"].df[:,:Avg030] 
,AAPL_Avg060 = data["AAPL"].df[:,:Avg060] 
,AAPL_Avg090 = data["AAPL"].df[:,:Avg090] 
,AAPL_Avg120 = data["AAPL"].df[:,:Avg120] 
,AAPL_Avg180 = data["AAPL"].df[:,:Avg180] 
 
,F_Original = data["F"].df[:,:Original] 
,F_Quantized = data["F"].df[:,:Quantized] 
,F_Avg005 = data["F"].df[:,:Avg005] 
,F_Avg010 = data["F"].df[:,:Avg010] 
,F_Avg030 = data["F"].df[:,:Avg030] 
,F_Avg060 = data["F"].df[:,:Avg060] 
,F_Avg090 = data["F"].df[:,:Avg090] 
,F_Avg120 = data["F"].df[:,:Avg120] 
,F_Avg180 = data["F"].df[:,:Avg180] 
 
,US_BUZ_INV_M_Original = data["US_BUZ_INV_M"].df[:,:Original] 
,US_BUZ_INV_M_Quantized = data["US_BUZ_INV_M"].df[:,:Quantized] 
,US_BUZ_INV_M_Avg005 = data["US_BUZ_INV_M"].df[:,:Avg005] 
,US_BUZ_INV_M_Avg010 = data["US_BUZ_INV_M"].df[:,:Avg010] 
,US_BUZ_INV_M_Avg030 = data["US_BUZ_INV_M"].df[:,:Avg030] 
,US_BUZ_INV_M_Avg060 = data["US_BUZ_INV_M"].df[:,:Avg060] 
,US_BUZ_INV_M_Avg090 = data["US_BUZ_INV_M"].df[:,:Avg090] 
,US_BUZ_INV_M_Avg120 = data["US_BUZ_INV_M"].df[:,:Avg120] 
,US_BUZ_INV_M_Avg180 = data["US_BUZ_INV_M"].df[:,:Avg180] 

)
 
describe(uber)

columns = print_columns_features(uber)
println()
 

record_count = size(uber)[1]
rows = 1:record_count
dates = format_dates( uber[rows,2] , "m/d/yy")

gr()
plot( dates, # x-axis: dates
     [ 
        uber[rows,8] uber[rows,18] uber[rows,27] uber[rows,35] uber[rows,45] uber[rows,53] uber[rows,65]  uber[rows,79]         
    ], # y-axis
    label = [      
        columns[8]     columns[18]   columns[27] columns[35] columns[53]    columns[65]    columns[79] "" 
    ],
    legend   =:topleft, 
              # :right, :left, :top, :bottom, :inside, :best, :legend, :topright, :topleft, :bottomleft, :bottomright
    xlabel   = "time",
    ylabel   = "indicators",
    size     = (980, 400), # width, height
    layout = (1, 1) # number of graphs: vertically, horizontally
    )

savefig("../images/indicators.png")

record_count = size(uber)[1]
today_rata = Dates.datetime2rata( today() )
today_id = find_day(uber, today_rata)

# I am putting overlap in the sets to see the behavior
df_training   = uber[1:today_id - 0,:] # train up x days ago.
df_prediction = uber[today_id - 90:record_count,:] # show predictions up to 90 days ago

println()

save_dataset(df_training,   "uber_training.csv"  , "../Data/processed/");
save_dataset(df_prediction, "uber_prediction.csv", "../Data/processed/");


