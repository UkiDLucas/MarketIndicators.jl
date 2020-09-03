# import Pkg; Pkg.add("CSV")
using CSV

# import Pkg; Pkg.add("Dates")
using Dates

# import Pkg; Pkg.add("DataFrames")
using DataFrames

file_ISM_Mfc_Emp = "data/united-states.ism-manufacturing-employment.csv"
file_Markkit_Mfc_PMI = "data/united-states.markit-manufacturing-pmi.csv"

println("Functions available:")
println("df = fetch_data(file_path, date_format=\"yyyy-mm-dd\" )")
println("df = shift_dates_by_days!(df, shift_days=-1, date_column=1)")

function fetch_data(file_path, date_format="yyyy-mm-dd")
    isfile(file_path) || # does file exist locally?
        download( string("https://raw.githubusercontent.com/UkiDLucas/MarketIndicators.jl/master/", file_path), # URL
        file_path) # save it as name
    

    
    return CSV.read(        # returns DataFrame
        file_path, 
        dateformat="$date_format"
        )
end

# TEST
#df = fetch_data(file_ISM_Mfc_Emp, "yyyy.mm.dd")

function shift_dates_by_days!(df::DataFrame, shift_days::Int64=-1, date_column::Int64=1)
    rows = size(df)[1]
    
    for row in 1:rows
        original = Date(df[row, date_column]) 
        shifted = original + Dates.Day(shift_days)
        println("original ", original, " ", shift_days, " shift ", shifted)
        df[row, date_column] = shifted
    end
    return df
end

# df = shift_dates_by_days!(df3, -90)


