using CSV, DataFrames


if show_help
    println("
        usage:
              show_help = true
              include(\"dataset_IO.jl\") 
    ")
end




function available_datasets()
    file_name="_DataSets.csv"
    date_format="yyyy-mm-dd"
    df = CSV.read( file_name, dateformat=date_format)

    return df[:,[1,2]]
end

if show_help
    println("
        usage:
              # returns a DataFrame with all available data sets (name, file_path)
              df = available_datasets() 
    ")
    println("
        usage: 
              # 5th dataset: DJIA, 
              # 2nd column: file-name
              dataset_file_name = available_datasets()[5,2] 
    ")
end






function fetch_dataset(
    file_name="TPLGX", 
    date_format="yyyy.mm.dd", 
    dir="D:\\Drive\\market_indicators_data\\original\\"
    )

    df = CSV.read(dir * file_name, dateformat=date_format)
    return df
end


if show_help
    println("
        usage: 
              df = fetch_dataset(
                                 dataset_file_name, 
                                 date_format=\"u/dd/yy\", # format the saved dates are in
                                 dir=\"/mnt/data/indicators/original/\" ) # location of your data directory
    ")
end








function save_dataset(
    df::DataFrame,
    file_name="unknown", 
    dir="D:\\Drive\\market_indicators_data\\derived\\"
    )


    file_path = dir*file_name
    
    CSV.write(dir*file_name, df, delim=',', header=true)
    
    return file_path
end


if show_help
    println("
        usage: 
              include(\"dataset_IO.jl\") 
              file_path = save_dataset(
                                       df::DataFrame,
                                       file_name=\"my_file_name.csv\", 
                                       dir=\"/mnt/data/indicators/derived/\" ) # location of your data directory
    ")
end




