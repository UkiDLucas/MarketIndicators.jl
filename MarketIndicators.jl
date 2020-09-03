println("Functions available:")
println("df = fetch_data(file_path, date_format=\"yyyy-mm-dd\" )")

# import Pkg; Pkg.add("Dates")
using Dates

# import Pkg; Pkg.add("DataFrames")
using DataFrames

function fetch_data(file_path, date_format="yyyy-mm-dd")
    isfile(file_path) || # does file exist locally?
        download( string("https://raw.githubusercontent.com/UkiDLucas/MarketIndicators.jl/master/", file_path), # URL
        file_path) # save it as name
    

    
    return CSV.read(        # returns DataFrame
        file_path, 
        dateformat="$date_format"
        )
end

file_ISM_Mfc_Emp = "data/united-states.ism-manufacturing-employment.csv"
file_Markkit_Mfc_PMI = "data/united-states.markit-manufacturing-pmi.csv"

# import Pkg; Pkg.add("CSV")
using CSV

# TEST
df = fetch_data(file_ISM_Mfc_Emp, "yyyy.mm.dd")


