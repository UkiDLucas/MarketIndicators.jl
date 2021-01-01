using DataFrames

mutable struct IndicatorData
  name::String
  file::String
  df::DataFrame
  min_rata_die::Int64 # minimum(df[:,1])
  max_rata_die::Int64 # maximum(df[:,1])
end


function addIndicator!(dict::Dict, symbol::String, dir = "../DATA/original/" )
    local file = symbol * ".csv"
    local df = fetch_local_CSV_as_DataFrame( file, "yyyy-mm-dd", dir )
    local min_rata_die = minimum(df[:,1]) 
    local max_rata_die = maximum(df[:,1]) 
    dict[symbol] = IndicatorData(symbol, file, df, min_rata_die, max_rata_die)
    return dict
end
