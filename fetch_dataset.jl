using CSV, DataFrames

function fetch_dataset(
    file_name="TPLGX", 
    date_format="yyyy.mm.dd", 
    dir="D:\\Drive\\market_indicators\\original\\")

    println("
        usage: 
            include(\"available_datasets.jl\") 
            dataset_file_name = available_datasets()[5,2] # row 5, column 2 = DJIA
            df = fetch_dataset(dataset_file_name)
    ")

    df = CSV.read(dir * file_name, dateformat=date_format)
    return df
end




