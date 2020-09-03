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
        # println("original ", original, " ", shift_days, " shift ", shifted)
        df[row, date_column] = shifted
    end
    return df
end

# df = shift_dates_by_days!(df3, -90)

first_date = Date("Jan. 1, 1900", "u. dd, yyyy")

day_one = Dates.datetime2rata(first_date) # typeof(rate_die) = Int64

function days_since_day_one(df, row, date_column) 
    date = df[row, date_column] # type Date
    rata_die = Dates.datetime2rata(date) 
    rata_die = rata_die - day_one
    return rata_die
end

function update_rata_die!(df, days_column=1, date_column=2)
    rows = size(df)[1] # first part of the returned tupple

    for row = 1:rows
        days = days_since_day_one(df, row, date_column)
        # println(days)
        df[row, days_column] = days
    end
    return df
end

function insert_rata_die_column(df)
    rows = size(df)[1] # first number of the tuple
    # https://stackoverflow.com/a/63731422/6312771
    insertcols!(df, 1,  :Day => 1:rows, makeunique=true) # insert as column 1, populate with 1,2,3,..
    update_rata_die!(df, days_column=1, date_column=2)
end


