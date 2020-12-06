using DataFrames

mutable struct IndicatorData
  name::String
  file::String
  df::DataFrame
  min_rata_die::Int64 # minimum(df[:,1])
  max_rata_die::Int64 # maximum(df[:,1])
end


function addIndicator!(dict::Dict, name::String, file::String, original_date_format="yyyy-mm-dd" )
    df = fetch_dataset( file, "yyyy-mm-dd", dir )
    min_rata_die = minimum(df[:,1]) 
    max_rata_die = maximum(df[:,1]) 
    dict[name] = IndicatorData(name, file, df, min_rata_die, max_rata_die)
    return dict
end
