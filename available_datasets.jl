using CSV, DataFrames

function available_datasets()
    file_name="_DataSets.csv"
    date_format="yyyy-mm-dd"
    df = CSV.read( file_name, dateformat=date_format)

    return df[:,[1,2]]
end

println("usage: df = available_datasets() # returns a DataFrame with all available data sets (name, file_path)")
println("usage: dataset_file_name = available_datasets()[5,2] # 5th dataset: DJIA, 2nd column: file-name")


